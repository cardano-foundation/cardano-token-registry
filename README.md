![GPAY](https://user-images.githubusercontent.com/91656801/135476316-97fe6e5b-69d8-4c2d-aabb-5c7fac2d05d2.png)
# cardano-token-registry

##  Background
This repository provides a means to register off-chain token metadata that can map to on-chain identifiers (typically hashes representing asset IDs, output locking scripts, or token forging policies).

A [server](#server) exposes the functionality of a key-value store, allowing users and applications to query registry entries through a RESTful API.

While this registry is limited in scope to handle native tokens only, it will also serve to facilitate a discussion and introduce a standard for a metadata distribution system that is currently put forward as a [draft CIP](https://github.com/michaelpj/CIPs/blob/cip-metadata-server/cip-metadata-server.md).

Use of this registry is subject to the [Registry Terms of Use](Registry_Terms_of_Use.md).           
Use of the public API is subject to the [API Terms of Use](API_Terms_of_Use.md).

## Process

#### New registration

New submissions to this registry will take the form of a GitHub Pull Request with the addition of one JSON file to the [mappings/](mappings) folder. Submissions will be subject to automated checking for well-formedness and human vetting before being merged to the registry.


#### Updating existing entries

Modification of entries in this registry require a GitHub Pull Request with the modification of one JSON file in the [mappings/](mappings) folder.  Submissions will be subject to automated checking for well-formedness and human vetting before being merged to the registry. 


## Semantic content of registry entries



**Name**         | **Required/Optional**|(GPAY)Global pay currency is a token created on the Cardano network
---              | ---       | ---
`subject`        | Required  |Policy Id: dd5c3cebfbdef5c37aff39980e85e48ea80c9cde855a97d16105e2c4 | Asset Name: GPAY (47504159)
`name`           | Required  | GPAY
`description`    | Required  |The global payment currency is a native Cardano token, it is an asset of the future exchangeable from person to person without the intermediation of a third party or a financial institution.Its network displacement is equal to ADA allowing transactions in seconds, confirmations in minutes, even on Sundays and holidays, 365 days a year
`policy`         | Optional  | The base16-encoded CBOR representation of the monetary policy script, used to verify ownership. Optional in the case of Plutus scripts as verification is handled elsewhere.
`ticker`         | Optional  | A human-readable ticker name for the subject, suitable for use in an interface
`url`            | Optional  | https://globalpaycurrency.com
`logo`           | Optional  | A PNG image file as a byte string
`decimals`       | Optional  | 18 decimals

The policy field is optional in order to support Plutus Smart-Contracts which are not linked to a set of signing keys by default. It is used in priority if present. Otherwise, signature verification is performed using user-provided trusted keys.

For a comprehensive description of all fields and how to generate them, please see [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools).  

## Submission well-formedness rules

1. Submissions to the registry must consist of a single commit, directly off the **master** branch of the **cardano-token-registry** repository.

2. Submissions must add or modify a singular file in the [mappings/](mappings) folder. Multiple mappings should be split accross multiple PRs.

3. The file name must match the encoded `"subject"` key of the entry, all lowercase.

4. The maximum file size of a single metadata entry is 370KB.


##  Server

Users and applications can query this registry through an API at `https://tokens.cardano.org/metadata`.

The API documentation and source code for the server implementation is available with the [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools).        
            
Use of the `https://tokens.cardano.org/metadata` API is subject to the [API Terms of Use](API_Terms_of_Use.md).  

   
## Step-by-Step Guide

See [Wiki](https://github.com/cardano-foundation/cardano-token-registry/wiki).
