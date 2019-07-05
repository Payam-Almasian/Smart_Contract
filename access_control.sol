pragma solidity ^0.5.1;

contract Access_Control {
    
    
    struct  File
    {
       
       string Name ;
       string Access_Policy ;
       mapping ( string => string)  CP_ABE ; 
        
        
    }
    
    mapping ( uint256 => File)  Shared_Files ;
    
    address  owner ; 
    

    constructor() public {
    
         owner = msg.sender;
        
    }
    
    uint numFiles;
    
    function CREATE_FILE(  string memory Owner_File_Name   , string memory Owner_Access_Policy  , string memory Owner_ABE_KEY ,  string memory USER_ID  ) public {
        
        require(msg.sender == owner);
        
        numFiles++;
        
        Shared_Files[numFiles] = File ( {Name:Owner_File_Name , Access_Policy:Owner_Access_Policy  });
        Shared_Files[numFiles].CP_ABE[USER_ID] = Owner_ABE_KEY ;
        
        // File Uploaded_file = fooStruct({foo:1, fighter:2});
        
        
    }
    
    
    function get_file_name( uint256 File_Name ) public view returns (string memory) {
        
        return Shared_Files[File_Name].Name ;
        
        
    }
    
    function get_file_access_policy( uint256 File_Name ) public view returns (string memory) {
        
        return Shared_Files[File_Name].Access_Policy ;
        
        
    }
    
    function get_file_cp_abe_key( uint256 File_Name , string memory UserID ) public view returns (string memory) {
        
        return Shared_Files[File_Name].CP_ABE[UserID] ;
        
        
    }
    
    
    
    
    
}
