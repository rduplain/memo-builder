## memo-builder: finds structured text files, builds PDFs

memo-builder provides a Makefile for GNU make that searches for all structured
text files in the current directory and subdirectories and builds each into a
PDF, placed on the filesystem next to the input file.

Collect your technical memos as structured text documents, and organize them on
the filesystem. Use memo-builder to build PDFs, then sync the filesystem to
publish. Since memo-builder creates PDFs in place, you are in complete control
of the directory structure. Use an [editor keybinding][emacs_integration] to
call out to make and build PDFs while editing memos.

Mostly, memo-builder is a wrapper around
[pandoc](http://johnmacfarlane.net/pandoc/),
using pdflatex for [LaTeX](http://www.latex-project.org/).

Currently supports structured text formats:

 * .md - [markdown](http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown)
 * .rst - [reStructuredText](http://docutils.sourceforge.net/docs/ref/rst/introduction.html)

Adding support for other pandoc-supported structured text formats is trivial.

[emacs_integration]: https://github.com/rduplain/home/blob/610e9361922266d86431f2a29971d93ac0a1d2cd/.emacs#L316
