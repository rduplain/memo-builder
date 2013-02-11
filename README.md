## memo-builder: finds structured text files, builds PDFs

### Overview

memo-builder provides a Makefile for GNU make on Unix-like systems, which
searches for all structured text files in the current directory and
subdirectories and builds each into a PDF, placed on the filesystem next to the
input file.

Collect your technical memos as structured text documents, and organize them on
the filesystem. Use memo-builder to build PDFs, then sync the filesystem to
publish. Since memo-builder creates PDFs in place, you are in complete control
of the directory structure. Use an [editor keybinding][emacs_integration] to
call out to make and build PDFs while editing memos, and a
[document viewer][evince] which auto-reloads PDFs on file-changes (and has
vi-like keybindings as a bonus).

If you need inspiration as to why this is important, see this lecture by
[John Cleese on Creativity](http://www.youtube.com/watch?v=VShmtsLhkQg).
"We've become fascinated by the fact that we can usually describe the way in
which people function at work in terms of two modes: open and closed."

 * *closed mode*: "We have inside us a feeling that there's lots to be done and
   we have to get on with it if we're going to get through it all."
 * *open mode*: "relaxed... expansive... less purposeful mode... in which we're
   probably more contemplative, more inclined to humor (which always
   accompanies a wider perspective) and, consequently, more playful."

Software: _closed_ is committing code; _open_ is figuring out what to do next.
memo-builder provides an environment for clear deliverables in the open mode.

[emacs_integration]: https://github.com/rduplain/home/blob/610e9361922266d86431f2a29971d93ac0a1d2cd/.emacs#L316
[evince]: http://projects.gnome.org/evince/


### Structured Text

Mostly, memo-builder is a wrapper around
[pandoc](http://johnmacfarlane.net/pandoc/),
using pdflatex for [LaTeX](http://www.latex-project.org/).

Currently supports structured text formats:

 * .md - [markdown](http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown)
 * .rst - [reStructuredText](http://docutils.sourceforge.net/docs/ref/rst/introduction.html)

Adding support for other pandoc-supported structured text formats is trivial. A
sample .md and .rst document are included in this repository, and a useful
comparison of pandoc's .md and .rst support is
[available online](http://www.unexpected-vortices.com/doc-notes/markdown-and-rest-compared.html).


### Add to Your Projects

Add memo-builder to your git project using a submodule:

    git submodule add https://github.com/rduplain/memo-builder.git memo-builder

Then in a Makefile at the root of your project (**indent with literal tabs**):

    all: pdfs

    include memo-builder/Makefile

    memo-builder/Makefile:
    	git submodule init
    	git submodule update

With this Makefile in place, just run `make` to build all PDFs. The 'include'
statement will do its work. If you already have an 'all' target, use `make
pdfs` or depend on the 'pdfs' target. If the memo-builder submodule has not
been initialized, the Makefile will call out to git to do so. Update to the
latest memo-builder with:

    cd memo-builder; git fetch && git reset --hard origin/master

A clean target in the Makefile could be:

    clean:
    	find . -name '*.pdf' -delete

You could also use `git clean` if you are careful about your git ignore and
untracked files:

    clean:
    	git clean -fx
