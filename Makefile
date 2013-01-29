makefile_directory := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
pandoc := pandoc --data-dir=$(makefile_directory)etc/pandoc
check := $(makefile_directory)bin/check_for_program

# Find all supported formats and collect target PDFs into a variable.
# Supported formats: .rst, .md
pdf_files := $(patsubst %.rst,%.pdf,$(wildcard *.rst))
pdf_files += $(patsubst %.md,%.pdf,$(wildcard *.md))
pdf_files_deep := $(patsubst %.rst,%.pdf,$(wildcard **/*.rst))
pdf_files_deep += $(patsubst %.md,%.pdf,$(wildcard **/*.md))

all: $(pdf_files) $(pdf_files_deep)

%.pdf: %.rst
	@$(check) pandoc pdflatex
	$(pandoc) -o $@ $<

%.pdf: %.md
	@$(check) pandoc pdflatex
	$(pandoc) -o $@ $<
