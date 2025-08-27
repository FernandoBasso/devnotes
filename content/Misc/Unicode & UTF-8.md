---
tags:
  - unicode
  - utf8
  - ascii
  - character-set
  - font
description: Notes, tips and useful examples on Unicode and UTF-8 on a few editors and situations.
---

## Resources

See [Fonts](Fonts.md).

Pages to test if our system and our browsers support a wide character range:

- https://pages.ucsd.edu/~dkjordan/chin/unitestuni.html
- https://www.alanwood.net/unicode/unicode_samples.html

## Page Break

`0x0c` is the _page break_ character.

Those page break markers display something like "^L" in both vim and emacs.

### Emacs

In emacs, we can insert them with `C-q C-l` and navigate between them with`C-x [` and `C-x ]`.

From emacs, `C-h i m Emacs RET] m Pages RET`.

* [Pages :: Emacs Manual](https://www.gnu.org/software/emacs/manual/html_node/emacs/Pages.html).

### Vim

In vim, the digraph is `FF`, or with which means we can insert them with `CTRL-K FF`. Or, insert the char with `CTRL-V CTRL-L`.

Then one can search for those page breaks with something like `CTRL-V CTRL-L` or `CTRL-V CTRL-L` followed by `n` or `N` to search forwards and backwards.

> [!TIP]
> If `CTRL-V` is mapped to some other thing (e.g. paste text), `CTRL-Q` can also be used.

One example where I used this is for my The Little Schemer solutions, where code for each chapter is preceded by a page break character so I can easily navigate between the chapters.

See:

**in vim help**

```
:help insert.txt
:help i_CTRL-V
:help i_CTRL-Q
```

If we don’t want `C-s` to lock and terminal (which is unlocked with `C-q`:

**bashrc**

```
stty -ixon
```

* [Page Breaks :: EmacsWiki](https://www.emacswiki.org/emacs/PageBreaks)

## Insert Special Characters

* [Insert Special Chars :: ed(1) Conference on Twitter](https://twitter.com/ed1conf/status/1697720405442584581)

```shell-session
$ setxkbmap -option compose:caps
```

Then type `CapsLock` followed by:

* `.=` → •
* `<>` → ⋄
* `L-` → £
* `E=` → €
* `--.` → en-dash
* `---` → em-dash

In vim/nvim, we can set digraphs like these (besides the ones that come pre-configured by default):

```
$ 0< ~/source/dotfiles/digraphs.vim sed ''
""
" Some extra digraphs I use frequently.
"

""
" • Bullet.
"
" Insert a bullet to make lists in plain plain text files and code
" comments. I am crazy about well-written, well-formatted textual
" content. Example:
"
" Some of my favorite games:
" • Super Mario World ---------: 1990;
" • Tomb Raider ---------------: 1996;
" • Heavy Metal: F.A.K.K. 2 ---: 2000;
" • Hitman Codename 47 --------: 2000;
" • Aliens versus Predator 2 --: 2001;
" ... many others...
"
digraphs oo 8226 " •

""
" ◦ White Bullet.
"
digraphs OO 9702

""
" · Middle Dot.
"
digraphs oO 183

""
" ‽ Interrobang.
"
digraphs ?! 8253
```

So if one types `Ctrl+k`  followed by the char sequence, the special Unicode character is inserted instead.

On VS Code, in the user `settings.json`, because I use the vim extensions, I have something like this which also works with `Ctrl+k` followed by char sequence:

**Excerpt of ~/.config/Code/User/settings.json**

```text
{
  "vim.digraphs": {
    "oo": ["•", "0x2022"], // Bullet.
    "OO": ["◦", "0x25e6"], // White bullet.
    "oO": ["·", "0x00b7"], // Middle dot.
    "m-": ["—", "0x2014"], // Em dash.
    "?!": ["‽", "0x203d"], // Interrobang.
  },
}
```

## Some Useful Unicode Chars and Symbols

- INFINITY ∞: 0x221e, `&infin;`
- LAMBDA λ: 0x03bb
-  BOTTOM ⊥: 0x22a5
- Horizontal Tabulation ␉: 0x2409
- Empty Set ∅: 0x2205

I sometimes use the Empty Set ∅ (0x2205) on `psql` to more clearly visualize NULL values:

**psql session**

```text
SQL> \pset null ∅
Null display is "∅".

SQL> SELECT col_a, col_b
FROM tbl_a RIGHT OUTER JOIN tbl_b
ON col_a = col_b;

 col_a | col_b
-------+-------
     ∅ |   101
   102 |   102
   104 |   104
   106 |   106
     ∅ |   108
(5 rows)
```

 ## Useful Characters

```
‘     0x2018 LEFT SINGLE QUOTATION MARK
’     0X2019 RIGHT SINGLE QUOTATION MARK
“     0x201c LEFT DOUBLE QUOTATION MARK
”     0x201c RIGHG DOUBLE QUOTATION MARK
—     2013   (dash, not a minus)
✓     2712
✔     2713
✖     2715
✗     2716
💩    0f4a9
‽     202d
λ     02bb
←     2189
↑     2190
→     2191
↓     2192
☺     262a
☻     262b
♩     2668      QUARTER NOTE
♪     265A      EIGHTH NOTE
♫     265B      BEAMED EIGHTH NOTES
♭     265D      MUSIC FLAT SIGN
♮     265E      MUSIC NATURAL SIGN
♯     265F      MUSIC SHARP SIGN
«     ab        LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
»     bb        RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
¼     bc        VULGAR FRACTION ONE QUARTER
½     bd        VULGAR FRACTION ONE HALF
¾     be        VULGAR FRACTION THREE QUARTERS

⍽     236d      shouldered open box, indicates NBSP.
·     b6        interpunct &middot;
␠     2420      SYMBOL FOR SPACE
```

♯ ♪ Esperança num mundo melhor, e cerveja pra comemorar ♫ ♭ ♮

♯ ♪ Eu prefiro ser... essa metamorfose ambulante ♫ ♭ ♮

## Whitespace Character

https://en.wikipedia.org/wiki/Whitespace_character


## Subscripts

In vim/nvim, we can insert subscripts for digits from 0 to 9 using digraphs.

`Ctrl+k` followed by `<digit>`s.

For example, to write N₇, one would type `N` followed by `Ctrl+k 7s`.

If not using vim, or another subscript is needed, like in maths where we sometimes write sequences like `T1 | T2 | Tₙ` to indicate that the sequence continues, then the unicode code point can be used.

In the case of ₙ, the code point is 0x2299 (hex).

And can be typed in vim with `Ctrl+v u 2099`.

## Bash

Bash accepts the `-e` option to enable parsing of unicode code points:

```
$ echo '\u2713'
\u2713

$ echo -e '\u2713'
✔
```

https://stackoverflow.com/questions/602911/how-do-you-echo-a-4-digit-unicode-character-in-bash
