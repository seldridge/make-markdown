# Makefile driven Markdown parser suitable for documentation,
# websites, etc.
#
# Point of Contact: Schuyler Eldridge <schuyler.eldridge@gmail.com>

#--------------------------------------- Configuration that _should_ be static
DIR_BUILD   = build
DIR_SRC     = src
DIR_SCRIPTS = scripts
CSS         = $(DIR_SRC)/ghf_marked.css

# The sources are anything inside the src directory or in the
# top-level directory (due to the way GitHub handles wikis) that
# matches *.md
SOURCES_MD  = $(shell find $(DIR_SRC) -regex .+\.md$ | sed 's/$(DIR_SRC)\///') \
	$(shell find -maxdepth 1 -regex .+\.md$)

# The targets are all the sources with an
TARGETS_HTML= $(SOURCES_MD:%.md=$(DIR_BUILD)/%.html)

SPACE       = $(EMPTY) $(EMPTY)

vpath %.md $(DIR_SRC) .


#--------------------------------------- Build rules
.PHONY: all clean refresh-conkeror

# Default target.
all: $(TARGETS_HTML) refresh-conkeror refresh-luakit

# HTML build rule
$(DIR_BUILD)/%.html: %.md Makefile
	if [ ! -d $(shell echo $@ | grep -o "^.\+/") ]; then echo $@ | grep -o "^.\+/" | xargs mkdir -p; fi
	echo "<style>/*" > $@;
	cat $(CSS) >> $@;
	echo "</style><div class="md"><article>" >> $@;
	$(DIR_SCRIPTS)/markdown-chooser $< >> $@

# This will send key "r" to all instances of `conkeror` using the
# `xdotool`. I like to keep `conkeror` running beside my `emacs`. This
# will then cause the webpage to be forcibly updated at the end of the
# build.
refresh-conkeror:
	if [[ `pidof -x conkeror` ]]; then \
	xdotool search "conkeror" | xargs -I WIN xdotool key --window WIN r; fi

refresh-luakit:
	if [[ `pidof -x luakit` ]]; then \
	xdotool search "luakit" | xargs -I WIN xdotool key --window WIN r; fi

clean:
	rm -rf $(DIR_BUILD)/*
