pragma solidity >=0.4.22 <0.6.0;
contract File_Access_Control {

    struct  Access_Request_And_Response
    {
       
       string Req ;
       string Z_U ;
       uint256 Paid_Price;
        
        
        
    }

    address private Owner;
    
    address payable private wallet;

    
    mapping(string => Access_Request_And_Response) private ACL;
    

    constructor() public {
        Owner = msg.sender;
        
    }
    
    
    function Set_Access_Request(  string memory req   , string memory req_id   )  public payable  returns (string memory)  {
        
        //require(msg.sender == owner);
        
        wallet.transfer(msg.value);
        
        ACL[req_id] = Access_Request_And_Response ( {Req:req , Z_U:""  , Paid_Price:msg.value });
        return "Done" ;
        
        

        
    }
    
    function Set_Access_Response ( string memory req_id , string memory Owner_Z_U  ) public returns (string memory)
    {
        require(msg.sender == Owner);
        Access_Request_And_Response memory Temp = ACL[req_id] ;
        Temp.Z_U=Owner_Z_U ;
        ACL[req_id] = Temp ;
        return "Done" ; 
        
    }
    
    
    function Get_Req( string memory req_id) public view returns ( string memory , string memory , string memory  )
    {
        
        return ( req_id ,  ACL[req_id].Req , ACL[req_id].Z_U ) ;
    
    }
    
    
    function Revoke ( string memory req_id) public returns ( string memory   )
    {
        require(msg.sender == Owner);
        delete ACL[req_id];
        return "Done" ;
        
    }

 
   
}
