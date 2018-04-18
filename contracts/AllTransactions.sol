pragma solidity ^0.4.8;

contract AllTransactions {

    uint i = 0;
    uint len = 0;

    struct LoanApproaved{
        bytes8 loanId;
        bytes8 borrower;
        bytes8 lender;
        uint256 amount;
        uint roi;
        uint tenure;
        uint16 ts;
    }

    LoanApproaved[] public AllLoanApproaved;

    struct InstallmentTx{
        bytes8 loanId;
        bytes8 borrower;
        bytes8 lender;
        uint256 insAmount;
        uint16 ts;
    }

    InstallmentTx[] public AllInstallmentTxs;

    function addLoanApproavedTxs(
        bytes8 _loanId,
        bytes8 _borrower,
        bytes8 _lender,
        uint256 _amount,
        uint _roi,
        uint _tenure,
        uint16 _ts
    ) returns (
        bool success
    ) {
        LoanApproaved memory currentLoanTx;
        currentLoanTx.loanId = _loanId;
        currentLoanTx.borrower = _borrower;
        currentLoanTx.lender = _lender;
        currentLoanTx.amount = _amount;
        currentLoanTx.roi = _roi;
        currentLoanTx.tenure = _tenure;
        currentLoanTx.ts = _ts;
        AllLoanApproaved.push(currentLoanTx);

        return true;
    }

    function addInstallmentTx(
        bytes8 _loanId,
        bytes8 _borrower,
        bytes8 _lender,
        uint256 _insAmount,
        uint16 _ts
    ) returns (
        bool success
    ) {
        InstallmentTx memory currentInstallment;
        currentInstallment.loanId = _loanId;
        currentInstallment.borrower = _borrower;
        currentInstallment.lender = _lender;
        currentInstallment.insAmount = _insAmount;
        currentInstallment.ts = _ts;
        AllInstallmentTxs.push(currentInstallment);
        
        return true;
    }

    function getLoanApproavedTxs() constant returns (
        bytes8[],
        bytes8[],
        bytes8[],
        uint256[],
        uint[],
        uint[],
        uint16[]
    ) {
        len = AllLoanApproaved.length;
        bytes8[] memory loanIds = new bytes8[](len);
        bytes8[] memory borrowers = new bytes8[](len);
        bytes8[] memory lenders = new bytes8[](len);
        uint256[] memory amounts = new uint256[](len);
        uint[] memory rois = new uint[](len);
        uint[] memory tenures = new uint[](len);
        uint16[] memory tss = new uint16[](len);

        for( i = 0; i < len; i++){
            LoanApproaved memory currentLoanTx;
            currentLoanTx = AllLoanApproaved[i];
            loanIds[i] = currentLoanTx.loanId;
            borrowers[i] = currentLoanTx.borrower;
            lenders[i] = currentLoanTx.lender;
            amounts[i] = currentLoanTx.amount;
            rois[i] = currentLoanTx.roi;
            tenures[i] = currentLoanTx.tenure;
            tss[i] = currentLoanTx.ts;
        }
        return (loanIds, borrowers, lenders, amounts, rois, tenures, tss );
    }

    function getInstallmentTxs() constant returns (
        bytes8[],
        bytes8[],
        bytes8[],
        uint256[],
        uint16[]
    ) {
        len = AllLoanApproaved.length;
        bytes8[] memory loanIds = new bytes8[](len);
        bytes8[] memory borrowers = new bytes8[](len);
        bytes8[] memory lenders = new bytes8[](len);
        uint256[] memory installmentAmounts = new uint256[](len);
        uint16[] memory tss = new uint16[](len);

        for( i = 0; i < len; i++){
            InstallmentTx memory currentInstallment;
            currentInstallment = AllInstallmentTxs[i];
            loanIds[i] = currentInstallment.loanId;
            borrowers[i] = currentInstallment.borrower;
            lenders[i] = currentInstallment.lender;
            installmentAmounts[i] = currentInstallment.insAmount;
            tss[i] = currentInstallment.ts;
        }
        return (loanIds, borrowers, lenders, installmentAmounts, tss );
    }

}

