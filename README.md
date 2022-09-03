# CHEBI OBO Slim

A slimmed down version of CHEBI sufficient to cover 99% of the term needs across OBO ontologies.

## Maintainers

- @matentzn
- @shawntanzk

## How to add additional terms?

1. Make a Pull request on https://github.com/obophenotype/chebi_obo_slim/blob/main/seed.txt. In the PR, indicate which terms you are adding (at least the ids) and for which ontology.
2. If you are a member of obophenotype organisation:
   - You should make sure seed.txt is sorted alphanumerically
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

