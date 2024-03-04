pragma solidity >=0.8.18;

contract CyberCorgi is Ownable, ERC20 {

    event Before(address _address, uint _balanceBeforeTransfer);

    bool public _tradingStarted;
    uint256 public maxHoldingAmount = 25_000_000_000 * 10 ** decimals(); //no more than 2.5% of total supply per address
    uint _totalSupply = 1_000_000_000_000 * 10 ** decimals();

    constructor() ERC20("Cyber Corgi", "CYBRC") {
        _mint(msg.sender, _totalSupply);
        _tradingStarted = true;
    }


    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) override internal virtual {
      
        
        if (_tradingStarted) {
            uint balanceOfReciever = balanceOf(to);
            emit Before(to, balanceOfReciever);

            require(balanceOfReciever + amount <= maxHoldingAmount , "Anti Whale Protection. Cannot have more than 1.8% ot total supply");
        }
    }

    function burn(uint256 value) external {
        _burn(msg.sender, value);
    }
}
