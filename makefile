
all: loops recursives recursived loopd maindloop maindrec

loops: libclassloop.a

recursives: libclassrec.a

loopd: libclassloop.so

recursived: libclassrec.so


libclassloop.a: basicClassification.o advancedClassificationLoop.o
	ar -rcs libclassloop.a basicClassification.o advancedClassificationLoop.o

libclassloop.so: basicClassification.o advancedClassificationLoop.o
	gcc -shared -o libclassloop.so basicClassification.o advancedClassificationLoop.o

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o

mains: libclassrec.a main.o
	gcc -Wall -g -o mains main.o libclassrec.a -lm

maindloop: libclassloop.so main.o
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

.PHONY:all clean

clean:
	rm -f *.o maindrec maindloop mains *.a *.so