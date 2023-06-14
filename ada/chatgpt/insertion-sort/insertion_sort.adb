with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Insertion_Sort with Spark_Mode Is
   type Integer_Array is array (Positive range <>) of Integer;

   procedure Sort
     (Arr : in out Integer_Array)
   with
     Pre => Arr'Length > 1 and Arr'First < Integer'Last and Arr'Last < Integer'Last,
     Post => (for all I in Arr'First + 1 .. Arr'Last => Arr(I) >= Arr(I-1))
   is
      Item : Integer;
      Position : Natural;
   begin
      for I in Arr'First + 1 .. Arr'Last loop
         Item := Arr(I);
         Position := I - 1;
         pragma Assert (Position < Arr'Last);
         while Position >= Arr'First and then Arr(Position) > Item loop
            pragma Loop_Invariant (Position < Arr'Last);
            Arr(Position + 1) := Arr(Position);
            Position := Position - 1;
         end loop;
         Arr(Position + 1) := Item;
      end loop;
   end Sort;

   Arr : Integer_Array (1 .. 10) := (9, 5, 7, 1, 3, 2, 6, 8, 4, 10);
begin
   Sort(Arr);
   -- Print the sorted array
   for I in Arr'Range loop
      Put(Integer'Image(Arr(I)) & " ");
   end loop;
end Insertion_Sort;
