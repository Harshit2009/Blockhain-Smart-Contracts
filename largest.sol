pragma solidity ^0.4.24;
contract largest {
 function largestof3(uint a, uint b, uint c) public pure returns(uint o_big)
 {
    o_big=(a>b)?((a>c)? a:c):(b>c)?b:c;
 return(o_big);
 }
}
//0xf8e81D47203A594245E36C48e151709F0C19fBe8