pragma solidity >=0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity >=0.8.18;

contract CyberCorgi is Ownable, ERC20 {

    uint _totalSupply = 1_000_000_000_000 * 10 ** decimals();

    constructor() ERC20("Cyber Corgi", "CYBERCORGI") {
        _mint(msg.sender, _totalSupply);
    }

    function burn(uint256 value) external {
        _burn(msg.sender, value);
    }

    
}
