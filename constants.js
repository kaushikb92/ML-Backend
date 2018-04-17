var UserRegAbi = [{"constant":true,"inputs":[{"name":"_user","type":"bytes8"},{"name":"_password","type":"bytes32"}],"name":"getLogin","outputs":[{"name":"_loginStatus","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_user","type":"bytes8"},{"name":"_password","type":"bytes32"},{"name":"_fName","type":"bytes32"},{"name":"_lName","type":"bytes32"},{"name":"_userAddress","type":"address"}],"name":"addUser","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"_user","type":"bytes8"}],"name":"getWallet","outputs":[{"name":"_walletAddress","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"_user","type":"bytes8"}],"name":"getUser","outputs":[{"name":"_fName","type":"bytes32"},{"name":"_lName","type":"bytes32"}],"payable":false,"type":"function"}];

var LendCoinAbi = [{"constant":true,"inputs":[{"name":"_user","type":"bytes8"}],"name":"getBalance","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_lender","type":"bytes8"},{"name":"_borrower","type":"bytes8"},{"name":"_amount","type":"uint256"}],"name":"tranferBalance","outputs":[{"name":"sufficient","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_val","type":"uint256"},{"name":"_user","type":"bytes8"}],"name":"addCoin","outputs":[],"payable":false,"type":"function"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"bytes8"},{"indexed":true,"name":"_to","type":"bytes8"},{"indexed":false,"name":"_value","type":"uint256"}],"name":"Lend","type":"event"}];

var LenderListAbi = [{"constant":false,"inputs":[{"name":"_user","type":"bytes8"},{"name":"_rateOfInterest","type":"uint256"}],"name":"addLender","outputs":[{"name":"_success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"_user","type":"bytes8"}],"name":"getLenderROI","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"ListOfLenders","outputs":[{"name":"user","type":"bytes8"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getAllLenderList","outputs":[{"name":"","type":"bytes8[]"},{"name":"","type":"uint256[]"}],"payable":false,"type":"function"}];

var calcInstalmentAbi = [{"constant":false,"inputs":[{"name":"_amount","type":"uint256"},{"name":"_rateOfInterest","type":"uint256"},{"name":"_tenureInMonths","type":"uint256"}],"name":"calculateInstallment","outputs":[{"name":"installmentAmount","type":"uint256"}],"payable":false,"type":"function"}];

var UserRegAddr = 0x39034662e688c9998fbd635c4ac8be1db2616eab;

var LendCoinAddr = 0x3792ae842edc9faf35cdfdcd9de69cfcadd5924c;

var LenderListAddr = 0x4012f34d6ba836d9934719ea50c4213e94c01cb4;

var calcInstalmentAddr = 0xd5a096a186abce5d39a2ef0d14fe374309ed96bf;

export const web3 = new Web3(new Web3.providers.HttpProvider("http://cilblockchain2.uksouth.cloudapp.azure.com/api"));
