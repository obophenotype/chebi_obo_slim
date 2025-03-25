TODAY ?=                    $(shell date +%Y-%m-%d)
URIBASE=                    http://purl.obolibrary.org/obo
ONTBASE=                    $(URIBASE)/chebi/obophenotype
ROBOT=                      robot
ANNOTATE_ONTOLOGY_VERSION = annotate -V $(ONTBASE)/releases/$(VERSION)/$@ --annotation owl:versionInfo $(VERSION)

MIR=                        true
CLEAN_FILES=                chebi.owl.gz chebi.owl

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

chebi_slim.owl: mirror/chebi.owl seed.txt
	$(ROBOT) extract -i $< -T seed.txt --force true --copy-ontology-annotations true --individuals include --method BOT \
		query --update sparql/preprocess-module.ru --update sparql/inject-subset-declaration.ru --update sparql/inject-synonymtype-declaration.ru --update sparql/postprocess-module.ru \
		convert -f ofn --output $@.tmp.owl && mv $@.tmp.owl $@
.PRECIOUS: chebi_slim.owl

chebi_slim.obo: chebi_slim.owl
	$(ROBOT) convert --input $< --check false -f obo -o $@.tmp.obo && grep -v ^owl-axioms $@.tmp.obo > $@ && rm $@.tmp.obo
.PRECIOUS: chebi_slim.obo

all: chebi_slim.owl chebi_slim.obo
