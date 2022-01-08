
function Functions ( A, B : Integer ) return Integer
  with Spark_Mode,
  Pre  => A > 0 and B > 0,
  Post => Functions'Result > 0
is
   I, J : Integer;
begin
   I := A;
   J := B;
   pragma Assert ( I > 0 );
   pragma Assert ( J > 0 );
   
   while I /= J loop
      pragma Loop_Invariant (I > 0 and J > 0);
      if I > J then
         I := I - J;
      else 
         J := J - I;
      end if;
   end loop;
   
   return (if I > J then I else J);
end;
