TQFTPSERV := tqftpserv

CFLAGS := -Wall -g -O2
LDFLAGS := -lqrtr

prefix ?= /usr
bindir := $(prefix)/bin

SRCS := tqftpserv.c translate.c

OBJS := $(SRCS:.c=.o)

$(TQFTPSERV): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

install: $(TQFTPSERV)
	@install -D -m 755 $(TQFTPSERV) $(DESTDIR)$(bindir)/$(TQFTPSERV)
	@install -D -m 755 tqftpserv.initd $(DESTDIR)etc/init.d/$(TQFTPSERV)
	@install -D -m 644 LICENSE $(DESTDIR)usr/share/licenses/$(TQFTPSERV)/COPYING

clean:
	rm -f $(TQFTPSERV) $(OBJS)
