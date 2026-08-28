TODAY ?=                    $(shell date +%Y-%m-%d)
URIBASE=                    http://purl.obolibrary.org/obo
ONTBASE=                    $(URIBASE)/chebi/obophenotype
ROBOT=                      robot
VERSION=                    $(TODAY)
RELEASE_ASSETS = chebi_slim.owl chebi_slim.obo

MIR=                        true
CLEAN_FILES=                chebi.owl.gz chebi.owl

# Warning: When switching to ODK 1.7, this declaration will need to be
# updated to point to $(ODK_RESOURCES_DIR)/robot/plugins.
ROBOT_PLUGINS_DIRECTORY=    /tools/robot-plugins
export ROBOT_PLUGINS_DIRECTORY

ifeq ($(MIR),true)
mirror/chebi.owl.gz: clean
	curl -L $(URIBASE)/chebi.owl.gz --create-dirs -o $@ --retry 4 --max-time 200
.PRECIOUS: mirror/chebi.owl.gz
endif

mirror/chebi.owl: mirror/chebi.owl.gz
	$(ROBOT) convert -i $< -o $@
.PRECIOUS: mirror/chebi.owl

clean:
	rm -f $(foreach file, $(CLEAN_FILES), mirror/$(file))
.PHONY: clean

chebi_slim.owl chebi_slim.obo &: mirror/chebi.owl seed.txt
	$(ROBOT) annotate --input $< --remove-annotations \
	         odk:normalize --add-source true \
	         extract --term-file seed.txt --force true \
	                 --method BOT --individuals include \
	                 --copy-ontology-annotations true \
	         odk:normalize --subset-decls true --synonym-decls true \
	         annotate --ontology-iri $(ONTBASE)/chebi_slim.owl \
	                  --version-iri $(ONTBASE)/releases/$(VERSION)/chebi_slim.owl \
	                  --annotation owl:versionInfo $(VERSION) \
	         convert --format ofn --output chebi_slim.owl \
	         convert --format obo --check false \
	                 --clean-obo "strict drop-untranslatable-axioms" \
	                 --output chebi_slim.obo

.PRECIOUS: chebi_slim.owl chebi_slim.obo

.PHONY: all
all: $(RELEASE_ASSETS)

.PHONY: public_release
public_release:
	@test $(GHVERSION)
	ls -alt $(RELEASE_ASSETS)
	gh auth login
	gh release create $(GHVERSION) --title "$(VERSION)" --draft $(RELEASE_ASSETS) --generate-notes
