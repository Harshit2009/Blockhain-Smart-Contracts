pragma solidity ^0.4.24;
contract calculator{
 int private lastValue = 0;
 function Add(int a, int b) public returns(int){
 lastValue = a + b;
 return lastValue;
 }
 function Subtract(int a,int b) public returns (int){
 lastValue = a - b;
 return lastValue;
 }
 function LastOperation() public view returns (int){
 return lastValue;
 }
}