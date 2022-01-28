--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
package C.bits.typesizes is
   pragma Preelaborate;
   BITS_TYPESIZES_H : constant := 1;
   subtype BLKCNT64_T_TYPE is signed_long;
   subtype BLKCNT_T_TYPE is signed_long;
   subtype BLKSIZE_T_TYPE is signed_long;
   subtype CLOCKID_T_TYPE is signed_int;
   subtype CLOCK_T_TYPE is signed_long;
   subtype CPU_MASK_TYPE is unsigned_long;
   subtype DADDR_T_TYPE is signed_int;
   subtype DEV_T_TYPE is unsigned_long;
   FD_SETSIZE : constant := 1024;
   subtype FSBLKCNT64_T_TYPE is unsigned_long;
   subtype FSBLKCNT_T_TYPE is unsigned_long;
   subtype FSFILCNT64_T_TYPE is unsigned_long;
   subtype FSFILCNT_T_TYPE is unsigned_long;
   type struct_ad766d7a is record
      val : aliased signed_int_array (0 .. 1);
   end record;
   pragma Convention (C_Pass_By_Copy, struct_ad766d7a);
   subtype FSID_T_TYPE is struct_ad766d7a;
   subtype FSWORD_T_TYPE is signed_long;
   subtype GID_T_TYPE is unsigned_int;
   subtype ID_T_TYPE is unsigned_int;
   subtype INO64_T_TYPE is unsigned_long;
   INO_T_MATCHES_INO64_T : constant := 1;
   subtype INO_T_TYPE is unsigned_long;
   subtype KEY_T_TYPE is signed_int;
   subtype MODE_T_TYPE is unsigned_int;
   subtype NLINK_T_TYPE is unsigned_long;
   subtype OFF64_T_TYPE is signed_long;
   OFF_T_MATCHES_OFF64_T : constant := 1;
   subtype OFF_T_TYPE is signed_long;
   subtype PID_T_TYPE is signed_int;
   subtype RLIM64_T_TYPE is unsigned_long;
   subtype RLIM_T_TYPE is unsigned_long;
   subtype SSIZE_T_TYPE is signed_long;
   subtype SUSECONDS_T_TYPE is signed_long;
   subtype SYSCALL_SLONG_TYPE is signed_long;
   subtype SYSCALL_ULONG_TYPE is unsigned_long;
   --  __TIMER_T_TYPE (unparsible)
   subtype TIME_T_TYPE is signed_long;
   subtype UID_T_TYPE is unsigned_int;
   subtype USECONDS_T_TYPE is unsigned_int;
end C.bits.typesizes;
