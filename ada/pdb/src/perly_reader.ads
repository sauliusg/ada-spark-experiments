with Ada.Text_IO;         use Ada.Text_IO;

package Perly_Reader is
   
   function Get_Current_File_Line return String;
   
   function End_Of_All_Files return Boolean;
   
private
   Is_STDIN : Boolean := False;
   Current_File : File_Type;
   Current_Argument : Integer := 0;
   
end Perly_Reader;         
