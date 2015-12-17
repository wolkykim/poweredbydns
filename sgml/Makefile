MAINTAINER = nobreak@kr.FreeBSD.org
REVISION = 3.4.3
DOCNAME = PoweredByDNS

CATALOG	= -c /usr/local/share/sgml/catalog \
	-c /usr/local/share/sgml/docbook/dsssl/modular/catalog \
	-c /usr/local/share/sgml/docbook/catalog \
	-c /usr/local/share/sgml/jade/catalog
DSSSL	= -d ./docbook.dsl
SRC	= book.sgml
CHUNK	= ${DOCNAME}-${REVISION}.html
TARGET	= ../html

all: clean sgml divided single tidyadjust

divided:
	jade -V html-manifest -ioutput.html -t sgml ${CATALOG} ${DSSSL} ${SRC}
	tidy -i -m -q -raw -f /dev/null `xargs < HTML.manifest` &
	@sleep 2
	rm -f HTML.manifest
	mv *.html ${TARGET}

single:
	jade -V nochunks -ioutput.html -t sgml ${CATALOG} ${DSSSL} ${SRC} > ${CHUNK}
	tidy -i -m -raw -f /dev/null ${CHUNK} &
	@sleep 2
	mv ${CHUNK} ${TARGET}

sgml:
	tar cvf ${DOCNAME}-${REVISION}.tar ./*
	gzip ${DOCNAME}-${REVISION}.tar
	mv ${DOCNAME}-${REVISION}.tar.gz ${TARGET}

tidyadjust:
	./tidyfix.sh

clean:
	rm -f *.html HTML.manifest
	rm -f ${TARGET}/*.html
	rm -f ${TARGET}/*.tar.gz
	rm -f ${TARGET}/*.txt
