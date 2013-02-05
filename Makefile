makefile_directory := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
pandoc := pandoc --data-dir=$(makefile_directory)etc/pandoc
check := $(makefile_directory)bin/check_for_program

# Support for individual formats presents a pattern below.
# However, code is not moved into a common recipe, for two reasons:
#
# 1. Readability - Combining reused code would either (a) move the pandoc
#    wrapper into an external tool, and thereby hiding its details, or (b)
#    cause for a mess of meta-Makefile calls, and as neat as that might be, it
#    becomes difficult for even experienced Makers to read.
#
# 2. Specialization - In the event a special action is required for a specific
#    extension, there is an obvious place to put it without detracting from
#    other extensions; see reason 1.

# Find all supported formats and collect target PDFs into a variable.
# Supported formats: .rst, .md
rst_files := $(shell find . -name '*.rst')
pdf_files := $(rst_files:%.rst=%.pdf)

md_files := $(shell find . -name '*.md')
pdf_files += $(md_files:%.md=%.pdf)

pdfs: $(pdf_files)

# Change directories to support relative paths of included files, e.g. images.

%.pdf: %.rst
	@$(check) pandoc pdflatex
	$(eval directory := $(dir $<))
	$(eval input := $(notdir $<))
	$(eval output := $(notdir $@))
	cd $(directory); $(pandoc) -o $(output) $(input)

%.pdf: %.md
	@$(check) pandoc pdflatex
	$(eval directory := $(dir $<))
	$(eval input := $(notdir $<))
	$(eval output := $(notdir $@))
	cd $(directory); $(pandoc) -o $(output) $(input)
