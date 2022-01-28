--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
with C.bits.mman_linux;
with C.bits.types;
with C.stddef;
package C.sys.mman is
   pragma Preelaborate;
   MADV_DODUMP : constant := bits.mman_linux.MADV_DODUMP;
   MADV_DOFORK : constant := bits.mman_linux.MADV_DOFORK;
   MADV_DONTDUMP : constant := bits.mman_linux.MADV_DONTDUMP;
   MADV_DONTFORK : constant := bits.mman_linux.MADV_DONTFORK;
   MADV_DONTNEED : constant := bits.mman_linux.MADV_DONTNEED;
   MADV_FREE : constant := bits.mman_linux.MADV_FREE;
   MADV_HUGEPAGE : constant := bits.mman_linux.MADV_HUGEPAGE;
   MADV_HWPOISON : constant := bits.mman_linux.MADV_HWPOISON;
   MADV_MERGEABLE : constant := bits.mman_linux.MADV_MERGEABLE;
   MADV_NOHUGEPAGE : constant := bits.mman_linux.MADV_NOHUGEPAGE;
   MADV_NORMAL : constant := bits.mman_linux.MADV_NORMAL;
   MADV_RANDOM : constant := bits.mman_linux.MADV_RANDOM;
   MADV_REMOVE : constant := bits.mman_linux.MADV_REMOVE;
   MADV_SEQUENTIAL : constant := bits.mman_linux.MADV_SEQUENTIAL;
   MADV_UNMERGEABLE : constant := bits.mman_linux.MADV_UNMERGEABLE;
   MADV_WILLNEED : constant := bits.mman_linux.MADV_WILLNEED;
   MAP_ANON : constant := bits.mman_linux.MAP_ANON;
   MAP_ANONYMOUS : constant := bits.mman_linux.MAP_ANONYMOUS;
   MAP_FILE : constant := bits.mman_linux.MAP_FILE;
   MAP_FIXED : constant := bits.mman_linux.MAP_FIXED;
   MAP_HUGE_MASK : constant := bits.mman_linux.MAP_HUGE_MASK;
   MAP_HUGE_SHIFT : constant := bits.mman_linux.MAP_HUGE_SHIFT;
   MAP_PRIVATE : constant := bits.mman_linux.MAP_PRIVATE;
   MAP_SHARED : constant := bits.mman_linux.MAP_SHARED;
   MAP_TYPE : constant := bits.mman_linux.MAP_TYPE;
   MCL_CURRENT : constant := bits.mman_linux.MCL_CURRENT;
   MCL_FUTURE : constant := bits.mman_linux.MCL_FUTURE;
   MCL_ONFAULT : constant := bits.mman_linux.MCL_ONFAULT;
   MS_ASYNC : constant := bits.mman_linux.MS_ASYNC;
   MS_INVALIDATE : constant := bits.mman_linux.MS_INVALIDATE;
   MS_SYNC : constant := bits.mman_linux.MS_SYNC;
   POSIX_MADV_DONTNEED : constant := bits.mman_linux.POSIX_MADV_DONTNEED;
   POSIX_MADV_NORMAL : constant := bits.mman_linux.POSIX_MADV_NORMAL;
   POSIX_MADV_RANDOM : constant := bits.mman_linux.POSIX_MADV_RANDOM;
   POSIX_MADV_SEQUENTIAL : constant := bits.mman_linux.POSIX_MADV_SEQUENTIAL;
   POSIX_MADV_WILLNEED : constant := bits.mman_linux.POSIX_MADV_WILLNEED;
   PROT_EXEC : constant := bits.mman_linux.PROT_EXEC;
   PROT_GROWSDOWN : constant := bits.mman_linux.PROT_GROWSDOWN;
   PROT_GROWSUP : constant := bits.mman_linux.PROT_GROWSUP;
   PROT_NONE : constant := bits.mman_linux.PROT_NONE;
   PROT_READ : constant := bits.mman_linux.PROT_READ;
   PROT_WRITE : constant := bits.mman_linux.PROT_WRITE;
   subtype off_t is bits.types.off_t;
   subtype mode_t is bits.types.mode_t;
   function mmap (addr : void_ptr; len : stddef.size_t; prot : signed_int;
      flags : signed_int; fd : signed_int; offset : bits.types.off_t)
      return void_ptr;
   pragma Import (C, mmap, "mmap");
   function munmap (addr : void_ptr; len : stddef.size_t) return signed_int;
   pragma Import (C, munmap, "munmap");
   function mprotect (addr : void_ptr; len : stddef.size_t;
      prot : signed_int) return signed_int;
   pragma Import (C, mprotect, "mprotect");
   function msync (addr : void_ptr; len : stddef.size_t; flags : signed_int)
      return signed_int;
   pragma Import (C, msync, "msync");
   function madvise (addr : void_ptr; len : stddef.size_t;
      advice : signed_int) return signed_int;
   pragma Import (C, madvise, "madvise");
   function posix_madvise (addr : void_ptr; len : stddef.size_t;
      advice : signed_int) return signed_int;
   pragma Import (C, posix_madvise, "posix_madvise");
   function mlock (addr : void_const_ptr; len : stddef.size_t)
      return signed_int;
   pragma Import (C, mlock, "mlock");
   function munlock (addr : void_const_ptr; len : stddef.size_t)
      return signed_int;
   pragma Import (C, munlock, "munlock");
   function mlockall (flags : signed_int) return signed_int;
   pragma Import (C, mlockall, "mlockall");
   function munlockall return signed_int;
   pragma Import (C, munlockall, "munlockall");
   function mincore (start : void_ptr; len : stddef.size_t;
      vec : access unsigned_char) return signed_int;
   pragma Import (C, mincore, "mincore");
   function shm_open (name : access constant char; oflag : signed_int;
      mode : mode_t) return signed_int;
   pragma Import (C, shm_open, "shm_open");
   function shm_unlink (name : access constant char) return signed_int;
   pragma Import (C, shm_unlink, "shm_unlink");
   MAP_FAILED : constant void_ptr := void_ptr (System'To_Address (-1));
   SYS_MMAN_H : constant := 1;
   --  __mode_t_defined (empty)
   --  __off_t_defined (empty)
end C.sys.mman;
