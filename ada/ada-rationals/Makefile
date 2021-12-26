
CWD := $(shell pwd)

SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = .obj

PROG_DIR = .

ADA_PROGRAMS = $(wildcard ${PROG_DIR}/*.adb)

ADA_DEPEND = ${ADA_PROGRAMS:${PROG_DIR}/%.adb=${PROG_DIR}/.%.d}

ADA_EXE = ${ADA_PROGRAMS:${PROG_DIR}/%.adb=${BIN_DIR}/%}

.PHONY: all clean distclean mostlyclean cleanAll

all: ${ADA_EXE}

include ${ADA_DEPEND}

${BIN_DIR}/%: ${PROG_DIR}/%.adb
	gnatmake -I${SRC_DIR} -D ${OBJ_DIR} -o $@ $<

${PROG_DIR}/.%.d: ${PROG_DIR}/%.adb
	gnatmake -I${SRC_DIR} -D ${OBJ_DIR} -M $< \
	| sed 's/^\(.*\)\.o :/${BIN_DIR}\/\1 :/' \
	| sed 's:${CWD}/::' \
	> $@

clean mostlyclean:
	rm -f ${OBJ_DIR}/*
	rm -f ${ADA_DEPEND}

distclean cleanAll: clean
	rm -f ${ADA_EXE}
