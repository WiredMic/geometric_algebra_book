##
# 1 semester rapport
#
# @file
# @version 0.1

all: build

clean:
	latexmk -C
	rm -fr _minted-main svg-inkscape

build:
	echo SOURCE_DATE_EPOCH=$(date +%s)
	latexmk
