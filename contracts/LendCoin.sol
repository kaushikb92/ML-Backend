pragma solidity ^0.4.4;

contract LendCoin {

	mapping (bytes8 => mapping ( bytes8 => uint256)) balances;

	event Lend(bytes8 indexed _from, bytes8 indexed _to, uint256 _value);

    struct UserLendId {
        bytes8[] lendId;
    }

    mapping(bytes8 => UserLendId) userLendIds;

	function addCoin(
        uint256 _val,
        bytes8 _lendId,
        bytes8 _user
        ) returns (
        bool _status
        ) {
		balances[_user][_lendId] = _val;
        userLendIds[_user].lendId.push(_lendId);
        return true;
	}

	function transferBalance(
        bytes8 _lender,
        bytes8 _borrower,
        bytes8 _lendId,
        uint _amount) returns(
        bool sufficient) 
        {
		if (balances[_lender][_lendId] < _amount) 
            return false;
		balances[_lender][_lendId] -= _amount;
		balances[_borrower][_lendId] += _amount;
		Lend(_lender, _borrower, _amount);
		return true;
	}

    function getUserLendIds(
        bytes8 _user
        ) constant returns (
        bytes8[]
        ) {
            return userLendIds[_user].lendId;
        }

	function getBalance(
        bytes8 _user,
        bytes8 _lendId
        ) constant returns (
        uint256) 
        {
		return balances[_user][_lendId];
	}
}
