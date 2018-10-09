CC=gcc
CFLAGS=-g -Wall
#Enable all warnings
DOXCONFIG=Doxyfile

#Build game, archive it, and document it
all: build archive doc

build: wc

main.o: wc.c 
	$(CC) $(CFLAGS) -c wc.c

archive: wc.tgz

wc.tgz: wc Makefile README.md html Doxyfile
	tar -cvz --exclude=*.o --exclude='wc.tgz' -f wc.tgz *

doc: html

#Update documentation files
html: $(DOXCONFIG) *.c *.h
	doxygen $(DOXCONFIG)

#Clean up old .o files, executable, and archived file
clean:
	-rm -f *.o wc wc.tgz
	-rm -rf html
