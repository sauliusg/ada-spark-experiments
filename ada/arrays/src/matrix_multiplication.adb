with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Matrix_Multiplication is
   
   pragma assertion_policy(check);

   procedure Multiply (M1, M2 : in Matrix; Result : out Matrix) is
   begin
      
      pragma Assert ( M1'Last(2) - M1'First(2) = M2'Last(1) - M2'First(1) );
      
      pragma Assert ( Result'First(1) = M1'First(1) );
      pragma Assert ( Result'Last(1) = M1'Last(1) );
      
      pragma Assert ( Result'First(2) = M2'First(2) );
      pragma Assert ( Result'Last(2) = M2'Last(2) );
      
      for I in M1'Range(1) loop
         for J in M2'Range(2) loop
            Result(I,J) := Zero;
            for K in M1'Range(2) loop
               Result(I,J) := Result(I,J) + M1(I,K) * M2(K,J);
            end loop;
         end loop;
      end loop;
      
   end;
   
end Matrix_Multiplication;
