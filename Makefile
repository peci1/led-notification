# led-notification Makefile
# Simo Mattila <simo.h.mattila at gmail dot com>

GTK_PIDGIN_INCLUDES= `pkg-config --cflags gtk+-2.0 pidgin`

CFLAGS= -O2 -Wall -fpic -g
LDFLAGS= -shared

INCLUDES = \
      $(GTK_PIDGIN_INCLUDES)

led-notification.so: led-notification.c
	gcc led-notification.c $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o led-notification.so

install: led-notification.so
	mkdir -p /usr/lib/purple-2/
	cp led-notification.so /usr/lib/purple-2/

uninstall:
	rm -f /usr/lib/purple-2/led-notification.so

clean:
	rm -f led-notification.so

