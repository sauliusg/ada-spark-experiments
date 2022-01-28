--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
package C.bits.mman is
   pragma Preelaborate;
   MAP_32BIT : constant := 64;
   MAP_DENYWRITE : constant := 2048;
   MAP_EXECUTABLE : constant := 4096;
   MAP_GROWSDOWN : constant := 256;
   MAP_HUGETLB : constant := 262144;
   MAP_LOCKED : constant := 8192;
   MAP_NONBLOCK : constant := 65536;
   MAP_NORESERVE : constant := 16384;
   MAP_POPULATE : constant := 32768;
   MAP_STACK : constant := 131072;
end C.bits.mman;
