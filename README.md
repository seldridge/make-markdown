# Markdown Automation

test

[![Build Status](https://travis-ci.org/seldridge/make-markdown.svg?branch=master)](https://travis-ci.org/seldridge/make-markdown)

This is a Makefile-driven flow for generating a `.html` Markdown output
from input `.md` with minimal dependencies (only `pandoc`). Anything that
you put in the `src/` directory will be converted to a corresponding file
in the `build/` directory when you type `make`. This basic flow is
augmented with scripts that enable _more complex_ functionality (e.g., a
daily log or a personal blog).

Known dependencies can be cleared (on Ubuntu) with:
```bash
apt install pandoc
git submodule update --init
```

### Scripts

The `scripts/` directory provides scripts that enable _more complex_
functionality beyond basic Markdown to HTML conversion. Available scripts
are detailed below.

#### Captains Log: [`scripts/captains-log`](scripts/captains-log)

This provides very basic blog-like functionality. The original intent of
this script is to provide a quick way to keep track of a daily work log.

Calling this with no arguments will open your `$EDITOR` to edit a file in
`src/captains-log/YYYY/MM/DD.md`. If the file does not exist, it will be
created with a boilerplate title. Upon closing this editor, all markdown
is converted to HTML in `build/captains-log/*` and a summary file
`build/captains-log/recent.html` that contains flattened recent entries a
flat index of all logs.

The contents of `build/captains-log` are then suitable for a daily log of
work or as a blog you can publish.

Full usage text is shown below:
```
Usage: captains-log [OPTION]... [DATE]
Open a Captain's Log for the DATE (today by default). DATE format must be
YYYY-MM-DD.

Options:
  -b BROWSER                 use BROWSER with the -o option
  -e EDITOR                  use EDITOR to open the file (default: '$EDITOR')
  -h                         show this help text
  -o                         open summary in a browser (default: '$BROWSER')
  -t TITLE                   use TITLE for log title (default: 'Captain's Log')
```
