
CWD := $(shell pwd)

PRG_DIR = programs
SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = .obj

ADA_PROGRAMS = $(wildcard ${PRG_DIR}/*.adb)

ADA_DEPEND = ${ADA_PROGRAMS:${PRG_DIR}/%.adb=${PRG_DIR}/.%.d}

ADA_EXE = ${ADA_PROGRAMS:${PRG_DIR}/%.adb=${BIN_DIR}/%}

.PHONY: all run clean distclean mostlyclean cleanAll

all: ${ADA_EXE}

include ${ADA_DEPEND}

STDIN = 

run: ${ADA_EXE}
	for FILE in $^; do \
		( set -x; $${FILE} < ${STDIN} ) \
	done

${BIN_DIR}/%_with_gc: ${PRG_DIR}/%_with_gc.adb
	gnatmake \
		-I${SRC_DIR} \
		-Ilibs/boehmgc-ada/source \
		-Ilibs/boehmgc-ada/pre-translated-headers \
		-D ${OBJ_DIR} \
		-o $@ $<

${BIN_DIR}/%: ${PRG_DIR}/%.adb
	gnatmake -I${SRC_DIR} -D ${OBJ_DIR} -o $@ $< -gnata
	${MAKE} --no-print-directory -W $< ${PRG_DIR}/.$*.d

${PRG_DIR}/.%.d: ${PRG_DIR}/%.adb
	gnatmake -I${SRC_DIR} -D ${OBJ_DIR} -M $< \
	| sed 's/^\(.*\)\.o :/${BIN_DIR}\/\1 :/' \
	| sed 's:${CWD}/::' \
	> $@

clean mostlyclean:
	rm -f ${OBJ_DIR}/*
	rm -f ${ADA_DEPEND}

distclean cleanAll: clean
	rm -f ${ADA_EXE}
