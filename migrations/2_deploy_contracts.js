var CalcInsLib = artifacts.require("./CalcInsLib.sol");
var LendCoin = artifacts.require("./LendCoin.sol");
var UserRegister = artifacts.require("./UserRegister.sol");
var LenderList = artifacts.require("./LenderList.sol");


module.exports = function(deployer) {
  deployer.deploy(CalcInsLib);
  deployer.deploy(LendCoin);
  deployer.deploy(UserRegister);
  deployer.link(LendCoin, LenderList);
  deployer.deploy(LenderList);
};
