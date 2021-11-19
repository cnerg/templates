
manuscript = example-thesis
references = backmatter/bibliography
latexopt   = -halt-on-error -file-line-error --output-directory build

all: all-via-pdf

quick: $(manuscript).tex
	pdflatex $(latexopt) $(manuscript)

all-via-pdf: $(manuscript).tex
	mkdir -p build
	pdflatex $(latexopt) $(manuscript)
	makeglossaries -d build $(manuscript)
	bibtex build/$(manuscript)
	pdflatex $(latexopt) $(manuscript)
	pdflatex $(latexopt) $(manuscript)
	cp build/$(manuscript).pdf .

clean:
	rm -rf build/ $(manuscript).pdf *.dvi *.toc *.aux *.out *.log *.bbl *.blg *.log *.spl *~ *.spl *.zip *.acn *.glo *.ist *.epub *.idx *.lof *.lot

.PHONY: all clean