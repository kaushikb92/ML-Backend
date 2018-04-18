pragma solidity ^0.4.8;

contract UserRequest {

    struct Request {
        bytes8 lendId;
        uint256 amount;
        uint roi;
        uint tenure;
        bytes8 lenderId;
        bytes8 borrowerId;
    }

    struct UserReq {
        bytes8[] receiptId;
    }
    
    struct LendRequest {
        bytes8[] receiptId;
    }

    struct BorrowRequest {
        bytes8[] receiptId;
    }

    Request[] public Requests;

    mapping(bytes8 => Request) requestsByReceiptId;
    mapping(bytes8 => uint16) requestsTS;
    mapping(bytes8 => mapping(bytes8 => UserReq)) RequestsByUser;
    mapping(bytes8 => BorrowRequest) BorrowRequestsByUser;
    mapping(bytes8 => LendRequest) LendRequestsByUser;
    mapping(bytes8 => bool) lenderApproaveStatus;
    mapping(bytes8 => mapping (bytes8 => uint16)) loanApproaveTS;

    function addRequest(
        bytes8 _lendId,
        bytes8 _receiptId,
        uint256 _amount,
        uint _roi,
        uint _tenure,
        bytes8 _lender,
        bytes8 _borrower,
        uint16 _ts
    ) returns (
        bool success
    ) {
        Request memory currentRequest;
        currentRequest.amount = _amount;
        currentRequest.roi = _roi;
        currentRequest.tenure = _tenure;
        currentRequest.lenderId = _lender;
        currentRequest.borrowerId = _borrower;
        currentRequest.lendId = _lendId;
        Requests.push(currentRequest);

        requestsByReceiptId[_receiptId] = currentRequest;
        requestsTS[_receiptId] = _ts;
        RequestsByUser[_lender][_borrower].receiptId.push(_receiptId);
        LendRequestsByUser[_lender].receiptId.push(_receiptId);
        BorrowRequestsByUser[_borrower].receiptId.push(_receiptId);
        lenderApproaveStatus[_receiptId] = false;
        return true;
    }

    function approaveLoanRequest(
        bytes8 _receiptId,
        bytes8 _loanId,
        bytes8 _borrower,
        uint16 _ts
        ) returns (
        bool status
        ) {
            if (!lenderApproaveStatus[_receiptId]) {
                lenderApproaveStatus[_receiptId] = true;
                loanApproaveTS[_loanId][_borrower] = _ts;
                return true;
            } else {
                return true;
            }
        }

    function getReceiptIdsForLender(
        bytes8 _lender
        ) returns (
        bytes8[]
        ) {
            return (LendRequestsByUser[_lender].receiptId);
        } 

    function getReceiptIdsForLenderAndBorrower(
        bytes8 _lender,
        bytes8 _borrower
        ) returns (
        bytes8[]
        ) {
                return (RequestsByUser[_lender][_borrower].receiptId);
        }

    function getApprovalStatusWithTS(
            bytes8 _receiptId,
            bytes8 _loanId,
            bytes8 _borrower
        ) constant returns (
            bool _status,
            uint256 _ts
        ) {
            return (lenderApproaveStatus[_receiptId], loanApproaveTS[_loanId][_borrower] );
        }

    function getApprovalStatusWithTS(
            bytes8 _receiptId
        ) constant returns (
            bool _status
        ) {
            return (lenderApproaveStatus[_receiptId]);
        }

    function getReceiptByReceptId(
        bytes8 _receiptId
    ) constant returns (
        uint256,
        uint,
        uint,
        bytes8,
        bytes8,
        bool,
        uint16
    ) {
        return (
            requestsByReceiptId[_receiptId].amount,
            requestsByReceiptId[_receiptId].roi,
            requestsByReceiptId[_receiptId].tenure,
            requestsByReceiptId[_receiptId].lenderId,
            requestsByReceiptId[_receiptId].borrowerId,
            lenderApproaveStatus[_receiptId],
            requestsTS[_receiptId]
        );
    }

    function getReceiptIdsForBorrower(
        bytes8 _borrower
        ) returns (
        bytes8[]
        ) {
            return (BorrowRequestsByUser[_borrower].receiptId);
        } 

}