pragma solidity ^0.4.8;

import "./BorrowerCoin.sol";

contract BorrowerInstallments is BorrowerCoin {

    struct Installment {
        bytes8 loanId;
        bytes8 borrower;
        bytes8 lender;
        uint16 ts;
    }

    mapping(bytes8 => Installment) installmentsByReceiptIds;

    struct UserInstallment {
        bytes8[] installmentreceiptIds;
    }

    mapping(bytes8 => UserInstallment) UserInstallments;

    uint len = 0;
    uint i = 0;

    function calculateInstallment(
        uint256 _amount,
        uint _rateOfInterest,
        uint _tenureInMonths) returns (
        uint installmentAmount)
	{
		return ((_amount + ((_amount * _rateOfInterest) / 100)) / _tenureInMonths);
	}

    function payInstallment(
        bytes8 _borrower,
        bytes8 _lender,
        bytes8 _loanId,
        uint256 _amount,
        uint _tenure,
        uint _roi,
        bytes8 _receiptId,
        uint16 _ts
    ) returns (
        bool success
    ) {
        uint256 eachInstallment = calculateInstallment(_amount,_roi,_tenure);
        addBorrowerBalance(_borrower,eachInstallment);

        Installment memory currentInstallment;
        currentInstallment.loanId = _loanId;
        currentInstallment.borrower = _borrower;
        currentInstallment.lender = _lender;
        currentInstallment.ts = _ts;
        installmentsByReceiptIds[_receiptId] = currentInstallment;
        UserInstallments[_borrower].installmentreceiptIds.push(_receiptId); 
        UserInstallments[_lender].installmentreceiptIds.push(_receiptId);

        return true;
    }

    function getLenderInstallments(
        bytes8 _lender
    ) constant returns (
        bytes8[],
        bytes8[],
        bytes8[],
        bytes8[],
        uint16[]
    ) {
        len = UserInstallments[_lender].installmentreceiptIds.length;
        bytes8[] memory receiptIds = new bytes8[](len);
        bytes8[] memory loanIds = new bytes8[](len);
        bytes8[] memory lenderIds = new bytes8[](len);
        bytes8[] memory borrowerIds = new bytes8[](len);
        uint16[] memory tss = new uint16[](len);

        receiptIds = UserInstallments[_lender].installmentreceiptIds;
        for ( i = 0; i < len; i++){
            bytes8 _currentReceiptId = receiptIds[i];
            loanIds[i] = installmentsByReceiptIds[_currentReceiptId].loanId;
            lenderIds[i] = installmentsByReceiptIds[_currentReceiptId].lender;
            borrowerIds[i] = installmentsByReceiptIds[_currentReceiptId].borrower;
            tss[i] = installmentsByReceiptIds[_currentReceiptId].ts;
        }
        return (receiptIds,loanIds,lenderIds,borrowerIds,tss);
    }

}