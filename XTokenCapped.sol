// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./XToken.sol";


abstract contract XTokenCapped is XToken{
    uint256 private _cap;

    
    constructor (uint256 cap) public {
        require(cap > 0, "XTokenCapped: cap is 0");
        _cap = cap;
    }

    
    function cap() public view returns (uint256) {
        return _cap;
    }

   
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        if (from == address(0)) { // When minting tokens
            require(totalSupply().add(amount) <= _cap, "XTokenCapped: cap exceeded");
        }
    }
}
