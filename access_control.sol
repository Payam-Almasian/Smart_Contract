pragma solidity ^0.5.1;

contract Access_Control {
    
    
    address public owner ; 
    
    mapping ( uint256 => string)  Access_Policy ;
    mapping ( uint256 => string)  File_Directory ;

    constructor() public {
    
         owner = msg.sender;
        
    }


    function get_file_access_policy( uint256 FileID ) public view returns (string memory) {
        return File_Directory[FileID] ;
    }
    
    
    function set_file_access_policy( uint256 id , string memory access_policy) public {
        require(msg.sender == owner);
        File_Directory[id] = access_policy ;
    }
    
    

    function get_file_desc( uint256 FileID ) public view returns (string memory) {
        return File_Directory[FileID] ;
    }
    
    
    function set_file_desc( uint256 id , string memory desc) public {
        require(msg.sender == owner);
        File_Directory[id] = desc ;
    }
    
    
}
