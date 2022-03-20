# Blockchain Club CFI project
This is a blockchain-based voting system with a voter address-assigning algorithm
Contracts are written in Solidity (advised to have Solidity compiler version > 0.4.21)

# key-pair.ipynb
This is a an algorithm to generate key pairs from the voter's credentials.
The unique credential which is private to the voter will be used to generate key pairs. Admins (the election-conducting organization) will be given access to open the portal, but won't be able to generate the key pairs themselves.
