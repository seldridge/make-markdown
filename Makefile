# Copyright 2018 Schuyler Eldridge
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SHELL = bash
abs_top_dir = $(PWD)
build_dir   = $(abs_top_dir)/build
src_dir     = $(abs_top_dir)/src
CSS         = $(src_dir)/ghf_marked.css
pandoc_flags = \
	-c $(src_dir)/github-markdown-css/github-markdown.css \
	-s \
	-f markdown_github \
	-B $(src_dir)/before.html \
  -A $(src_dir)/after.html

SOURCES_MD  = $(shell find $(src_dir) -name \*.md$ | sed 's?$(src_dir)/??')

# The targets are all the sources with an
TARGETS_HTML = $(SOURCES_MD:%.md=$(build_dir)/%.html)
vpath %.md $(src_dir) .

.PHONY: all clean

all: $(TARGETS_HTML)

$(build_dir)/%.html: $(src_dir)/%.md Makefile | $(build_dir)
	@if [ ! -d $(shell echo $@ | grep -o "^.\+/") ]; then echo $@ | grep -o "^.\+/" | xargs mkdir -p; fi
	@pandoc $(pandoc_flags) $< > $@
	@echo "[info] gen $<"

$(build_dir):
	@mkdir $@
	@echo "[info] mkdir $@"

clean:
	rm -rf $(build_dir)
