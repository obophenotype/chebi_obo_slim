# CHEBI OBO Slim

A slimmed down version of CHEBI sufficient to cover 99% of the term needs across OBO ontologies.

## Maintainers

- @matentzn
- @shawntanzk

## How to add additional terms?

1. Make a Pull request on https://github.com/obophenotype/chebi_obo_slim/blob/main/seed.txt. In the PR, indicate which terms you are adding (at least the ids) and for which ontology.
2. If you are a member of obophenotype organisation:
   - You should make sure seed.txt is sorted alphanumerically by running `python scripts/sort.py`
   - Merge the changes without review at your own discretion
3. If you are not a member of obophenotype organisation:
   - Wait until a member of obophenotype deals with your PR

## How to become a maintainer?

Open a an issue on the [issue tracker](https://github.com/obophenotype/chebi_obo_slim/issues) with a request to join.

## How to run a release?

1. Clone the repo
1. From within the repo run `sh odk.sh make all` (you need to have docker installed)
1. Commit any changed files to branch, make PR
1. Ask for a review from another maintainer
1. After a single approval, merge
1. Make a GitHub release with the usual OBO tag (i.e. v2022-09-21)

Note that running the `sh odk.sh make all` command above will forcefully
refresh the local CHEBI mirror by downloading the latest available
version of CHEBI. If that is not desired (if for some reasons you want
to make a new release based on the exact same version as a previous
release, _without_ updating to a more recent CHEBI), you may call that
command as `sh odk.sh make all MIR=false`. You may only do that if you
also ran the previous release. If the previous release was made by
someone else, you _must_ ensure that you are using a version of CHEBI
that is at least as recent as the one used for the last release, and the
easiest way to ensure that is to always get the latest version (which is
the default behaviour, when you do not use `MIR=false`).
