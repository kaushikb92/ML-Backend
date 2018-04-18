pragma solidity ^0.4.8;

import "./LendCoin.sol";

contract LenderList is LendCoin {

    struct LoanIDs {
        bytes8 loanId;
    }

    mapping(bytes8 => bytes8) public LoanOwners; 
    
    uint len;
    uint i = 0;
    uint j = 0;
    uint len2;

    LoanIDs[] public ListOfLoans;
    mapping(bytes8 => uint) loanROI;

    function addLender(
        bytes8 _user,
        uint256 _val,
        uint _rateOfInterest,
        bytes8 _loanId
    ) returns (
        bool _success
    ) {
        LoanIDs memory currentLoan;
        currentLoan.loanId = _loanId;
        loanROI[_loanId] = _rateOfInterest;
        LoanOwners[_loanId] = _user;
        addCoin(_val, _user,_loanId);
        ListOfLoans.push(currentLoan);
        return true;
    }

    function getAllLenderList() constant returns (
        bytes8[],
        bytes8[],
        uint256[],
        uint[]) 
        {
            len = ListOfLoans.length;
            bytes8[] memory userList = new bytes8[](len);
            uint256[] memory amounts = new uint256[](len);
            uint[] memory interestRates = new uint[](len);
            bytes8[] memory loanids = new bytes8[](len);
            // for (i = 0; i < len; i++) {
            //     LenderIDs memory currentLender;
            //     currentLender = ListOfLenders[i];
            //     bytes8 _user = currentLender.user;
            //     loanIds = getUserLendIds(_user);
            //     len2 = loanIds.length;
            //     for (j = 0; j < len2; j++){
            //         uint amt = getBalance(_user, loanIds[j]);

            //     }
                
            //     userList[i] = currentLender.user;
            //     amounts[i] = amt;
            //     interestRates[i] = userROI[_user];
            // }

            for (i = 0; i<len; i++) {
                LoanIDs memory currentLoan;
                currentLoan = ListOfLoans[i];
                bytes8 _loanId = currentLoan.loanId;
                userList[i] = LoanOwners[_loanId];
                interestRates[i] = loanROI[_loanId];
                amounts[i] = getBalance(userList[i], _loanId);
                loanids[i] = _loanId;
            }

            return (loanids,userList,amounts,interestRates);
    }

    function getLenderDetails(
        bytes8 _user
        ) constant returns (
            bytes8[],
            uint256[],
            uint[]
        ) {
            len = getUserLendIds(_user).length;
            bytes8[] memory loanids = getUserLendIds(_user);
            uint256[] memory amounts = new uint256[](len);
            uint[] memory interestRates = new uint[](len);

            for ( i = 0; i < loanids.length; i++ ) {
                bytes8 _currentLoan = loanids[i];
                amounts[i] = getBalance(_user, _currentLoan);
                interestRates[i] = loanROI[_currentLoan];
            }
            return (loanids,amounts,interestRates);
        }

}