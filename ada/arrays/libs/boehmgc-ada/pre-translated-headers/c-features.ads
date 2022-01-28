--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
package C.features is
   pragma Preelaborate;
   ATFILE_SOURCE : constant := 1;
   DEFAULT_SOURCE : constant := 1;
   FEATURES_H : constant := 1;
   POSIX_C_SOURCE : constant := 200809;
   POSIX_SOURCE : constant := 1;
   qqGLIBC_MINORqq : constant := 24;
   --  __GLIBC_PREREQ (function macro)
   qqGLIBCqq : constant := 2;
   --  __GNUC_PREREQ (function macro)
   qqGNU_LIBRARYqq : constant := 6;
   --  __KERNEL_STRICT_NAMES (empty)
   USE_ATFILE : constant := 1;
   USE_FORTIFY_LEVEL : constant := 0;
   USE_ISOC95 : constant := 1;
   USE_ISOC99 : constant := 1;
   USE_MISC : constant := 1;
   USE_POSIX : constant := 1;
   USE_POSIX199309 : constant := 1;
   USE_POSIX199506 : constant := 1;
   USE_POSIX2 : constant := 1;
   USE_POSIX_IMPLICITLY : constant := 1;
   USE_XOPEN2K : constant := 1;
   USE_XOPEN2K8 : constant := 1;
end C.features;
