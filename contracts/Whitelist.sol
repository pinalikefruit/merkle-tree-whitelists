// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract Whitelist {
    bytes32 public s_merkleRoot;

    constructor(bytes32 merkleRoot) {
        s_merkleRoot = merkleRoot;
    }

    function checkInWhitelist(
        bytes32[] calldata proof,
        uint64 maxAllowanceToMint
    ) public view returns (bool) {
        bytes32 leaf = keccak256(abi.encode(msg.sender, maxAllowanceToMint));
        bool verified = MerkleProof.verify(proof, s_merkleRoot, leaf);
        return verified;
    }
}
