# LaTeX

## Tools & Resources
- [Detexify](http://detexify.kirelabs.org/classify.html) - draw a LaTeX symbol and get the corresponding command
- [latex-snippets](https://github.com/gillescastel/latex-snippets) - Vim + LaTeX snippets setup
- [latex-templates](https://github.com/jleightcap/LaTeX-Templates) - Personal LaTeX templates.
- [LaTeX.css](https://latex.vercel.app/)
- [LaTeX Color Converter](https://mmoredo.github.io/latex-color-converter/) - Convert HEX and RGB to LaTeX's xcolor
- [LaTeX Templates](http://latextemplates.com/)
- [LaTeX to image converter](https://latex2image.joeraut.com/)
- [Mathpix Snip](https://mathpix.com/)
- [Quiver](https://q.uiver.app/) - Commutative diagram editor
- [TeXnique](https://texnique.xyz/) - This is a game to test your LaTeX skills. Type as many formulas as you can in three minutes (timed game), or play an untimed game (zen mode)!
- [The Not So Short Introduction to LaTeX](https://tobi.oetiker.ch/lshort/lshort-letter.pdf)
- [Tufte-book style](https://ctan.math.washington.edu/tex-archive/macros/latex/contrib/tufte-latex/sample-book.pdf)
- [Writespace](https://www.writespace.app/) - online Markdown and TeX renderer

## Threads
- [Looking for resources about the "inner workings" of (La)TeX, or intermediate resources](https://www.reddit.com/r/LaTeX/comments/b5e7vd/looking_for_resources_about_the_inner_workings_of/)
  - [The LaTeX Companion](https://www.amazon.com/LaTeX-Companion-Techniques-Computer-Typesetting/dp/0201362996)
  - [TeX by Topic](https://www.eijkhout.net/texbytopic/texbytopic.html)
- [I embedded a hidden, playable game in my dissertation](https://www.reddit.com/r/eastereggs/comments/qe81uv/i_embedded_a_hidden_playable_game_in_my/)
  - [Sliding square game in LaTeX](https://tex.stackexchange.com/questions/444917/the-tikz-game-package-a-tex-sx-project/444956#444956)
  - [Dissertation Slide Puzzle - Pastebin.com](https://pastebin.com/xrUHbMnY)

## Notes
- Use the `listings` LaTeX package to input inline code
  - Use `\begin{lstlisting}` and `\end{lstlisting}` and put code in between or,
  - Use `\lstinputlisting[language=foo]{bar.foo}` to input it directly from the file `bar.foo`
	- _[Source](https://www.overleaf.com/learn/latex/code_listing)_
- `\i` and `\j` produce i and j without dots, e.g. so you can put symbols on top without the dot interfering.

## Installing on Arch
```
sudo pacman -S texlive-core
yay tllocalmgr-git
```

## Installing packages

```
tllocalmgr
> install <package>
> texhash
```

## LaTeX in Atom

### Packages
- latex
- pdf-view
- language-latex

[Source](https://medium.com/@lucasrebscher/using-atom-as-a-latex-editor-93756de3d726)

## Quantum

### Packages
- `braket`
- `qcircuit`
- `xypic`
