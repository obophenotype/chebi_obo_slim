# External Ontology Term Requests

This document tracks requests for terms from external ontologies that are related to or needed by users of the CHEBI OBO Slim project.

## Background

While this repository focuses on maintaining a slimmed-down version of CHEBI (Chemical Entities of Biological Interest) ontology, users sometimes need complementary terms from other OBO Foundry ontologies for their research and data integration needs.

## How to Request Terms from Other Ontologies

### OBA (Ontology of Biological Attributes)

To request new terms from the Ontology of Biological Attributes:

1. Visit the OBA issue tracker: https://github.com/obophenotype/bio-attribute-ontology/issues
2. Create a new issue with the title "New term request: [your term name]"
3. Include the following information:
   - **Preferred term name**: The name you'd like for the new term
   - **Definition**: A clear, precise definition of the term
   - **Use case**: How you plan to use this term
   - **Related terms**: Any existing terms that are similar or related
   - **References**: Scientific publications or other sources that support the need for this term

## Active Requests

### OBA:123 - "cool trait"

**Status**: Pending submission to OBA repository  
**Requested by**: Issue #43  
**Description**: Request for OBA:123 to represent "cool trait"  
**Next steps**: 
- Create issue at https://github.com/obophenotype/bio-attribute-ontology/issues
- Provide proper definition and use case for "cool trait"
- Include scientific justification for the term

**Template for OBA issue submission**:
```
Title: New term request: cool trait

**Preferred term name**: cool trait

**Definition**: [Definition needed - please provide a clear, scientific definition]

**Use case**: [Please describe how this term will be used in research/data annotation]

**Related terms**: [List any similar or related terms in OBA or other ontologies]

**References**: [Provide scientific publications or other sources supporting this term]

**Additional context**: This term was requested in relation to CHEBI OBO Slim usage (obophenotype/chebi_obo_slim#43)
```

## Notes for Maintainers

- This file tracks external term requests that arise from CHEBI OBO Slim usage
- When requests are submitted to external repositories, update the status here
- Include links to the external issues once they are created
- Consider whether requested external terms indicate gaps in CHEBI coverage