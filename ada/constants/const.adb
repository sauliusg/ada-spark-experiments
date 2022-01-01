-- Check whether constant assignments are detected by the compiler.

function Const( X : Integer ) return Integer is
   C : constant Integer := 1;
begin
   -- C := 11; -- Compilation of this statement fails as it should.
   return X + C;
end Const;
