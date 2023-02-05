pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;

with Unchecked_Deallocation;

procedure Varying_Array is
   
   type Open_Array is array (Integer range <>) of Integer;
   
   type Varying_Array (Capacity : Natural) is record
      Length : Natural := 0;
      Value: Open_Array (1 .. Capacity) := (others => 0);
   end record;
   
   type Access_Array is access Varying_Array;
   
   procedure Free is new
     Unchecked_Deallocation (Varying_Array, Access_Array);
   
   type Access_Open_Array is access Open_Array;
   
   procedure Free is new
     Unchecked_Deallocation (Open_Array, Access_Open_Array);
   
   V : Varying_Array (12);
   
begin
   Put_Line (V'Image);
   
   declare
      Size_Range : array (Integer range <>) of Integer :=
        (20, 13, 17, 44);
   begin
      for I of Size_Range loop
         declare
            A : Access_Array;
         begin
            A := new Varying_Array (I);
            Put_Line (A.all'Image);
            Free (A);
            -- Put_Line (A.all'Image);
         end;
      end loop;
   end;
   
   declare
      Size_Range : array (Integer range <>) of Integer :=
        (20, 13, 17, 44);
   begin
      for I of Size_Range loop
         declare
            A : Access_Open_Array;
         begin
            A := new Open_Array (1 .. I);
            A.all := (for I in A.all'Range => I * I);
            Put_Line (A.all'Image);
            Free (A);
            -- Put_Line (A.all'Image);
         end;
      end loop;
   end;
   
end;
