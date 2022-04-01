with Text_IO; use Text_IO;

procedure Parallel is
   
   type Matrix3x3 is array (1..3,1..3) of Long_Float;
   
   Hilbert_Matrix : Matrix3x3;
   
   function "*" (M1, M2 : Matrix3x3) return Matrix3x3
   is
      Result : Matrix3x3;
   begin
      for I in M1'Range(2) loop
         for J in M2'Range(1) loop
            Result(I,J) := 0.0;
            for K in M1'Range(1) loop
               Result(I,J) := Result(I,J) + M1(I,K)*M2(K,J);
            end loop;
         end loop;
      end loop;
      return Result;
   end;
   
   function Det (M : Matrix3x3) return Long_Float is
      ( 
        M(1,1)*M(2,2)*M(3,3) + 
        M(1,2)*M(2,3)*M(3,1) + 
        M(2,1)*M(3,2)*M(1,3) -
        M(1,3)*M(2,2)*M(3,1) - 
        M(2,1)*M(1,2)*M(3,3) - 
        M(1,1)*M(2,3)*M(3,2)
      );
      
   function Invert (M : Matrix3x3) return Matrix3x3 is
      D : Long_Float := Det (M);
      
      function Adjunct (P, Q : Integer) return Long_Float is
         A : array (1..2,1..2) of Long_Float;
         K, L : Integer;
         Coeff : Long_Float;
      begin
         K := 1; L := 1;
         for I in M'Range(1) loop
            if I /= P then 
               for J in M'Range(2) loop
                  if J /= Q then
                     A(K,L) := M(I,J);
                     L := L + 1;
                  end if;
               end loop;
               L := 1;
               K := K + 1;
            end if;
         end loop;
         if (P + Q) mod 2 = 0 then
            Coeff := 1.0;
         else
            Coeff := -1.0;
         end if;
         return Coeff * (A(1,1)*A(2,2) - A(1,2)*A(2,1));
      end;
      
   begin -- Invert
      return (
              ( Adjunct(1,1)/D, Adjunct(2,1)/D, Adjunct(3,1)/D ),
              ( Adjunct(1,2)/D, Adjunct(2,2)/D, Adjunct(3,2)/D ),
              ( Adjunct(1,3)/D, Adjunct(2,3)/D, Adjunct(3,3)/D )
             );
   end Invert;
   
   task Subtask_1;
   task Subtask_2;
   
   task body Subtask_1 is
      M : Matrix3x3 := Hilbert_Matrix;
   begin
      Put_Line ("This is a subtask 1");
      loop
         M := Invert (M);
      end loop;
   end;
   
   task body Subtask_2 is
      M : Matrix3x3 := Hilbert_Matrix;
   begin
      Put_Line ("This is a subtask 2");
      loop
         M := Invert (M);
      end loop;
   end;
   
   procedure Init_Hilbert (M : out Matrix3x3) is
   begin
      for I in M'Range(1) loop
         for J in M'Range(2) loop
            M(I,J) := 1.0 / Long_Float (I + J - 1);
         end loop;
      end loop;
   end Init_Hilbert;
   
begin
   Init_Hilbert (Hilbert_Matrix);
   Put_Line ("This is the MAIN task");
end;
