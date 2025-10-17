---
tags:
  - cmdline
  - column
---
## Intro

The unix `column` command line utility columnates lists and csv-style data.

Note that the `column` utility is not part of the [POSIX specification](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
Among other things, it means different systems will support a different feature set.
And as always, GNU command line utilities offer a larger (and arguably better) set of features.
## Initial example

For example, if the columns are separated with spaces (and tabs are also considered spaces by default):

```bash
cat <<EOF | column -t
ID NAME EDITOR
1 Bram vim
2 Richard emacs
3 Vader ed
EOF
ID  NAME     EDITOR
1   Bram     vim
2   Richard  emacs
3   Vader    ed
```

Or, if the fields are separated with some other character, like “,” (comma), then we use `-s,` to make `column` use “,” as the separator:

```bash
$ cat <<EOF | column -ts,
ID,NAME,EDITOR
1,Bram,vim
2,Richard,emacs
3,Vader,ed
EOF
ID  NAME     EDITOR
1   Bram     vim
2   Richard  emacs
3   Vader    ed
```

And if the data is on a file, we can do something like this:

```bash
$ column -ts, -- ./heroes.csv 
ID  NAME     EDITOR
1   Bram     vim
2   Richard  emacs
3   Vader    ed
```

## Line to long error

Sometimes the input is missing the final newline. Could happen because it doesn't have the newline, or when copying the content it gets missing.

## Misalignment on Tab separator

Give this input:

```text
"Mad Max Beyond Thunderdome"	6.1
"Aliens"	8.5
"Terminator 3: Rise of the Machines"	6.4
"Lethal Weapon 2"	7.1
"Predator"	7.8
"Braveheart"	8.4
"The Terminator"	8.1
"RoboCop"	7.5
"Commando"	6.5
"Lethal Weapon"	7.6
"Rambo III"	5.4
"Rambo: First Blood Part II"	6.2
"Die Hard"	8.3
"Mad Max 2"	7.6
"Predator 2"	6.1
"Terminator 2: Judgment Day"	8.6
"Mad Max"	7
"Lethal Weapon 3"	6.6
"First Blood"	7.6
"Alien"	8.5
```

The separator between the string and the number is a tabulation character, hex `0x09` not spaces. Trying to feed that to `column -t -s \\t` or `column -t -s '\t'` would yield this wrong result:

```text
"Mad Max Beyond Thunderdome"	6.1
"Aliens"	8.5
"Termina                         or 3: Rise of     he Machines"	6.4
"Le                              hal Weapon 2"	7.1
"Preda                           or"	7.8
"Bravehear                       "	8.4
"The Termina                     or"	8.1
"RoboCop"	7.5
"Commando"	6.5
"Le                              hal Weapon"	7.6
"Rambo III"	5.4
"Rambo: Firs                      Blood Par         II"	6.2
"Die Hard"	8.3
"Mad Max 2"	7.6
"Preda                           or 2"	6.1
"Termina                         or 2: Judgmen      Day"	8.6
"Mad Max"	7
"Le                              hal Weapon 3"	6.6
"Firs                             Blood"	7.6
"Alien"	8.5
```

The problem is that `\\t` becomes `\t`, just as `'\t'` becomes `\t`, and some column implementations do not interpret that as tab. What we need is to provide a real tabulation (`0x09`) character for the separator.

With most shells, `$'\t'` will do the trick. Also, in some combinations of terminal & shell, it is possible to type an actual tabulation character by `Ctrl+v Tab` (similar to Emacs `C-c q Tab` or Vim `C-v Tab`). I had to enclose the tabulation in quotes, that is.

Hit `column -s -t` followed by open quotes, then type the literal tab with `Ctrl+v Tab`, then close the quote, then enter.

A Tab can also be produced with `printf '\t'` or `printf \011`, so something like this would work too: `column -t -s "$(printf '\011')"`.