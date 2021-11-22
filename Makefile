DEPS = base58.h ipld_tut.h varint.h 
OBJS = base58.o ipld_tut.o varint.o

INCLUDE = -I../c-libp2p/c-multiaddr/include/multiaddr
CFLAGS = $(INCLUDE) -Wall -O0 -fPIC
LINKER_FLAGS = -ljansson


%.o: %.c 
	$(CC) -c -o $@ $< $(CFLAGS) -std=c99

# all: link

link: $(OBJS)
	gcc -shared $(INCLUDE) $(OBJS) -o libc-ipld.a $(LINKER_FLAGS)

# test:
clean:
	rm -f $(OBJS)
	rm libc-ipld.a
