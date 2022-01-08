
function Functions ( A, B : Integer ) return Integer
  with Spark_Mode,
  Pre  => A > 0 and B > 0,
  Post => Functions'Result >= 0
is
   I, J : Integer;
begin
   I := A;
   J := B;
   pragma Assert ( I > 0 );
   pragma Assert ( J > 0 );
   
   while I /= J loop
      pragma Assert (I > 0);
      pragma Assert (J > 0);
      if I > J then
         pragma Assert (I > J);
         I := I - J;
         pragma Assert (I > 0);
      else 
         pragma Assert (I < J);
         J := J - I;
         pragma Assert (J > 0);
      end if;
      pragma Assert (I > 0 and J > 0);
   end loop;
   
   return (if I > J then I else J);
end;
