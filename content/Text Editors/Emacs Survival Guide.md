---
tags:
  - emacs
  - keybindings
---

## Notes from the Emacs tutorial

The Tutorial can be accessed by `C-h t` or `M-x help-with-tutorial`.

Keyboard:

- `RET` is the `Return` or `Enter` key.
- `CONTROL`, `Ctrl` or `C` is the control key.
- `META` or `M` is the `Alt` or `Opt` key.
- `C-<chr>` means “hold control and type `<chr>`“.
- `M-<chr>` means “hold alt and type `<chr>`“.

`META` can also be gotten by typing and releasing `Esc` or `Ctrl+[`.

The place in the text where the cursor is is called “point“, because that is is the point where the cursor is in the text 😉.

`C-x C-c` to close Emacs.

`C-g` to quit or cancel a partially entered command.

`C-x k RET` to kills (close) the current buffer.

`C-v` and `M-v` to move forward and back (down and up) one screen of text.

`C-l` (lowercase L, not 1 (one)) to move the line where the cursor to the center of the screen. Repeating `C-l` moves line where the cursor is to the top, then to the bottom.

`C-p` and `C-n` to move the cursor to the previous and next line.

`C-b` and `C-f` to move the cursor back and forth by one character.

`M-b` and `M-f` moves the cursor back and forth by one _word_.f

> [!NOTE] Screen edges and scrolling
> When the cursor is at the edge of the screen, most these movement keybindings will scroll the screen in some appropriate way so that the cursor and the text surrounding it is still visilbe.

> [!INFO] meta vs control
> Notice the parallel between `C-f` and `C-b` on the one hand, and `M-f` and `M-b` on the other hand.  Very often *meta* characters are used for operations related to the units defined by language (words, sentences, paragraphs), while _control_ characters operate on basic units that are independent of what you are editing (characters, lines, etc).

`C-a` and `C-e` move to the beginning and end of a line.

`M-a` and `M-e` moves to the beginning and end of a sentence.

`M-<` (meta less-than, on some keyboards, needs `Shift` to type `<`) to move to the beginning of the buffer, and `M->` (meta more-than) to move to the end of the buffer.
