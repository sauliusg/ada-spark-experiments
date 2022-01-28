--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
package C.bits.mman_linux is
   pragma Preelaborate;
   MADV_DODUMP : constant := 17;
   MADV_DOFORK : constant := 11;
   MADV_DONTDUMP : constant := 16;
   MADV_DONTFORK : constant := 10;
   MADV_DONTNEED : constant := 4;
   MADV_FREE : constant := 8;
   MADV_HUGEPAGE : constant := 14;
   MADV_HWPOISON : constant := 100;
   MADV_MERGEABLE : constant := 12;
   MADV_NOHUGEPAGE : constant := 15;
   MADV_NORMAL : constant := 0;
   MADV_RANDOM : constant := 1;
   MADV_REMOVE : constant := 9;
   MADV_SEQUENTIAL : constant := 2;
   MADV_UNMERGEABLE : constant := 13;
   MADV_WILLNEED : constant := 3;
   MAP_ANON : constant := 32;
   MAP_ANONYMOUS : constant := 32;
   MAP_FILE : constant := 0;
   MAP_FIXED : constant := 16;
   MAP_HUGE_MASK : constant := 63;
   MAP_HUGE_SHIFT : constant := 26;
   MAP_PRIVATE : constant := 2;
   MAP_SHARED : constant := 1;
   MAP_TYPE : constant := 15;
   MCL_CURRENT : constant := 1;
   MCL_FUTURE : constant := 2;
   MCL_ONFAULT : constant := 4;
   MS_ASYNC : constant := 1;
   MS_INVALIDATE : constant := 2;
   MS_SYNC : constant := 4;
   POSIX_MADV_DONTNEED : constant := 4;
   POSIX_MADV_NORMAL : constant := 0;
   POSIX_MADV_RANDOM : constant := 1;
   POSIX_MADV_SEQUENTIAL : constant := 2;
   POSIX_MADV_WILLNEED : constant := 3;
   PROT_EXEC : constant := 4;
   PROT_GROWSDOWN : constant := 16777216;
   PROT_GROWSUP : constant := 33554432;
   PROT_NONE : constant := 0;
   PROT_READ : constant := 1;
   PROT_WRITE : constant := 2;
end C.bits.mman_linux;
