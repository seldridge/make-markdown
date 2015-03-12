`make-markdown` -- Markdown Automation
================================================================================

A simple Makefile-driven flow for generating a `.html` Markdown output
from input sources.

Branch [master](https://github.com/seldridge/make-markdown/tree/master) is clean and suitable for cloning while branch [website](https://github.com/seldridge/make-markdown/tree/website) contains a website example (well, my current website).

The Makefile will build everything that it sees in the `src` directory
that matches `*.md`. These will be fed through either `gfm`, a
GitHub-Flavored Markdown parser (part of
[Docter](https://github.com/alampros/Docter)) or `markdown` (see
[Daring Fireball Markdown](http://daringfireball.net/projects/markdown/)). This consequently depends on you having one of these available in your `PATH`.
