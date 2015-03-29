Markdown Automation
================================================================================

This, at the most basic, is a Makefile-driven flow for generating a
.html Markdown output from input .md sources. Anything that you put in
the src directory will be converted to a corresponding file in build.
This Makefile also respects whatever directory conventions you use in
src, i.e., all subdirectories of src will be replicated in build.

Included scripts:

### Captains Log - `scripts/captains-log`

Maintains a log of daily notes. This will create and maintain a
captains-log/$YEAR/$MONTH directory structure in the src directory.
One log is used per day and will populate the $MONTH subdirectory.
Your default $EDITOR is used to edit the current log. Before exiting,
`captains-log` creates a recent log (from the past 30 log entries) and
dumps this in captains-log/recent.md. It then runs `make` to convert
all the log *.md to *.html.

### Markdown Chooser - `scripts/markdown-chooser`

Used by the Makefile to try and find either `gfm`, a GitHub-Flavored
Markdown parser (part of
[Docter](https://github.com/alampros/Docter)), or `markdown` (see
[Daring Fireball Markdown](http://daringfireball.net/projects/markdown/)).
This consequently depends on you having one of these available in your
$PATH.
