
SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = .obj

PROG_DIR = .

ADA_PROGRAMS = $(wildcard ${PROG_DIR}/*.adb)

ADA_EXE = ${ADA_PROGRAMS:${PROG_DIR}/%.adb=${BIN_DIR}/%}

.PHONY: all clean distclean mostlyclean cleanAll

all: ${ADA_EXE}

${BIN_DIR}/%: ${PROG_DIR}/%.adb
	gnatmake -I${SRC_DIR} -D ${OBJ_DIR} -o $@ $<

clean mostlyclean:
	rm -f ${OBJ_DIR}/*

distclean cleanAll: clean
	rm -f ${ADA_EXE}
