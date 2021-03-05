# cardano-token-registry

:warning: This service is not yet live. Any pull requests will be __closed__. :warning: 

##  Background
This repository provides a means to register off-chain token metadata that can map to on-chain identifiers (typicaly hashes representing asset IDs, output locking scripts or token forging policies)

A [server](#server) exposes the functionality of a key-value store, allowing users and applications to query registry entries through a public RESTful api.

While this registry is limited in scope to handle native tokens only, it will also serve to facilitate a discussion and introduce a standard for a metadata distribution system that will be put forward as a [CIP](https://cips.cardano.org/).

Use of this registry is subject to the following [Registry Terms of Use](Registry_Terms_of_Use.md).           
Use of the public API is subject to the following [API Terms of Use](API_Terms_of_Use.md).

## Process

#### New registration

New submissions to this registry will take the form of a Github pull request with the addition of one or more JSON files to the [mappings/](mappings) folder. Submissions will be subject to automated checking for well-formedness and human vetting before being merged to the registry.


#### Updating existing entries

Modification of entries in this registry will take the form of a Github pull request with the modification of one or more JSON files in the [mappings/](mappings) folder. Submissions will be subject to automated checking for well-formedness and human vetting before being merged to the registry.


## Semantic content of registry entries
Each entry contains the following information:

name             | necessity | description
---              | ---       | ---
`subject`        | required  | the asset fingerprint, a bech32-encoded blake2b-160 digest of the concatenation of the policyId and asset name
`policy`         | required  | the script which hashes to the policyId
`name`           | required  | a human-readable name for the subject, suitable for use in an interface
`description`    | required  | a human-readable description for the subject, suitable for use in an interface
`ticker`.        | optional  | a human-readable ticker name for the subject, suitable for use in an interface
`unit`           | optional  | a unit name and unit decimal for the token.
`url`            | optional  | a https url (web page relating to the token)
`logo`           | optional  | a PNG image file as a byte string

For a comprehensive description of all fields and how to generate them, please see [cardano-metadata-submitter](https://github.com/input-output-hk/cardano-metadata-submitter)  

                       

## Submission well-formedness rules

1. Submissions to the registry must consist of a single commit, directly off the **master** branch of the **cardano-token-registry** repository.

2. Submissions must add or modify files in the [mappings/](mappings) folder.

3. The file name part of the file must match the encoded `"subject"` key of the entry, (all lowercase).

4. The maximum file size of a single metadata entry is 370KB.


##  Server

Users and applications can query this registry through a public api available at `https://tokens.cardano.org/metadata`.

The API documentation can be generated from the [OpenAPI specification](https://github.com/input-output-hk/metadata-server/blob/master/specifications/api/openapi.yaml).        
            
Use of this API is subject to the following [API Terms of Use](API_Terms_of_Use.md)).  

   
## Step-by-Step Guide

See [Wiki](https://github.com/cardano-foundation/cardano-token-registry/wiki).
