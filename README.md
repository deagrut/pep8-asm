# Pep/8 Assembly Language Extension

Language support for the Pep/8 assembly language.

This project is based on the [Pep/9 Assembly Language Extension](https://github.com/icorbrey/pep9-asm/) made by Isaac Corbrey ([icorbrey on GitHub](https://github.com/icorbrey/)), and on the [Pep Highlighter](https://github.com/StanWarford/pep8/blob/master/pephighlighter.cpp) regex's from the PEP/8 software, made by Stan Warford himself ([StanWarford on GitHub](https://github.com/StanWarford/)).

It mainly consists of only a few modifications to support the differences in Pep/8 mnemonics and directives.
Here is a non-exhaustive list of additions and modifications to pep9:
- `CHARI` and `CHARO` highlighting added.
- `RET0` to `RET7` highlighting added.
- Trace tags (in comments) highlighting added.
- Symbols highlighting corrected.
- Memory instructions (`LDr`, `LDBYTEr`, `STr`, `STBYTEr`) corrected.
- Traps instructions highlighting betterized.
- Etc.

![](https://github.com/deagrut/pep8-asm/raw/main/images/syntax-example.png)

## Features

Adds basic language support to Visual Studio Code for the Pep/8 assembly language (**still** `¯\_(ツ)_/¯`) used in (**some**) Computer Systems college courses.

## Release Notes

### 0.0.0

Initial release
