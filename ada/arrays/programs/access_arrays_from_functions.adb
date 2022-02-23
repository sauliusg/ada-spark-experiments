with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Ada.Unchecked_Deallocation;

procedure Access_Arrays_From_Functions is
   
   type Vector is array (Integer range <>) of Integer;
   type PVector is access Vector;
   
   function Make_Array( Size : Integer ) return PVector is
      V : PVector;
   begin
      V := new Vector(1..Size);
      for I in V.all'Range loop
         V(I) := 0;
      end loop;
      return V;
   end;
   
   procedure FreeVector is
      new Ada.Unchecked_Deallocation(Vector, PVector);
   
   V : PVector;
   
begin
   
   V := Make_Array( 23 );
   
   Put( V'Last, 1 ); New_Line;
   
   FreeVector( V );
   
   V := Make_Array( 72 );
   
   Put( V'Last, 1 ); New_Line;
   
   FreeVector( V );
   
end;
