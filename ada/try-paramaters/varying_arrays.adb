pragma Ada_2022;

with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

procedure Varying_Arrays is
   
   N : constant Integer := 20;
   
   type Buffer_Type is array (Integer range <>) of Integer;
   
   type Varying_Array (M : Integer) is record
      -- Size : constant Integer range 1..N;
      -- Size : Integer range 1..M;
      -- Buffer : array (1..Size) of Integer;
      -- Buffer : Buffer_Type(1..Size);
      Buffer : Buffer_Type(1..M);
   end record;
   
   VA1 : Varying_Array(4);
   
begin
   VA1 := (4,(2,4,6,8));
   for I in 1..4 loop
      VA1 := (VA1.M, (for J in 1 .. VA1.M => (if J <= I then J else 0)));
      Put_Line (VA1'Image);
   end loop;
end;
