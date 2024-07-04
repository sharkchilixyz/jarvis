// SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

contract Mock {
    string public name = "Mamba Token";
    string public symbol = "MT";

    uint256 public totalSupply = 1000000000;

    mapping(address => uint256) private _balances;

    constructor(address owner) {
        _balances[owner] = totalSupply;
    }

    function transfer(address to, uint256 amount) external {
        require(_balances[msg.sender] >= amount, "Not enough tokens");

        _balances[msg.sender] -= amount;
        _balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }
}
