/**
 *Submitted for verification at Etherscan.io on 2021-02-08
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

interface IPolyFaucet {
    function getTokens (uint256 _amount) external returns (bool);
}

interface IBokky {
    function drip() external;
}

interface IFauceteer {
    function drip(address token) external;
}

contract Faucet
{
    function _dump(address token) private {
        uint256 balance = IERC20(token).balanceOf(address(this));
        IERC20(token).transfer(msg.sender, balance);
    }
    
    function _fauceteer(address token) private {
        IFauceteer(0x8E78C7D0fA09F26858372898f0ECca808DaC7828).drip(token); 
        _dump(token);
        
    }
    
    function drip() public {
        // POLY
        IPolyFaucet(0x96A62428509002a7aE5F6AD29E4750d852A3f3D7).getTokens(5000 * 1e18); 
        _dump(0x96A62428509002a7aE5F6AD29E4750d852A3f3D7);
        
        // XEENUS
        IBokky(0x7E0480Ca9fD50EB7A3855Cf53c347A1b4d6A2FF5).drip(); 
        _dump(0x7E0480Ca9fD50EB7A3855Cf53c347A1b4d6A2FF5);
        
        // YEENUS
        IBokky(0xF6fF95D53E08c9660dC7820fD5A775484f77183A).drip();
        _dump(0xF6fF95D53E08c9660dC7820fD5A775484f77183A);
        
        // ZEENUS
        IBokky(0xC84f8B669Ccb91C86AB2b38060362b9956f2De52).drip(); 
        _dump(0xC84f8B669Ccb91C86AB2b38060362b9956f2De52);
        
        // WEENUS
        IBokky(0x101848D5C5bBca18E6b4431eEdF6B95E9ADF82FA).drip(); 
        _dump(0x101848D5C5bBca18E6b4431eEdF6B95E9ADF82FA);
        
        // BAT
        _fauceteer(0x443Fd8D5766169416aE42B8E050fE9422f628419);

        // COMP
         _fauceteer(0x1Fe16De955718CFAb7A44605458AB023838C2793);
        
        // DAI
        _fauceteer(0xc2118d4d90b274016cB7a54c03EF52E6c537D957);

        // KNC
        _fauceteer(0xF0A6664A0A8E95696BffB121A4fb0B1fC8C93d9E);
        
        // LINK
        _fauceteer(0xb19c7BFc9a7CbE4C35189d475725557A96bFb50A);
        
        // REP
        _fauceteer(0x6FD34013CDD2905d8d27b0aDaD5b97B2345cF2B8); 
        
         // SAI
        _fauceteer(0x26fF7457496600C63b3E8902C9f871E60eDec4e4); 

        // UNI
        _fauceteer(0x71d82Eb6A5051CfF99582F4CDf2aE9cD402A4882);

        // USDC
        _fauceteer(0x0D9C8723B343A8368BebE0B5E89273fF8D712e3C);  

        // USDT
        // _fauceteer(0x516de3a7A567d81737e3a46ec4FF9cFD1fcb0136);
        _fauceteer(0x8E78C7D0fA09F26858372898f0ECca808DaC7828);
        
        // WBTC
        _fauceteer(0xBde8bB00A7eF67007A96945B3a3621177B615C44);      
        
        // ZRX
        _fauceteer(0xE4C6182EA459E63B8F1be7c428381994CcC2D49c);
        
        // IERC20 sushi = IERC20(0x81DB9C598b3ebbdC92426422fc0A1d06E77195ec);
        
        // sushi.transfer(msg.sender, sushi.balanceOf(address(this)) / 1000);
    }
}