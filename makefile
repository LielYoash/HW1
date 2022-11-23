.PHONY: all clean

all: libclassloop.a libclassloop.so libclassrec.a libclassrec.so maindloop maindrec


libclassloop.o: basicClassification.c advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c basicClassification.c advancedClassificationLoop.c -lm

libclassrec.o: basicClassification.c advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c basicClassification.c advancedClassificationRecursion.c -lm

libclassloop.a: libclassloop.o
	ar -rcs libclassloop.a libclassloop.o

libclassloop.so: libclassloop.o
	ar -shared -o libclassloop.so libclassloop.o

libclassrec.a: libclassrec.o
	ar -rcs libclassrec.a libclassrec.o

libclassrec.so: libclassrec.o
	ar -shared -o libclassrec.so libclassrec.o

maindloop: basicClassification.o advancedClassificationLoop.o main.o
	gcc -Wall -g -o maindloop basicClassification.o advancedClassificationLoop.o main.o -lm

maindrec: basicClassification.o advancedClassificationRecursion.o main.o
	gcc -Wall -g -o maindrec basicClassification.o advancedClassificationRecursion.o main.o -lm

basicClassification.o: basicClassification.c NumClass.h
	gcc -Wall -g -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c advancedClassificationRecursion.c

main.o: main.c NumClass.h
	gcc -Wall -g -c main.c

clean:
	rm -f *.o maindrec maindloop