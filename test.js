const fs = require("fs");

const index = () => {
  const registeredTokens = fs.readdirSync("./mappings");
  const assetNames = [];
  for (const token of registeredTokens) {
    const assetName = hexToString(token.slice(56).split(".json")[0]);
    assetNames.push(assetName);
    if (assetName.toLowerCase().includes("cock")) {
      console.log(token);
      console.log(token.slice(0, 56));
    }
  }
};
const hexToString = (s) => {
  var hex = s.toString();
  var str = "";
  for (var n = 0; n < hex.length; n += 2) {
    str += String.fromCharCode(parseInt(hex.substr(n, 2), 16));
  }
  return str;
};

index();
