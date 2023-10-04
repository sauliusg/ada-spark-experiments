#---*- Makefile -*-------------------------------------------------------
#$Author$
#$Date$
#$Revision$
#$URL$
#------------------------------------------------------------------------

MAKEFILE_DIRS = . makefiles/enabled
MAKEFILE_WCARDS = $(addsuffix /Makelocal*, ${MAKEFILE_DIRS})
MAKECONF_WCARDS = $(addsuffix /Makeconf*, ${MAKEFILE_DIRS})

MAKECONF_FILES = $(filter-out %.example, \
	$(filter-out %~, $(wildcard ${MAKECONF_WCARDS}) \
))

ifneq ("${MAKECONF_FILES}","")
include ${MAKECONF_FILES}
endif

# A Makeconfig file might contain a line like the following ones:
# FIRST   = f2mtz/
# LAST    = summary/
# EXCLUDE = extra/
# IGNORED_DIRS = no-go/ 
#
# The directory names specified in variables FIRST, LAST, EXCLUDE and
# IGNORED_DIRS *must* have a trailing slash to be compatible with
# directory names produced by the GNU Make $(dir ...) function.
#
# The EXTRA_TARGETS allows to specify which extra targets are understood
# by subdirectory Makefiles:
#
# EXTRA_TARGETS = configure install test
#
# The recursive Makefile will first descend to directories mentioned
# in ${FIRST}, and then into all the rest alphabetically. After that,
# the ${LAST} subdirectories will be processed.
#
# Directories mentioned in ${EXCLUDE} will be excluded from the
# automatic search, but can be included as FIRST or LAST members.
#
# Directories listed in ${IGNORED_DIRS} will be skipped even if they
# are listed in ${FIRST} or ${LAST}:

DIRS = \
$(filter-out ${IGNORED_DIRS}, \
	${FIRST} \
	$(sort \
		$(filter-out ${LAST}, \
		$(filter-out ${FIRST}, \
			$(filter-out ${EXCLUDE}, $(dir $(wildcard */Makefile))) \
		)) \
	) \
	${LAST} \
)

.PHONY: all clean cleanAll distclean mostlyclean ${EXTRA_TARGETS}

#------------------------------------------------------------------------------

all clean cleanAll distclean ${EXTRA_TARGETS}:
	@for d in ${DIRS}; do test -d $$d && ${MAKE} -C $$d $@; done

#------------------------------------------------------------------------------

MAKELOCAL_FILES = ${filter-out %~, ${wildcard ${MAKEFILE_WCARDS}}}

ifneq ("${MAKELOCAL_FILES}","")
include ${MAKELOCAL_FILES}
endif
