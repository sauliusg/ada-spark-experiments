-- pragma Ada_2022;

with Ada.Text_IO;  use Ada.Text_IO;

with Integer_Matrices; use Integer_Matrices;
with Lazy_Determinant; use Lazy_Determinant;
with Lazy_Check_TU;    use Lazy_Check_TU;

procedure List_TU_Matrices is
   
   M : Integer_Matrix (1..4, 1..4);
   
   Z : constant Integer_Matrix (1..4, 1..4) := 
     (
      (0,0,0,0),
      (0,0,0,0), 
      (0,0,0,0), 
      (0,0,0,0)
     );
   
   procedure Generate_Matrices
     (
      A : in out Integer_Matrix;
      I, J : Integer;
      Last : in out Boolean
     ) is
   begin
      
      if A (I,J) = 0 then
         A (I,J) := 1;
      elsif A (I,J) = 1 then
         A (I,J) := -1;
      else
         if I = A'Last(1) and then J = A'Last(2) then
            Last := True;
         else
            A (I,J) := 0;
            if J < A'Last(2) then
               Generate_Matrices (A, I, J + 1, Last);
            else
               Generate_Matrices (A, I + 1, 1, Last);
            end if;
         end if;
      end if;      
      
   end Generate_Matrices;
   
   procedure Generate_Matrices
     (
      A : in out Integer_Matrix;
      Last : in out Boolean
     ) is
   begin
      Generate_Matrices (A, 1, 1, Last);
   end;
   
   Last : Boolean := False;
   
   Count : Integer := 0;
   
   function Cyclic_Group_Order (A : Integer_Matrix) return Integer is
      Unity : Integer_Matrix (A'First(1) .. A'Last(1), 
                              A'First(2) .. A'Last(2)) :=
        (others => (others => 0));
      
      R : Integer_Matrix := A;
      Order : Integer := 1;
      Max_Order : Integer := 100;
      
   begin
      for I in Unity'Range(1) loop
         Unity (I,I) := 1;
      end loop;
      loop
         exit when R = Unity;
         R := R * A;
         Order := Order + 1;
         if Order > Max_Order then
            return -Max_Order;
         end if;
      end loop;
      return Order;
   exception 
      when CONSTRAINT_ERROR =>
         return -1;
   end;
   
begin
   
   M := Z;
   
   while not Last loop
      Count := Count + 1;
      Put (Count'Image);
      Put (ASCII.HT);
      Put (Integer'Image(Trace(M)));
      Put (ASCII.HT);
      Put (Integer'Image(Det(M)));
      Put (ASCII.HT);
      Put (Integer'Image(Cyclic_Group_Order(M)));
      Put (ASCII.HT);
      Put (Boolean'Image(Is_Total_Unimodular(M)));
      Put (ASCII.HT);
      Put (Boolean'Image(Is_Total_Unimodular(M * M)));
      Put (ASCII.HT);
      Put (Boolean'Image(Is_Total_Unimodular(M * M * M)));
      Put (ASCII.HT);
      Put (Boolean'Image(Is_Total_Unimodular(M * M * M * M)));
      Put (ASCII.HT);
      Put (Boolean'Image(Is_Total_Unimodular(M * M * M * M * M)));
      Put (ASCII.HT);
      Put_Matrix_Line (M);
      New_Line;
      Generate_Matrices (M, Last);
   end loop;
   
end;
