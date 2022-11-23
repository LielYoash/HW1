.PHONY: all clean

all: libclassloop.a libclassloop.so libclassrec.a libclassrec.so maindloop maindrec

libclassloop.a: basicClassification.c advancedClassificationLoop.c NumClass.h
	ar -rcs libclassloop.a basicClassification.c advancedClassificationLoop.c NumClass.h

libclassloop.so: basicClassification.c advancedClassificationLoop.c NumClass.h
	gcc -shared -o libclassloop.so basicClassification.c advancedClassificationLoop.c NumClass.h -lm

libclassrec.a: basicClassification.c advancedClassificationRecursion.c NumClass.h
	ar -rcs libclassrec.a basicClassification.c advancedClassificationRecursion.c NumClass.h

libclassrec.so: basicClassification.c advancedClassificationRecursion.c NumClass.h
	gcc -shared -o libclassrec.so basicClassification.c advancedClassificationRecursion.c NumClass.h

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
	rm -f *.o maindrec maindloop *.a *.so