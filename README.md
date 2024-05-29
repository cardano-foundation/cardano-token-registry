# CIP26 Off-Chain Metadata Registry (mainnet)
T\

#### New registration

New submissions to this registry will take the form of a GitHub Pull Request with the addition of one JSON file to the [mappings/](mappings) folder. Submissions will be subject to automated checking for well-formedness and human vetting before being merged to the registry.


#### Updating existing entries

Modification of entries in this registry require a GitHub Pull Request with the modification of one JSON file in the [mappings/](mappings) folder.  Submissions will be subject to automated checking for well-formedness and human vetting before being merged to the registry. 


## Semantic content of registry entries

Each entry contains the following information:

**Name**             | **Required/Optional**|**Description**
---              | ---       | ---
`subject`        | Required  | The base16-encoded policyId + base16-encoded assetName
`name`           | Required  | A human-readable name for the subject, suitable for use in an interface
`description`    | Required  | A human-readable description for the subject, suitable for use in an interface
`policy`         | Optional  | The base16-encoded CBOR representation of the monetary policy script, used to verify ownership. Optional in the case of Plutus scripts as verification is handled elsewhere.
`ticker`         | Optional  | A human-readable ticker name for the subject, suitable for use in an interface
`url`            | Optional  | A HTTPS URL (web page relating to the token)
`logo`           | Optional  | A PNG image file as a byte string
`decimals`       | Optional  | how many decimals to the token

The policy field is optional in order to support Plutus Smart-Contracts which are not linked to a set of signing keys by default. It is used in priority if present. Otherwise, signature verification is performed using user-provided trusted keys.

For a comprehensive description of all fields and how to generate them, please see [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools).  

## Submission well-formedness rules

1. Submissions to the registry must consist of a single commit, directly off the **master** branch of the **cardano-token-registry** repository.

2. Submissions must add or modify a singular file in the [mappings/](mappings) folder. Multiple mappings should be split across multiple PRs.

3. The file name must match the encoded `"subject"` key of the entry, all lowercase.

4. The maximum file size of a single metadata entry is 370KB.


##  Server

Users and applications can query this registry through an API at `https://tokens.cardano.org/metadata`.

The API documentation and source code for the server implementation is available with the [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools).        
            
Use of the `https://tokens.cardano.org/metadata` API is subject to the [API Terms of Use](API_Terms_of_Use.md).  

   
## Step-by-Step Guide

See [Wiki](https://github.com/cardano-foundation/cardano-token-registry/wiki).
