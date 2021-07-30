WAX_PATH=~/vault/mainnet/wallets/waxcoin

ID=$(cat $WAX_PATH/waxcoin-policy-id)
NAME=$(echo -n "waxcoin" | xxd -ps)

SUBJECT=$ID$NAME

rm $SUBJECT*

token-metadata-creator entry --init $SUBJECT

token-metadata-creator entry $SUBJECT \
  --name "WaxCoin" \
  --description "WaxCoin - hard and stylish." \
  --policy $WAX_PATH/policy.script


token-metadata-creator entry $SUBJECT \
  --ticker "WAXC" \
  --logo "waxcoin-128.png" \
  --decimals 0


token-metadata-creator entry $SUBJECT \
  -a $WAX_PATH/policy.skey


token-metadata-creator entry $SUBJECT --finalize
