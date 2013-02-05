======================================
 Sample memo in reStructuredText .rst
======================================

 :Author: | Ron DuPlain
          | http://github.com/rduplain
 :Date: 2013-02-04 - 2013-02-05


Purpose
-------

Provide a simple sample memo which includes some features that are not obvious
in the documentation for reStructuredText or pandoc. [1]_ See:

* http://docutils.sourceforge.net/rst.html
* http://johnmacfarlane.net/pandoc/README.html
* http://www.unexpected-vortices.com/doc-notes/markdown-and-rest-compared.html

.. This is a non-printing comment in .rst.
   With multiple lines.

.. [1] Together this document and linked resources should provide enough
       samples to put memo-builder to use with .rst quickly.


Pandoc Notes
------------

Pandoc typically operates as expected for the core features of
reStructuredText, but has its own implementation of `rst directives`__.
Therefore, expect to experiment when using features with directives
(e.g. ``.. image::``), particularly in field lists (e.g. ``:scale: 50%``).

__ http://docutils.sourceforge.net/docs/ref/rst/directives.html

As with any markup engine, some obscure syntax will be interpreted differently
between docutils and pandoc. It could be a bug in one or the other, but in
general, a slight change of formatting in the source .rst doc will work around
it.

The fields for title, author/authors, and date are extracted from a field list
at the start of the .rst document. These fields are ``Title``, ``Author``,
``Authors``, and ``Date``. The top-level section header, if provided, is
promoted to the document title if ``:Title:`` is not explicitly given in the
field list. The field-listed ``Title`` is only used when the field list is
before the section header.

By default, the formatting of the title will space out individual authors and
their organizations. To format the author list more explicitly, use
reStructuredText's line block formatting with the pipe character, ``|``::

    :Author: | Guy Smiley PE and Count von Count
             | Sesame Engineering, Inc.
    :Date:   | Memo #001
             | 2013-02-04

This results in a neatly formatted title block without gratuitous space, at the
expense of putting formatting detail (newlines) into the bibliographic
metadata. Take note of this when using bibliographic features, and update the
LaTeX template to meet formatting needs.


List Code
---------

List some code::

   echo 'Hello, world!'

Optionally, indicate the programming language to enable source code
highlighting. Use the short name of the target lexer in Pygment's lexers_.

.. code-block:: python

    # Python
    print 'Hello, world!'

.. code-block:: bash

    # Bash
    echo 'Hello, world!'


Embed Image
-----------

Embed an image. Note how the caption is formatted.

.. image:: typewriter.jpg

   Type some memos.

   (Source: http://www.flickr.com/photos/welcometoalville/3270672561/)


.. _lexers: http://pygments.org/docs/lexers/
