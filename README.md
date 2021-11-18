# Thesis Template
This branch is a starting point for a thesis or prelim document.
It follows UW-Madison [formatting requirements](https://grad.wisc.edu/current-students/doctoral-guide/).
Below you will find explanations of the different files and inputs you can customize.
Adapted from: [https://github.com/willb/wi-thesis-template]

## File Structure:

 - `example-thesis.tex`: This is the main LaTeX file that points to all other information. This files is meant to be edited. See below for specific inputs for this file.

 - `includes/`: contains all information related to formatting and settings for the document

    - `preamble.tex`: contains all things that would be found in the preamble of a document (aka the top part). This currently is just all required `\usepackage{}` inputs and some thesis required styling. This file is meant to be edited to include more packages as necessary.

    - `thesisdefs.tex`: This file is NOT meant to be edited. This provides formatting for the title page, and definitions for thesis related sections.

 - `frontmatter/`: This folder contains all content that you would find at the beginning of a document before the "technical" content.

    - `frontmatter.tex`: the central point for setting up the frontmatter. Additional content is NOT intended to be added to this file, but if you would like to remove a section such as acknowledgements, dedication, list of tables/figures, nomenclature, or abstract, you should comment out those lines in this file. All the content of these things are formatted automatically by reading the content in other files.

    - `dedication.tex`: Write your dedication here.

    - `acknowledgements.tex`: Write your acknowledgements here.

    - `acronyms.tex`: this is where you define acronyms to use throughout your document. It follows the `acro` package syntax. Only the acronyms from this list that are used in the text of the main file will appear in the nomenclature list. Acronyms can be used in text with the `\ac{}` command.

    - `abstract.tex`: Write your abstract here.


 - `backmatter/`: this folder contains all info that may appear at the end of your document.

    - `backmatter.tex`: bibliography style is set here and bibliography is created. If your `.bib` file is named something other than `bibiliography.bib` and/or not located in the `backmatter/` folder, then that line needs to be edited. If you do not have an appendix to include, the input line for the appendix should also be removed. If you have more than one appendix, you can make additional `\input` calls here.

    - `bibliography.bib`: bibtex file

    - `appendix.tex`: create an appendices in this file.

 - `content/`: content for all your technical chapters/sections/subsections. Feel free to whichever structure of files in this folder your heart desires. Any file you wish to include should be listed with `\input` in some other file, even if it is the main `example-thesis.tex` file.

 - `ans.bst`: bibliography style following ANS standards

 - `makefile`: this is a starting makefile to create your document. Replace the first line in file with the name of your main document (sans `.tex`) if it is not `example-thesis.tex`, and update the second line with your bibliography file location if it is not in the default location. To use, simply type `make` into the command line (or `make all` or `make all-via-pdf`). All build and auxiliary files are put into a `build/` folder (that is already ignored by the `.gitignore`). A compiled copy of the pdf is placed into the main folder when it is done building. `make clean` will remove all files produced by the build process.

Examples of chapters, sections, figures, etc. are included in the content folder.

## Personal Customization:

The majority of the files above are for formatting and structure and generally not meant for much customization (see specific notes for each).
However, you obviously need to customize the document with your name and title and such.
To do this, edit the `example-thesis.tex` file in the labeled section.
Each required input currently has an example, but below is a description of each customized input you can make:

 - `\DoubleSpacing` or `\OnehalfSpacing` or `\SingleSpacing`: The default is set to double spacing as that is the spacing required for depositing a dissertation. You may however want different spacing for other purposes (ie, printing or sending to committee members) in which case you can change this line to be 1.5 or single spacing.

 - `\title{}`: Replace this with the title of your dissertation

 - `\author{}`: Replace with your name, or the name of the person who wrote your dissertation for you (jk, it should be your name if you want the degree).

 - `department{}`: your department name excluding "Department of." For example, if you were in the Department of Engineering Physics, put "Engineering Physics" (sans quotes) for this.

 - `\defensedate{}`: date of oral exam (whether it is thesis defense or prelim)

 - `\date{}`: year of that your degree will be granted (might not be the same year that you pass your oral exam depending on your date of depositing).

 - `\degree{}`: If you are earning a PhD, this should be "Doctor of Philosophy". If you are earning a masters or other degree, replace with the type of degree (eg, "Masters of Science").

 - `\dissertation` or `\prelim` or `\masters`: Must include one of these to specify what type of report this is. For a PhD dissertation, use `\disseration`. For a prelim use `\prelim` for a masters thesis, use `\masters`.

 - `\advisorname{}`, `\advisortitle{}`, `\advisoraffiliation{}`: If your advisor is Paul Wilson, then this is already pre-populated for you. If your advisor is someone else, then replace the inputs with your advisor's name, title, and affiliation, respectively.

 - `\addcommittee{Name}{Title}{Affiliation}`: Call this as many times as necessary to add all committee members to your document. Three inputs are required: name, title, and affiliation. DO NOT add your advisor to this list. Your advisor will be pre-populated as the first member on the committee list based on the advisor information above.

To add all your content, `\input` the files of the `content/` folder in the document section of `example-thesis.tex`.

## Special Notes:

This template does not work well with the `glossaries` package.
This package can be used for using acronyms in text (use `\gls{}` and update `acronyms.tex` with the appropriate syntax), but it will not format a list of acronyms at the beginning of the document (PRs welcome to fix this!).
If you already have text written that uses the `glossaries` `\gls{}`, an easy way to get around formatting errors is to add this command to your main document to process all `\gls{}` calls as `\ac{}` calls instead:
`\newcommand{\gls}[1]{\ac{#1}}`

## Updating this template:

Discover a better way to do something or want to update this template? Make a PR.