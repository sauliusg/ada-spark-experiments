with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Insertion_Sort with Spark_Mode Is
   type Integer_Array is array (Positive range <>) of Integer;
   
   function Occurences (A : Integer_Array; E : Integer) return Natural with Ghost is
      Count : Natural := 0;
   begin
      for X of A loop
         if X = E then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end;
   
   function Is_Perm (A, B : Integer_Array) return Boolean is
      (for all E in Integer => Occurences (A, E) = Occurences (B, E))
        with Ghost;
   
   function Is_Sorted (A : Integer_Array) return Boolean is
      (if A'First < A'Last then (for all K in A'First .. A'Last - 1 => A(K) <= A(K + 1)))
        with Ghost;
   
   procedure Sort
     (Arr : in out Integer_Array)
   with
     Pre => Arr'Length > 1 and Arr'First < Integer'Last and Arr'Last < Integer'Last,
     Post => Is_Sorted (Arr)
     -- Post => (for all I in Arr'First + 1 .. Arr'Last => Arr(I) >= Arr(I-1))
   is
      Item : Integer;
      Position : Natural;
      Sorted_Range : Positive := Arr'First with Ghost;
   begin
      for I in Arr'First + 1 .. Arr'Last loop
         pragma Loop_Invariant (Is_Sorted (Arr (Arr'First .. Sorted_Range)));
         Item := Arr(I);
         Position := I - 1;
         pragma Assert (Position < Arr'Last);
         while Position >= Arr'First and then Arr(Position) > Item loop
            pragma Loop_Invariant (Position < Arr'Last);
            pragma Loop_Invariant (Item <= Arr(Position));
            pragma Loop_Invariant (Item <= Arr(I));
            pragma Loop_Invariant (for all K in Position .. I - 1 => Item <= Arr(K));
            Arr(Position + 1) := Arr(Position);
            Position := Position - 1;
         end loop;
         pragma Assert (Position < Arr'Last);
         pragma Assert (for all K in Position + 1 .. I => Item <= Arr(K));
         Arr(Position + 1) := Item;
         pragma Assert (Is_Sorted (Arr (Position .. Position + 1)));
         Sorted_Range := I;
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
