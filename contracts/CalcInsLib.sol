pragma solidity ^0.4.8;

library CalcInsLib {
	function calculateInstallment(
        uint256 _amount,
        uint _rateOfInterest,
        uint _tenureInMonths) returns (
        uint installmentAmount)
	{
		return ((_amount + ((_amount * _rateOfInterest) / 100)) / _tenureInMonths);
	}
}