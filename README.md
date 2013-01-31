## memo-builder: finds structured text files, builds PDFs

memo-builder provides a Makefile for GNU make on Unix-like systems, which
searches for all structured text files in the current directory and
subdirectories and builds each into a PDF, placed on the filesystem next to the
input file.

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

Add memo-builder to your git project using a submodule:

    git submodule add https://github.com/rduplain/memo-builder.git memo-builder

Then in a Makefile at the root of your project (note literal tabs):

    all: pdfs

    include memo-builder/Makefile

    memo-builder/Makefile:
    	git submodule init
    	git submodule update

With this Makefile in place, just run `make` to build all PDFs. The 'include'
statement will do its work. If you already have an 'all' target, use `make
pdfs` or depend on the 'pdfs' target. If the memo-builder submodule has not
been initialized, the Makefile will call out to git to do so. Update to the
latest memo-builder with `git submodule update`.

[emacs_integration]: https://github.com/rduplain/home/blob/610e9361922266d86431f2a29971d93ac0a1d2cd/.emacs#L316
