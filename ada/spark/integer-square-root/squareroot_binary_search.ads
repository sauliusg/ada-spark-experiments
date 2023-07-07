pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

package Squareroot_Binary_Search with Spark_Mode is
   
   procedure Sqrt (N : in Big_Integer; A : out Big_Integer)
     with
     Pre => 0 <= N,
     Post => A ** 2 <= N and (A + 1) ** 2 > N;
   
end Squareroot_Binary_Search;
