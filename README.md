# Merkle Tree for Whitelist
## Overview
This README provides an explanation of how a Merkle Tree is used in the Whitelist smart contract to store and verify the list of addresses allowed to mint NFTs. The Merkle Tree is a data structure that allows for efficient storage and verification of large datasets. The Whitelist contract utilizes the Merkle Tree to store the root of the tree, which can be used to verify if a specific address is part of the whitelist or not.

### Installation
To use the Whitelist contract and the Merkle Tree, you will need to have the following installed:

```
npm i
```

## Usage
The Whitelist contract stores the root of the Merkle Tree in its constructor. When a user wants to check if their address is part of the whitelist, they call the checkInWhitelist function, passing in a proof and maxAllowanceToMint variable. The maxAllowanceToMint variable keeps track of the maximum number of NFTs a given address can mint.

The value stored in the Merkle Tree for this use case is the address of the user along with the number of NFTs they are allowed to mint. The hash of the leaf node on which this address exists can be computed by encoding the address of the sender and maxAllowanceToMint into a bytes string, which is then passed down to the keccak256 hash function to generate the hash.

The OpenZeppelin's MerkleProof library is used to verify that the proof sent by the user is valid. The library performs the verification on a high level similar to the verification of the Merkle proof discussed earlier in the tutorial.

## Conclusion
The Merkle Tree is a powerful data structure that enables efficient storage and verification of large datasets. In the Whitelist contract, it is used to store the list of addresses allowed to mint NFTs. By using the Merkle Tree and the OpenZeppelin's MerkleProof library, the contract is able to efficiently verify if a specific address is part of the whitelist or not.