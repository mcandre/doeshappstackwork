EXECUTABLE=doeshappstackwork

all: doeshappstackwork.hs
	ghc --make doeshappstackwork.hs

clean:
	rm $(EXECUTABLE)
	rm doeshappstackwork.o
	rm doeshappstackwork.hi
