{ sources ? import ./sources.nix }:
with {
  overlay = self: super: {
    inherit (import sources.nixpkgs-unstable {}) niv;
    inherit (import sources.cardano-node { gitrev = sources.cardano-node.rev; }) cardano-cli;
    inherit (import sources.cardano-node { gitrev = sources.cardano-node.rev; }) bech32;
    inherit (import sources.offchain-metadata-tools {}) token-metadata-creator;
  };
};
import sources.nixpkgs {
  overlays = [ overlay ];
  config = {};
}
