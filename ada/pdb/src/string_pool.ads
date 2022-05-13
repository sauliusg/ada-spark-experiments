package String_Pool is
   
   procedure Add (S : in String);
   procedure Add (S : in String; Pos : out Integer);
   function Lookup (S : String) return Integer;
   function Contains (S : String) return Boolean;
   function Get_String (I : Integer) return String;
   
private
   Current : Natural := 0;
   
   type String_Pool_Type is array (Integer range <>) of 
     access String;
   
   String_Pool : access String_Pool_Type := new String_Pool_Type (1..1000);
   
end String_Pool;
