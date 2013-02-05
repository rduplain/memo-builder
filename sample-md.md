% Sample memo in markdown .md
% Ron DuPlain\
  <http://github.com/rduplain>
% 2013-02-04 - 2013-02-05

Purpose
-------

Provide a simple sample memo which includes some features that are not
obvious in the documentation for markdown or pandoc. [^1] See:

* <http://daringfireball.net/projects/markdown/syntax>
* <http://johnmacfarlane.net/pandoc/README.html>
* <http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown>
* <http://www.unexpected-vortices.com/doc-notes/markdown-and-rest-compared.html>

<!--
  This is a non-printing comment in .md.
  With multiple lines.
-->

[^1]: Together this document and linked resources should provide enough samples
      to put memo-builder to use with .md quickly.


Pandoc Notes
------------

Pandoc has thorough markdown support and documentation for its
[own dialect](http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown).

URLs are not automatic links. Use angle brackets `<http://example.com/>` to get
<http://example.com/> instead of http://example.com/.

Pandoc looks for a [title block][title-block] at the start of the document:

    % title
    % author(s) (separated by semicolons)
    % date

[title-block]: http://johnmacfarlane.net/pandoc/README.html#title-block

The expected fields are title, author/authors, and date. A header with the same
text as the title will display redundantly. That is, note that this document
lists the document title in the memo block, but does not list it again as
markdown header.

By default, the formatting of the title will space out individual authors. To
format the author list more explicitly, specify newlines with the backslash
character, `\`:

    % Regulated Waste Disposal: Safety of Citizens in and around Disposal Sites
    % Guy Smiley PE and Count von Count\
      Sesame Engineering, Inc.
    % Memo #001\
      2013-02-04

This results in a neatly formatted title block without gratuitous space, at the
expense of putting formatting detail (newlines) into the bibliographic
metadata. Take note of this when using bibliographic features, and update the
LaTeX template to meet formatting needs.


List Code
---------

List some code:

    echo 'Hello, world!'

Optionally, indicate the programming language to enable source code
highlighting. Use the short name of the target lexer in Pygment's [lexers],
using
[fenced code blocks](http://johnmacfarlane.net/pandoc/README.html#fenced-code-blocks).

~~~~ {.python}
# Python
print 'Hello, world!'
~~~~

~~~~ {.bash}
# Bash
echo 'Hello, world!'
~~~~

Pandoc supports numbering lines, though numbering is generally not needed.

~~~~ {.python .numberLines startFrom="10"}
# Python
print 'Hello, world!'
~~~~


Embed Image
-----------

Embed an image. Note how the caption is formatted.

![Type some memos.](typewriter.jpg)

(Source: <http://www.flickr.com/photos/welcometoalville/3270672561/>)

[lexers]: http://pygments.org/docs/lexers/
