pragma solidity ^0.4.24;
contract Simple {
 function arithmetic(uint _a, uint _b) public pure returns (uint o_sum, uint o_sub, uint o_mul, uint o_div, uint o_mod)
 {
 o_sum = _a + _b;
 o_sub = _a -_b;
 o_mul = _a * _b;
 o_div = _a / _b;
 o_mod = _a %_b;
 }
}

//0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8