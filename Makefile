# Makefile driven Markdown parser suitable for documentation,
# websites, etc.
#
# Point of Contact: Schuyler Eldridge <schuyler.eldridge@gmail.com>

SHELL = bash
abs_top_dir = $(PWD)
build_dir   = $(abs_top_dir)/build
src_dir     = $(abs_top_dir)/src
CSS         = $(src_dir)/ghf_marked.css
pandoc_flags = \
	-c $(src_dir)/ghf_marked.css \
	-s \
	-f markdown_github

SOURCES_MD  = $(shell find $(src_dir) -name \*.md$ | sed 's?$(src_dir)/??')

# The targets are all the sources with an
TARGETS_HTML = $(SOURCES_MD:%.md=$(build_dir)/%.html)
vpath %.md $(src_dir) .

.PHONY: all clean

all: $(TARGETS_HTML)

$(build_dir)/%.html: $(src_dir)/%.md Makefile | $(build_dir)
	@if [ ! -d $(shell echo $@ | grep -o "^.\+/") ]; then echo $@ | grep -o "^.\+/" | xargs mkdir -p; fi
	@pandoc $(pandoc_flags) $< > $@
	@echo [info] gen $<

$(build_dir):
	@mkdir $@
	@echo [info] mkdir $@

clean:
	rm -rf $(build_dir)
