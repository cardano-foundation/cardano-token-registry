with { pkgs = import ./nix { }; };
pkgs.mkShell {
  buildInputs = with pkgs; [
    bech32
    token-metadata-creator
    cardano-cli
    niv
    jq
    xxd
  ];
  shellHook = ''
    # In this directory, make a text file named "cardano-node-socket-path.txt"
    # with the path to the cardano node socket file for automatic export
    # of the cardano node socket path
    if [ -r ./cardano-node-socket-path.txt ]; then
      export CARDANO_NODE_SOCKET_PATH=$(< cardano-node-socket-path.txt)
    fi
    source <(cardano-cli --bash-completion-script cardano-cli)
  '';
}
