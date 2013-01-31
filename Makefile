makefile_directory := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
pandoc := pandoc --data-dir=$(makefile_directory)etc/pandoc
check := $(makefile_directory)bin/check_for_program

# Find all supported formats and collect target PDFs into a variable.
# Supported formats: .rst, .md
rst_files := $(shell find . -name '*.rst')
pdf_files := $(rst_files:%.rst=%.pdf)

md_files := $(shell find . -name '*.md')
pdf_files += $(md_files:%.md=%.pdf)

pdfs: $(pdf_files)

%.pdf: %.rst
	@$(check) pandoc pdflatex
	$(pandoc) -o $@ $<

%.pdf: %.md
	@$(check) pandoc pdflatex
	$(pandoc) -o $@ $<
