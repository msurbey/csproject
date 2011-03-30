######################################################
##                                                  ##
## Makefile Project									##
##                                                  ##
######################################################

##==========##
## Settings ##
##==========##

CXX = g++
SED = sed
RM = rm -f
MV = mv -f
CP = cp -f

.SUFFIXES: .o .cc

main = proj
cxxflags = -W -Wall -Wextra -ansi -g
ldflags = -L/opt/local/lib
libs = 
testlibs = -lUnitTest++
includes = -I/opt/local/include
source := ${wildcard src/*.cc}
objects := ${source:.cc=.o}
dependencies := ${source:.cc=.d}

test = unittest
testsource := ${wildcard test/*.cc}
testobjects := ${testsource:.cc=.o}
testdependencies := ${testsource:.cc=.d}

##===============##
## Build Targets ##
##===============##

.PHONY: all
all: ${main} ${test}
	@echo
	@echo ===================================
	@echo Project has been built successfully
	@echo ===================================
	@echo
	@./${test}

${main}: ${objects}
	${CXX} ${ldflags} ${includes} ${objects} -o ${main} ${libs}

${test}: ${testobjects}
	${CXX} ${ldflags} ${includes} ${testobjects} -o ${test} ${libs} ${testlibs}

src/%.o: src/%.cc
	${CXX} -c ${cxxflags} ${includes} -MMD -o $@ $<

.PHONY: clean
clean:
	-@${RM} ${main} *~ ${dependencies} ${objects} ${testobjects} ${testdependencies} ${test}

ifneq ($(MAKECMDGOALS),clean)
-include ${dependencies}
endif
