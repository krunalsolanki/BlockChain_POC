pragma solidity ^0.4.0;
contract HelloWorld {
    string public strMessage;
    function setMessage (string strMsg) public   {
         strMessage=strMsg;
    } 
    function Remove() public {
        selfdestruct(0X0);
    }
}