pragma solidity ^0.4.8;

contract UserRegister {

    struct User {
        bytes32 fName;
        bytes32 lName;
    }

    mapping(bytes8 => User) userDetails;
    mapping(bytes8 => address) userWallets;
    mapping(bytes8 => bytes32) userLogin;

    function addUser(
        bytes8 _user, 
        bytes32 _password, 
        bytes32 _fName,
        bytes32 _lName,
        address _userAddress) returns (
        bool success) 
        {
            User memory currentUser;
            currentUser.fName = _fName;
            currentUser.lName = _lName;
            userDetails[_user] = currentUser;
            userWallets[_user] = _userAddress;
            userLogin[_user] = _password;

            return true;
    }

    function getLogin(
        bytes8 _user,
        bytes32 _password
    ) constant returns (
        bool _loginStatus)
        {
            if (userLogin[_user] == _password) {
                return true;
            } else {
                return false;
            }
    }

    function getWallet(
        bytes8 _user
    ) constant returns(
        address _walletAddress)
        {
            return userWallets[_user];
        }

    function getUser(
        bytes8 _user
    )   constant returns(
        bytes32 _fName,
        bytes32 _lName) 
        {
            return (userDetails[_user].fName, userDetails[_user].lName);
    }
}