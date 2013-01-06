srcdir = .
PACKAGE_VERSION = 20121114
PACKAGE_NAME = bagop
bin_SCRIPTS = bagop
man_MANS = bagop.1
doc_DATA = bagop.html

all: bagop.1 bagop.txt

bagop.1: bagop.pod Makefile
	pod2man --release='$(PACKAGE_VERSION)' --center='$(PACKAGE_NAME)' \
		--section=1 $(srcdir)/bagop.pod > $(srcdir)/bagop.1

bagop.txt: bagop.pod Makefile
	pod2text $(srcdir)/bagop.pod $(srcdir)/README.md

bagop.html: bagop.pod Makefile
	pod2html $(srcdir)/bagop.pod > $(srcdir)/bagop.html
	rm -f $(srcdir)/pod2htm*

bagop.texi: bagop.pod
# If pod2texi is not installed: Forget about it
	pod2texi --output=$(srcdir)/bagop.texi $(srcdir)/bagop.pod || true

DISTCLEANFILES = bagop.html
EXTRA_DIST = bagop \
	bagop.1 \
	bagop.html \
	bagop.pod \
	bagop.texi
