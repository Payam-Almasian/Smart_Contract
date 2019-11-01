pragma solidity >=0.4.22 <0.6.0;
contract File_Access_Control {

    struct  Access_Request_And_Response
    {
       
       string Req ;
       string Z_U ;
        
        
        
    }

    address private Owner;
    
    mapping(string => Access_Request_And_Response) private ACL;
    

    /// Create a new ballot with $(_numProposals) different proposals.
    constructor() public {
        Owner = msg.sender;
        
    }
    
    
    function Set_Access_Request(  string memory req   , string memory req_id   )  public payable  returns (string memory)  {
        
        //require(msg.sender == owner);
        
        
        ACL[req_id] = Access_Request_And_Response ( {Req:req , Z_U:""  });
        return "Done" ;
        
        
        // File Uploaded_file = fooStruct({foo:1, fighter:2});
        
        
    }

    /// Give $(toVoter) the right to vote on this ballot.
    /// May only be called by $(chairperson).
   
}
