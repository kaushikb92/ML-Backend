pragma solidity ^0.4.8;

import "./LendCoin.sol";

contract LenderList is LendCoin {

    struct LenderIDs {
        bytes8 user;
    }
    
    uint len;
    uint i = 0;

    LenderIDs[] public ListOfLenders;
    mapping(bytes8 => uint) userROI;

    function addLender(
        bytes8 _user,
        uint256 _val,
        uint _rateOfInterest
    ) returns (
        bool _success
    ) {
        LenderIDs memory currentLender;
        currentLender.user = _user;
        userROI[_user] = _rateOfInterest;
        addCoin(_val, _user);
        ListOfLenders.push(currentLender);
        return true;
    }

    function getAllLenderList() constant returns (
        bytes8[],
        uint256[],
        uint[]) 
        {
            len = ListOfLenders.length;
            bytes8[] memory userList = new bytes8[](len);
            uint256[] memory amounts = new uint256[](len);
            uint[] memory interestRates = new uint[](len);
            for (i = 0; i < len; i++) {
                LenderIDs memory currentLender;
                currentLender = ListOfLenders[i];
                bytes8 _user = currentLender.user;
                uint amt = getBalance(_user);
                userList[i] = currentLender.user;
                amounts[i] = amt;
                interestRates[i] = userROI[_user];
            }
            return (userList,amounts,interestRates); 
    }

    function getLenderDetails(
        bytes8 _user) constant returns (
            uint256,
            uint
        ) {
            return (getBalance(_user), userROI[_user]);
        }

}