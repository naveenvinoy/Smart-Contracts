// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./XToken.sol";
import "./Pausable.sol";


abstract contract XTokenPausable is XToken, Pausable {
    
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        require(!paused(), "XTokenPausable: token transfer while paused");
    }
}
