.PHONY:all clean

all: libclassloop.a libclassloop.so libclassrec.a libclassrec.so maindloop maindrec

libclassloop.a: basicClassification.o advancedClassificationLoop.o NumClass.h
	ar -rcs libclassloop.a basicClassification.o advancedClassificationLoop.o NumClass.h

libclassloop.so: basicClassification.o advancedClassificationLoop.o NumClass.h
	gcc -shared -o libclassloop.so basicClassification.o advancedClassificationLoop.o NumClass.h -lm

libclassrec.a: basicClassification.o advancedClassificationRecursion.o NumClass.h
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o NumClass.h

libclassrec.so: basicClassification.o advancedClassificationRecursion.o NumClass.h
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o NumClass.h

mains: libclassrec.a main.o NumClass.h
	gcc -Wall -g -o mains main.o libclassrec.a -lm

maindloop: libclassloop.so main.o NumClass.h
	gcc -Wall -g -o maindloop main.o libclassloop.so -lm

maindrec: libclassrec.so main.o
	gcc -Wall -g -o maindrec main.o libclassrec.so -lm

basicClassification.o: basicClassification.c NumClass.h
	gcc -Wall -g -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c advancedClassificationRecursion.c

main.o: main.c NumClass.h
	gcc -Wall -g -c main.c

clean:
	rm -f *.o maindrec maindloop mains *.a *.so