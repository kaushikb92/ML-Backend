pragma solidity ^0.4.8;

import "./LendCoin.sol";
import "./UserRequest.sol";
import "./BorrowerCoin.sol";
import "./CalcInsLib.sol";

contract BorrowerInstallments is LendCoin, BorrowerCoin {

    function payInstallment(
        bytes8 _borrower,
        bytes8 _lender,
        bytes8 _lendId,
        uint256 _amount,
        uint _tenure,
        uint _roi,
        bytes8 _receiptId
    ) returns (
        bool success
    ) {
        uint256 eachInstallment = CalcInsLib.calculateInstallment(_amount,_roi,tenure);
        

    }

}