---
tags:
  - asciidoc
  - asciidoctor
  - markup
description: Notes, tips and examples on AsciiDoc and Asciidoctor
---
# AsciiDoc

## Introduction

AsciiDoc is the best non-html-like markup language. It is simpler as Markdown for the simple things, while also offering way more useful, powerful and advanced features if when they are needed.

## Convert Markdown to AsciiDoc

To convert from Markdown to AsciiDoc, use kramdown. It is better suited than pandoc as it has more AsciiDoc-sensible options.

```bash
$ gem install kramdown kramdown-asciidoc

$ for file in ./*.md ; do
    kramdoc \
      --format=GFM \
      --output="${file%.md}.adoc" \
      --wrap=ventilate "$file"
  done

$ rm -vi ./*.md
```

## Convert AsciiDoc to Markdown

* https://github.com/opendevise/downdoc

In short:

```bash
$ npx downdoc -o ./intro.md ./intro.adoc
```

## Source Highlighter

Add this attribute to the document:

```text
= My Title
:toc: left
...
:source-highlighter: <which highlighter to use>
```

As of 2023, the docs currently say for pygments we simply write `pygments`.

![Asciidoctor source highlighter pygments 2023](asciidoctor-source-highlighter-pygments.rb-2023.png)

but I got an error with this:

```text
= My Title
:toc: left
...
:source-highlighter: pygments
```

```shell-session
$ asciidoctor ./algds/other/prime_factors/README.adoc
asciidoctor: WARNING: optional gem 'pygments.rb' is not available (reason: cannot load 'pygments'). Functionality disabled.
```

But if I changing to `pygments.rb` works:

```text
= My Title
:toc: left
...
:source-highlighter: pygments.rb
```

### Source Highlighter Not Working

We have observed at times that if `asciidoctor` is installed from a `Gemfile` and `pygments.rb` is installed with `gem install`, it may fail (with no errors) to add the tags around the code tokens.

Installing everything from `Gemfile` and then running `bundle exec asciidoctor file.adoc` worked.

One can preview AsciiDoc rendered document in many ways, including editors, browser extensions, or on Gitlab, Github, and probably other services as well.

* [Asciidoctor.js live preview addon for Firefox](https://addons.mozilla.org/en-US/firefox/addon/asciidoctorjs-live-preview/).

## Writing Best Practices

Do follow the [one sentence per line](https://asciidoctor.org/docs/asciidoc-recommended-practices/#one-sentence-per-line) approach.

## AsciiDoc on Emacs

Check [adoc-mode](https://github.com/bbatsov/adoc-mode).

### adoc-mode image preview not working

I had a problem where the image preview was not working.

The reason was the characters ++&#44;++ inside the alt description of the image that causing some parsing issue or something. Removing some of those symbols caused the image preview to start working as expected.

I ended up turning this:

```text
image:__assets/reserved-words.png[OpenGroup POSIX Spec&#44; on Reserved Words]
```

To this:

```text
image:__assets/reserved-words.png[OpenGroup POSIX Spec on Reserved Words].
```

Then the image preview worked as expected.

### Ventilated Prose (aka “one sentence per line”)

Don’t wrap text at a fixed column width. Instead, put each sentence on its own line, a technique called sentence per line. This technique is similar to how you write and organize source code. The result can be spectacular.

Here are some of the advantages of using the sentence per line style:

* It prevents reflows (meaning a change early in the paragraph won’t cause the remaining lines in the paragraph to reposition).
* You can easily swap sentences.
* You can easily separate or join paragraphs.
* You can comment out sentences or add commentary to them.
* You can spot sentences which are too long or sentences that vary widely in length.
* You can spot redundant (and thus mundane) patterns in your writing.

We picked up this idea from the writing guide in the Neo4j documentation. However, it seems like the idea dates back a discovery by Buckminster Fuller in the 1930s, who called it [ventilated prose](https://vanemden.wordpress.com/2009/01/01/ventilated-prose/). The technique was also recommended in 2009 by Brandon Rhodes in a blog post about [semantic linefeeds](https://rhodesmill.org/brandon/2012/one-sentence-per-line/).

It’s important to note that this technique works because AsciiDoc doesn’t treat wrapped lines in prose as hard line breaks. At least, it doesn’t show up that way to the reader. The line breaks between contiguous lines of prose will not be visible in the rendered document (i.e., as the reader sees it). While a single line break doesn’t appear in the output, two consecutive line breaks starts a new paragraph (or other block).

## Disable code-block italic fonts

Asciidoctor can produce output documents with nice source code syntax highlighting using an external source highlighter (Pygments, Highlight.js, etc.).

See:

* [Source Code Blocks on the Asciidoctor documentation](https://docs.asciidoctor.org/asciidoc/latest/verbatim/source-blocks/).
* [Source Highlighting on the Asciidoctor documentation](https://docs.asciidoctor.org/asciidoc/latest/verbatim/source-highlighter/).

> [!NOTE]
> The tips that follow assume we are generating HTML output from our Asdiidoctor documents.

Most source highlighter programs style certain tokens in the source listings as italic.
Some people (like myself) prefers no italics in source code.

To disable italics completely for comments, keywords, identifiers, etc., we have to know which CSS classes are applied and override them.

Basically, create a passthrough block at the end of your `.adoc` file as in the examples below.

> [!NOTE]
> The approach below will work if you are previewing Asciidoctor documents locally on a browser (with the preview extension), or if you generate the HTML with `asciidoctor` command line locally.
>
> That said, it is unclear that Gitlab, Github or other platforms will apply our style overrides. Probably not.

### Disable italic for source code listings

Below are some selectors to disable italics for at least some source code highlighting tools, like Pygments and Highlight.js.

```text
++++
<style type="text/css" rel="stylesheet">
.hljs-comment,
pre.pygments .tok-c1 {
  font-style: normal;
}
</style>
++++
```

## My preferred Asciidoctor style overrides

```text
++++
<style type="text/css" rel="stylesheet">
body {
  font-family: Ubuntu, 'Noto Sans', 'Open Sans', Helvetica, Arial;
}

.hljs-comment,
pre.pygments .tok-c1 {
  font-style: normal;
}
</style>
++++
```
