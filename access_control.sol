pragma solidity >=0.4.22 <0.6.0;
contract File_Access_Control {

    struct  Access_Request_And_Response
    {
       
       string Req ;
       string Z_U ;
        
        
        
    }

    address private Owner;
    
    address payable private wallet;

    
    mapping(string => Access_Request_And_Response) private ACL;
    

    /// Create a new ballot with $(_numProposals) different proposals.
    constructor( address payable Owner_wallet) public {
        Owner = msg.sender;
        wallet = Owner_wallet;
    }
    
    
    function Set_Access_Request(  string memory req   , string memory req_id   )  public payable  returns (string memory)  {
        
        //require(msg.sender == owner);
        
        wallet.transfer(msg.value);
        
        ACL[req_id] = Access_Request_And_Response ( {Req:req , Z_U:""  });
        return "Done" ;
        
        
        
        
        
    }

    /// Give $(toVoter) the right to vote on this ballot.
    /// May only be called by $(chairperson).
   
}
