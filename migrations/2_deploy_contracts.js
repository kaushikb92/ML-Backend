var CalcInsLib = artifacts.require("./CalcInsLib.sol");
var LendCoin = artifacts.require("./LendCoin.sol");
var UserRegister = artifacts.require("./UserRegister.sol");
var LenderList = artifacts.require("./LenderList.sol");
var AllTransactions = artifacts.require("./AllTransactions.sol");
var BorrowerCoin = artifacts.require("./BorrowerCoin.sol");
var BorrowerInstallments = artifacts.require("./BorrowerInstallments.sol");
var UserRequest = artifacts.require("./UserRequest.sol");


module.exports = function(deployer) {
  // deployer.deploy(CalcInsLib);
  deployer.deploy(LendCoin);
  deployer.deploy(UserRegister);
  // deployer.link(LendCoin, LenderList);
  deployer.deploy(LenderList);
  deployer.deploy(AllTransactions);
  deployer.deploy(BorrowerCoin);
  deployer.deploy(UserRequest);
  // deployer.link(BorrowerCoin, BorrowerInstallments);
  deployer.deploy(BorrowerInstallments);
};
