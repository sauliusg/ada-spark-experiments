with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Integer_Matrix_File is
   
   function Load_Integer_Matrix ( File : in File_Type ) return Integer_Matrix is
      M, N : Integer;
   begin
      Get (File, M);
      Get (File, N);
      
      declare
         Matrix : Integer_Matrix (1..M, 1..N);
      begin
         for I in Matrix'Range(1) loop
            for J in Matrix'Range(2) loop
               Get (File, Matrix (I,J));
            end loop;
         end loop;
         return Matrix;
      end;
   end;
   
   function Load_Integer_Matrix ( File_Name : String ) return Integer_Matrix is
      File : File_Type;
   begin
      Open (File, In_File, File_Name);
      declare
         M : Integer_Matrix := Load_Integer_Matrix (File);
      begin
         Close (File);
         return M;
      end;
   end;
   
   procedure Skip_To_Next_Matrix (File : File_Type) is
      Dummy : Boolean;
   begin
      Skip_To_Next_Matrix (File, Dummy);
   end;

   procedure Skip_To_Next_Matrix (File : File_Type; Empty_Line : out Boolean) is
      C, Dummy : Character;
      End_Of_Line : Boolean;
      Skipped_Lines : Integer := 0;
      
      procedure Safe_Inc (X : in out Integer) is
      begin
         if X < Integer'Last then
            X := X + 1;
         end if;
      end;
      
      procedure Skip_And_Count_Line
        (
         File : in File_Type;
         Count : in out Integer
        ) is
      begin
         Skip_Line (File);
         Safe_Inc (Count);
      end;
      
   begin
      Empty_Line := False;
      while not End_Of_File (File) loop
         End_Of_Line := False;
         while not End_Of_Line loop
            Look_Ahead (File, C, End_Of_Line);
            if not End_Of_Line then
               case C is
                  when '#' => 
                     Skip_And_Count_Line (File, Skipped_Lines);
                  when others =>
                     if C in '0' .. '9' then
                        if Skipped_Lines > 1 then
                           Empty_Line := True;
                        end if;
                        return;
                     else
                        Get (File, Dummy); -- skip the character
                     end if;
               end case;
            else
               if not End_Of_File (File) then
                  Skip_And_Count_Line (File, Skipped_Lines);
               end if;
            end if;
         end loop;
      end loop;
   end;
   
end;
