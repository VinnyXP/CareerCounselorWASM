# Variables
CC = em++
CFLAGS = -std=c++11 -s WASM=1 -s USE_PTHREADS=1

# Directories
SRC_DIR = cpp-files
HEAD_DIR = header-files
OUT_DIR = out-files

# Object files
OBJS = $(OUT_DIR)/main.o \
       $(OUT_DIR)/Bfunctions.o \
       $(OUT_DIR)/BinaryTree.o \
       $(OUT_DIR)/Efunctions.o \
       $(OUT_DIR)/HashTable.o \
       $(OUT_DIR)/LinkedList.o \
       $(OUT_DIR)/QueueLL.o \
       $(OUT_DIR)/Rfunctions.o \
       $(OUT_DIR)/Vfunctions.o

# Targets
all: $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) -o program.js

$(OUT_DIR)/main.o: main.cpp
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c main.cpp -o $(OUT_DIR)/main.o

$(OUT_DIR)/Bfunctions.o: $(SRC_DIR)/Bfunctions.cpp $(HEAD_DIR)/Bfunctions.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/Bfunctions.cpp -o $(OUT_DIR)/Bfunctions.o

$(OUT_DIR)/BinaryTree.o: $(SRC_DIR)/BinaryTree.cpp $(HEAD_DIR)/BinaryTree.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/BinaryTree.cpp -o $(OUT_DIR)/BinaryTree.o

$(OUT_DIR)/Efunctions.o: $(SRC_DIR)/Efunctions.cpp $(HEAD_DIR)/Efunctions.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/Efunctions.cpp -o $(OUT_DIR)/Efunctions.o

$(OUT_DIR)/HashTable.o: $(SRC_DIR)/HashTable.cpp $(HEAD_DIR)/HashTable.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/HashTable.cpp -o $(OUT_DIR)/HashTable.o

$(OUT_DIR)/LinkedList.o: $(SRC_DIR)/LinkedList.cpp $(HEAD_DIR)/LinkedList.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/LinkedList.cpp -o $(OUT_DIR)/LinkedList.o

$(OUT_DIR)/QueueLL.o: $(SRC_DIR)/QueueLL.cpp $(HEAD_DIR)/QueueLL.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/QueueLL.cpp -o $(OUT_DIR)/QueueLL.o

$(OUT_DIR)/Rfunctions.o: $(SRC_DIR)/Rfunctions.cpp $(HEAD_DIR)/Rfunctions.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/Rfunctions.cpp -o $(OUT_DIR)/Rfunctions.o

$(OUT_DIR)/Vfunctions.o: $(SRC_DIR)/Vfunctions.cpp $(HEAD_DIR)/Vfunctions.h
	$(CC) $(CFLAGS) -I$(HEAD_DIR) -c $(SRC_DIR)/Vfunctions.cpp -o $(OUT_DIR)/Vfunctions.o

# Clean the object files, wasm, and js files
clean:
	rm -f $(OUT_DIR)/*.o $(OUT_DIR)/*.wasm $(OUT_DIR)/*.js

# Clean the object files, wasm, and js files, and the program
cleanall:
	rm -f $(OUT_DIR)/*.o *.wasm *.js program
