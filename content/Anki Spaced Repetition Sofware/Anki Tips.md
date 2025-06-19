---
tags:
  - anki
  - spaced-repetition
  - deliberate-practice
---
## HTML Cards

## HTML markup and CSS classes

All types of notes should have a wrapper `div` element with a few specific classes.
One such class is always `anki`, followed by other classes depending on the note type.

Look at `./anki-templ.sh` to understand how to use the helper shell script to quickly copy templates to the clipboard (which can then be pasted into Anki card editor and thus follow some conventions for creating card using HTML markup).

```html
<div class="anki ...">
  ...
</div>
```

### Basic front and back

For the basic question & answer type of card.
Use `anki front` and `anki back` classes.

Front:

```html
<div class="anki front">
  <p>The question.</p>
</div>
```

Back:

```html
<div class="anki back">
  <p>The answer.</p>
</div>
```

### Cloze deletion

Use the `anki cloze` classes`.

```html
<div class="anki cloze">
  <p>Cloze deletion text.</p>
</div>
```

### Extra field

For note types that contain the “extra” field, use the `anki extra` classes:

```html
<div class="anki extra">
  <p>Extra information.</p>
</div>
```

## Source Code Blocks

For source code blocks, always include classes like these on the
`<code>` tag:

- `lang-shell`
- `lang-c`
- `lang-go`
- `lang-haskell`
- `lang-javascript`
- `lang-diff`