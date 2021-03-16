CC = gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -std=c99

SRC = file.c
TEST = test.c
OBJ = $(SRC:.c=.o)

library: $(OBJ)
	ar csr libname.a $(OBJ)

test: library
	$(CC) $(CFLAGS) -g $(SRC) $(TEST) -L. -lname -I. -lcriterion

check:
	./a.out --verbose -j1

clean:
	$(RM) $(OBJ) libname.a a.out

.PHONY: clean test library check
