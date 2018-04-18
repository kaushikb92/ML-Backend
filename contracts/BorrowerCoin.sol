pragma solidity ^0.4.8;

contract BorrowerCoin {

    mapping(bytes8 => uint256) borrowerBalance;

    function addBorrowerBalance(
        bytes8 _user,
        uint256 _amount
    ) returns (
        bool success
    ) {
        if (borrowerBalance[_user] > 0) {
            borrowerBalance[_user] += _amount;
            return true;
        } else {
            borrowerBalance[_user] = _amount;
            return true;
        }
    }

    function getBorrowerBalance(
        bytes8 _user
    ) constant returns (
        uint256
    ) {
        return borrowerBalance[_user];
    }

    function withdrawBalance(
        bytes8 _user
    ) returns (
        bool success
    ) {
        borrowerBalance[_user] = 0;
        return true;
    }

}