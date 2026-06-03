# Cardano Token Registry — CIP-26 Off-Chain Metadata (mainnet)

This is the [CIP-26](https://cips.cardano.org/cip/CIP-0026) off-chain metadata registry for the Cardano **mainnet**, maintained by the Cardano Foundation.

> **Registering testnet metadata?** This registry is mainnet-only. For assets that exist on the public testnets (e.g. preview and preprod), use the [metadata-registry-testnet from IOHK](https://github.com/input-output-hk/metadata-registry-testnet). See [Network environments](#network-environments) for how to query testnet metadata.

## Background

This repository provides a means to register off-chain token metadata that maps to on-chain identifiers (typically hashes representing asset IDs, output locking scripts, or token forging policies).

A [hosted metadata server](#network-environments) exposes the functionality of a key-value store, allowing users and applications to query registry entries through a RESTful API.

While this registry is limited in scope to native tokens, it also serves to facilitate discussion and introduce a standard for a metadata distribution system, originally put forward as the [CIP-26 metadata server proposal](https://cips.cardano.org/cip/CIP-0026).

Use of this registry is subject to the [Registry Terms of Use](Registry_Terms_of_Use.md).
Use of the public API is subject to the [API Terms of Use](API_Terms_of_Use.md).

## Network environments

The Cardano Foundation operates a Token Metadata Server for both mainnet and preprod. Each instance combines:

- **CIP-68 (on-chain)** metadata read directly from that network's chain, and
- **CIP-26 (off-chain)** metadata sourced from the corresponding registry repository.

| Network | Base URL | OpenAPI docs | CIP-26 source |
| --- | --- | --- | --- |
| Mainnet | `https://tokens.cardano.org` | `https://tokens.cardano.org/apidocs` | this repository ([cardano-token-registry](https://github.com/cardano-foundation/cardano-token-registry)) |
| Preprod | `https://preprod.tokens.cardano.org` | `https://preprod.tokens.cardano.org/apidocs` | [metadata-registry-testnet](https://github.com/input-output-hk/metadata-registry-testnet) |

Both instances expose the same API v2 endpoints, so you can query testnet metadata by reusing the same requests against the `https://preprod.tokens.cardano.org` base URL. A single subject can be looked up at:

```
GET https://tokens.cardano.org/metadata/{subject}
```

The API documentation and the source code for the server implementation are available with [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools).

Use of the `https://tokens.cardano.org/metadata` API is subject to the [API Terms of Use](API_Terms_of_Use.md).

For a broader walkthrough of querying token metadata across networks, see the [Cardano Developer Portal — Token Registry guide](https://developers.cardano.org/docs/native-tokens/token-registry/cardano-token-registry/).

## How to register

Submissions and updates take the form of a GitHub Pull Request against this repository. Every PR is subject to automated well-formedness checks and human vetting before it is merged.

- **New registration** — add a single JSON file to the [mappings/](mappings) folder.
- **Updating an existing entry** — modify a single JSON file in the [mappings/](mappings) folder.

For a step-by-step walkthrough (including how to generate fields and sign entries), see the [Wiki](https://github.com/cardano-foundation/cardano-token-registry/wiki) and [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools).

### Submission well-formedness rules

1. Submissions must consist of a single commit, directly off the **master** branch of the **cardano-token-registry** repository.
2. Submissions must add or modify a single file in the [mappings/](mappings) folder. Multiple mappings should be split across multiple PRs.
3. The file name must match the encoded `subject` key of the entry, all lowercase.
4. The maximum file size of a single metadata entry is 370 KB.

## Semantic content of registry entries

Each entry contains the following information:

| **Name** | **Required/Optional** | **Description** |
| --- | --- | --- |
| `subject` | Required | The base16-encoded policyId + base16-encoded assetName |
| `name` | Required | A human-readable name for the subject, suitable for use in an interface |
| `description` | Required | A human-readable description for the subject, suitable for use in an interface |
| `policy` | Optional | The base16-encoded CBOR representation of the monetary policy script, used to verify ownership. Optional in the case of Plutus scripts as verification is handled elsewhere. |
| `ticker` | Optional | A human-readable ticker name for the subject, suitable for use in an interface |
| `url` | Optional | An HTTPS URL (web page relating to the token) |
| `logo` | Optional | A PNG image file as a byte string |
| `decimals` | Optional | How many decimals the token has |

The `policy` field is optional in order to support Plutus smart contracts, which are not linked to a set of signing keys by default. It is used in priority when present; otherwise, signature verification is performed using user-provided trusted keys.

For a comprehensive description of all fields and how to generate them, see [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools).

## Related resources

- [CIP-26 — Cardano Off-Chain Metadata](https://cips.cardano.org/cip/CIP-0026)
- [CIP-68 — Datum Metadata Standard](https://cips.cardano.org/cip/CIP-0068)
- [offchain-metadata-tools](https://github.com/input-output-hk/offchain-metadata-tools) — server implementation and tooling
- [metadata-registry-testnet (IOHK)](https://github.com/input-output-hk/metadata-registry-testnet) — testnet off-chain metadata
- [Cardano Developer Portal — Token Registry](https://developers.cardano.org/docs/native-tokens/token-registry/cardano-token-registry/)
- [Registry Wiki](https://github.com/cardano-foundation/cardano-token-registry/wiki)
