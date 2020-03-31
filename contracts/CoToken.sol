pragma solidity >=0.5.0;

import 'node_modules/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol';
import "./Ownable.sol";

contract CoToken is Ownable {
    using SafeMath for uint256;

    function totalSupply() external view returns(uint256);
    function balanceOf(address account) external view returns(uint256);
    function transfer​(​address​ recipient, ​uint256​ amount) ​external returns​(​bool​);
    function approve​(​address​ spender, ​uint256​ amount) ​external returns​ (​bool​);
    function transferFrom​(​address​ sender, ​address​ recipient,uint256​ amount) ​external​ ​returns​ (​bool​);
    function allowance​(​address​ owner, ​address​ spender) ​external view​ ​returns​ (​uint256​);
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    function name​() ​public​ ​view​ ​returns​ (​string​ ​memory​);
    function symbol​() ​public​ ​view​ ​returns​ (​string​ ​memory​);
    function decimals() public view returns (uint8);

    uint256 constant public ether_decimals = 10**18;
    uint256 constant public totalSupply);

    constructor() public {
        totalSupply_ = 100;
        balances[msg.sender] = _totalSupply;
    }
    
    function buyPrice(uint n) external view {
        //set poolbalace equal to current price of coin
        uint256 poolbalance = (0.005*totalSupply_**2) + 0.2*totalSupply_;
        // set newtotal equal to the current total plus the amount of n tokens
        uint256 newTotal = totalSupply_.add(n);

        buyprice = (0.005*newTotal**2) + 0.2*newTotal - poolbalance ether;
        return buyprice;
    }

    function sellPrice(uint n) external view {
        //set poolbalace equal to current price of coin
        uint256 poolbalance = (0.005*totalSupply_**2) + 0.2*totalSupply_;
        // set newtotal equal to the current total plus the amount of n tokens
        uint256 newTotal = totalSupply_.sub(n);

        buyprice = poolbalance - (0.005*newTotal**2) + 0.2*newTotal ether;
        return sellprice;
    }

    function mint(uint amount) public {
        uint256 currentprice = (0.005*totalSupply_**2) + 0.2*totalSupply_;
        require(currentprice == buyPrice(totalSupply_), "not correct price" );

        totalSupply_ = totalSupply_ + amount;
    }

    function burn(uint256 amount) public {
        require(msg.sender == owner);

        totalSupply -= amount;
        balanceOf[msg.sender] -= amount;
        price = sellPrice(amount)
        emit Transfer(msg.sender, address(0), amount, price);
    }

    function destroy() public onlyOwner {
        require(balances[owner] == totalSupply_ , "owner does not have all the tokens")
        selfdestruct(owner);
    }
}





    




}