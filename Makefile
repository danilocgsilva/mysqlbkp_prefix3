BIN ?= mslbkpprefixin
PREFIX ?= /usr/local

install:
	cp mslbkpprefixin.sh $(PREFIX)/bin/$(BIN)
	chmod +x $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
