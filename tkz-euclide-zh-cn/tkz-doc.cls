% tkz-doc.cls
% encoding: utf8
% Copyright 2020  Alain Matthes
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
% This work has the LPPL maintenance status “maintained”.
% The Current Maintainer of this work is Alain Matthes.
% tkz-doc class for use with the tkz documentation
% ( AlterMundus Collection ).
%
%% Objet :  Classe LaTeX  et Styles pour créer des documentations.
%<-------------- Définitions relatives au package --------------------------->
\newcommand*{\PackageName}{tkz-doc}
\newcommand*{\PackageVersion}{1.43c}
\newcommand*{\filedate}{2020/04/10}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

%<---------------------- Identification Part -------------------------------->
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{\PackageName}[%
            \filedate\space Version:\space\PackageVersion\space %
                     tkz documentation class based on scrartcl]
\newif\if@tkzcadre
\@tkzcadrefalse
\DeclareOption{cadre}{\@tkzcadretrue}
\ProcessOptions\relax
\LoadClass[titlepage,a4paper]{scrartcl}
%<----------------- loading some packages ---------------------------------->
%  dvipsnames loads a set of 68 cmyk colors as defined in the dvips driver.
%  svgnames loads a set of 151 rgb color names
%  obsolete usenames
\PassOptionsToPackage{dvipsnames,svgnames}{xcolor}
%<-------------------------------------------------------------------------->-
\KOMAoptions{twoside=false}
%<-------------------------------------------------------------------------->-
\RequirePackage{framed,eso-pic}
\RequirePackage[bottom,stable,ragged]{footmisc}
\RequirePackage[automark,markcase=ignoreuppercase]{scrlayer-scrpage}
%<------------- define important words ---------------------------------->
\InputIfFileExists{tkz-doc.cfg}{\typeout{Local configuration file tkz-doc.cfg found and used}}{\typeout{tkz-doc.cfg not found}}
 %<-------------------------------------------------------------------------->-
\pagestyle{scrheadings}
\clearscrheadings
\clearscrplain
\ohead{\textcolor{sectioncolor}{\pagemark}}
\ihead{\textcolor{sectioncolor}{\headmark}}
\rofoot{\textcolor{sectioncolor}{\tkznamecollection}}
\lofoot{\textcolor{sectioncolor}{\tkznameofpack}}

\automark[subsection]{section}
\KOMAoptions{headsepline=.4pt}
\addtokomafont{headsepline}{\color{sectioncolor}}

\KOMAoptions{footsepline=.4pt}
\addtokomafont{footsepline}{\color{sectioncolor}}

\setheadwidth[0pt]{text}
\setfootwidth[0pt]{text}
\renewcommand{\footnoterule}{\vspace*{-3pt}{%
   \color{sectioncolor}\hrule width 2in height 0.4pt}\vspace*{2.6pt}}
\deffootnote{1.5em}{1em}{\makebox[1.5em][l]{\thefootnotemark}}
\addtolength{\skip\footins}{\baselineskip}%
%<------------------–  En-tête et pied de page ------------------------------
\pagenumbering{arabic}
\newcommand\SectionFontStyle{\ttfamily}
\setkomafont{sectioning}{\bfseries\SectionFontStyle}
\setkomafont{pagenumber}{\bfseries\SectionFontStyle}
\setkomafont{pagehead}{\small\ttfamily}
\setkomafont{pagefoot}{\small\ttfamily}
\setkomafont{descriptionlabel}{\itshape}
\addtokomafont{sectioning}{\color{sectioncolor}}
\renewcommand*{\raggedsection}{\raggedright}
%<---------------------------------------------------------------------------
\newcounter{cnt}\setcounter{cnt}{1}
\setcounter{secnumdepth}{3}%
\setcounter{tocdepth}{3}
%<------------------  Éxécution et chargement -----------------------------
\RequirePackage{tikz}
\usetikzlibrary{decorations.shapes,
                decorations.text,
                decorations.pathreplacing,
                decorations.pathmorphing,
                decorations.markings,
                shadows}
\RequirePackage{tabularx,ragged2e}
\RequirePackage[bottom,stable,ragged]{footmisc}
\raggedbottom
\newbox\tkzbox
%<---------------  some macros --------------------------------------------
\def\nodeshadowedone(#1,#2)#3{%
\node[myblue,above,inner sep=0pt]{\global\setbox\tkzbox=\hbox{#3}\copy\tkzbox};
\node[above,yscale=#2,inner sep=0pt,xslant=#1,myblue!60]{\box\tkzbox};
}%
 % some of the macros below are absolete
\def\nameoffile#1{\gdef\@nameoffile{#1}}
\def\@nameoffile{\@latex@warning@no@line{No \noexpand\nameoffile given}}
\long\def\defoffile#1{\protected@xdef\@defoffile{\@defoffile{#1}}}
\let\@defoffile\@empty
%<-------------------------------------------------------------------------
\newcommand*{\addbs}[1]{\texttt{\textbackslash#1}}
\newcommand*{\@CellCode}[1]{}
\newcommand*{\thead}{\noalign{\iffalse}\fi\@thead}
\newcommand*{\@thead}[1][\em\ttfamily]{\gdef\@CellCode{#1}\iffalse{\fi}}
\newcommand*{\tbody}{\noalign{\gdef\@CellCode{}}}
\newcolumntype{I}{>{\@CellCode}}
%<-------------------------- NewMacroBox ----------------------------------->
\newcommand*{\ActivBoxName}{}
\newenvironment{NewMacroBox}[2]{%
\parindent=0pt
\renewcommand*{\ActivBoxName}{#1}
\def\FrameCommand{\color{MidnightBlue}{\vrule width 1pt\hspace{3pt}}}%
\MakeFramed{\advance\hsize-\width}%
\noindent
\makebox[0pt][l]{%
   \hspace{-4pt}%
   \setlength{\fboxrule}{1pt}%
   \setlength{\fboxsep}{3pt}%
   \fcolorbox{sectioncolor}{titlecolorbox}{%
      \rule{6pt}{0pt}%
      \makebox[\width+6pt][l]{\tkzcname{#1#2}}%
   }%
}\\*[.5\baselineskip]%
\noindent
% \ignorespaces\tkzcname{#1#3}
\Imacro{#1}%
}%
{%
\par\noindent%
\makebox[0pt][l]{%
\hspace{-6pt}%
\rule{6pt}{1pt}%
\rule{\textwidth}{1pt}%
\hspace{-1pt}%
\rule{1pt}{10pt}%
}%
\endMakeFramed
\noindent
\ignorespacesafterend
\par\medskip
}%
%<----------------- end NewMacroBox ----------------------------------------->

%<----------------------------- NewEnvBox ----------------------------------->
\let\fram@d=\MakeFramed  \let\endfram@d=\endMakeFramed

\newenvironment{NewEnvBox}[1]{%
\parindent=0pt
\renewcommand*{\ActivBoxName}{#1}
%\gdef\tkzEnvMacro{#1}
\def\FrameCommand{\color{sectioncolor}{\vrule width 1pt\hspace{3pt}}}%
\MakeFramed{\advance\hsize-\width}%
\noindent
\makebox[0pt][l]{%
\hspace{-4pt}%
\setlength{\fboxrule}{1pt}%
\setlength{\fboxsep}{3pt}%
\fcolorbox{sectioncolor}{titlecolorbox}{%
\rule{6pt}{0pt}%
\makebox[\width+6pt][l]{%
 \tkzcname{\textcolor{sectioncolor}{begin}\{\ActivBoxName\}}{\oarg{options}}%
 \hspace*{.25cm}\meta{environment contents}\hspace*{.25cm}%
 \tkzcname{\textcolor{sectioncolor}{end}\{\ActivBoxName\}}}%
}%
}\\*[.5\baselineskip]%
\noindent
% \ignorespaces\tkzcname{#1#3}
\Ienv{#1}
\color{MidnightBlue}}{%
\par\noindent%
\makebox[0pt][l]{%
\hspace{-6pt}%
\rule{6pt}{1pt}%
\rule{\textwidth}{1pt}%
\hspace{-1pt}%
\rule{1pt}{10pt}%
}%
\endMakeFramed
\noindent
\ignorespacesafterend
\par\medskip
}
%<------------------- end NewEnvBox ----------------------------------------->
%<----------------------------- def macro arg opt---------------------------->
\def\cmd#1{\cs{\expandafter\cmd@to@cs\string#1}}
\def\cmd@to@cs#1#2{\char\number`#2\relax}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\providecommand\marg[1]{{\ttfamily\char`\{}\opt{\meta{#1}}{\ttfamily\char`\}}}
\providecommand\oarg[1]{{\ttfamily[}\opt{\meta{#1}}{\ttfamily]}}
\providecommand\parg[1]{{\ttfamily(}\opt{\meta{#1}}{\ttfamily)}}
\newcommand\opt[1]{{\color{myblue}#1}}
\newcommand\ooarg[1]{{\ttfamily[}\meta{#1}{\ttfamily]}}
\newcommand*{\var}[1]{\{\opt{\meta{#1}}\}}
\newcommand*{\varp}[1]{\big(\opt{\meta{#1}}\big)}
\newcommand*{\vara}[1]{\{#1\}}
% -- Macros pour indexation -------------------------------------------------
\newcommand*{\tkzNamePack}[1]{\NamePack{#1}}
\newcommand*{\tkzNameMacro}[1]{\tkzcname{#1}\Imacro{#1}}
\newcommand*{\tkzNameEnv}[1]{\tkzname{#1}\Ienv{#1}}
\newcommand*{\Ilib}[1]{\index{Library_1@\texttt{Library}!\texttt{#1}}}
\newcommand*{\Ienv}[1]{\index{Environment_1@\texttt{Environment}!\texttt{#1}}}
\newcommand*{\IargEnv}[2]{\index{#1_2@\texttt{#1: arguments}!\texttt{#2}}}
\newcommand*{\IargNameEnv}[2]{\texttt{#2}\index{#1_2@\texttt{#1: arguments}!\texttt{#2}}}
\newcommand*{\IoptEnv}[2]{\index{#1_3@\texttt{#1: options}!\texttt{#2}}}
\newcommand*{\IoptNameEnv}[2]{\texttt{#2}\index{#1_3@\texttt{#1: options}!\texttt{#2}}}
\newcommand*{\Imacro}[1]{\index{#1_1@\texttt{\textbackslash#1}}}%n
\newcommand*{\Iarg}[2]{\index{#1_2@\texttt{\textbackslash#1: arguments}!\texttt{#2}}}
\newcommand*{\IargName}[2]{\texttt{#2}\index{#1_2@\texttt{\textbackslash#1: arguments}!\texttt{#2}}}
\newcommand*{\IoptName}[2]{\texttt{#2}\index{#1_3@\texttt{\textbackslash#1: options}!\texttt{#2}}}
\newcommand*{\Iopt}[2]{\index{#1_3@\texttt{\textbackslash#1: options}!\texttt{#2}}}
\newcommand*{\Istyle}[2]{\index{#1_3@\texttt{\textbackslash#1: styles}!\texttt{#2}}}
\newcommand*{\IstyleEnv}[2]{\index{#1_3@\texttt{#1: styles}!\texttt{#2}}}
\newcommand*{\Iaccent}[2]{\index{#1@\texttt{#2}}}
\newcommand*{\NameLib}[1]{\texttt{\textcolor{MidnightBlue}{#1}}\index{Ti\emph{k}Z Library !#1@\texttt{#1}}}
\newcommand*{\NameSys}[1]{\texttt{#1}\index{Operating System  !#1@\texttt{#1}}}
\newcommand*{\NameDist}[1]{\texttt{\textcolor{MidnightBlue}{#1}}\index{TeX Distributions  !#1@\texttt{#1}}}
\newcommand*{\NameFonct}[1]{\texttt{\textcolor{MidnightBlue}{#1}}\index{Functions !#1@\texttt{#1}}}
\newcommand*{\NamePack}[1]{\texttt{\textcolor{MidnightBlue}{#1}}\index{Package !#1@\texttt{#1}}}
\newcommand*{\TOenvline}[3]{\IoptNameEnv{\ActivBoxName}{#1}&\tkzdft{#2}&\ttfamily #3\\}
\newcommand*{\TOline}[3]{\IoptName{\ActivBoxName}{#1}&\tkzdft{#2}&\ttfamily  #3\\}
\newcommand*{\TAline}[3]{\IargName{\ActivBoxName}{#1}&\tkzdft{#2}&\ttfamily  #3\\}
\newcommand*{\TMline}[3]{\tkzcname{#1}\index{#1_1@\texttt{\textbackslash#1}}&\tkzdft{#2}&\ttfamily  #3\\}
\newcommand*{\tkzcname}[1]{\Imacro{#1}\textbf{\texttt{\textcolor{MidnightBlue}{%
                      \textbackslash#1}}}}
\newcommand*{\tkzhname}[1]{\textbf{\texttt{\textcolor{MidnightBlue}{%
                      \textbackslash#1}}}}

\DeclareRobustCommand\meta[1]{%
\ensuremath\langle
     \ifmmode \expandafter \nfss@text \fi
     {%
      \meta@font@select
      \edef\meta@hyphen@restore
        {\hyphenchar\the\font\the\hyphenchar\font}%
      \hyphenchar\font\m@ne
      \language\l@nohyphenation
      \/#1\/%
      \meta@hyphen@restore
     }\ensuremath\rangle
}
\def\meta@font@select{}

\renewcommand*{\idx@heading}{%
 \idx@@heading{\indexname}%
}
\renewenvironment{theindex}{%
  \@restonecoltrue
  \columnseprule \z@
  \columnsep 35\p@
  \idx@heading%
  \index@preamble\par\nobreak
  \thispagestyle{\indexpagestyle}\parindent\z@
  \setlength{\parskip}{\z@ \@plus .3\p@}%
  \setlength{\parfillskip}{\z@ \@plus 1fil}%
  \let\item\@idxitem
}{%
  \if@restonecol\onecolumn\else\clearpage\fi
}
%<----------- set colors of the document --------------------------
\pgfkeys{/tkzsetupcolor/.cd,
          background/.code    = {\global\edef\tkz@suc@bkc{#1}},
          text/.code          = {\global\edef\tkz@suc@txt{#1}}}
\def\tkzSetUpColors{\pgfutil@ifnextchar[{\tkz@SetUpColors}{%
                                         \tkz@SetUpColors[]}}
\def\tkz@SetUpColors[#1]{%
\begingroup
    \pgfkeys{tkzsetupcolor/.cd,
             background  = \tkz@background@color,
             text        = \tkz@text@color}
    \pgfqkeys{/tkzsetupcolor}{#1}
    \pagecolor{\tkz@suc@bkc}
    \color{\tkz@suc@txt}
\endgroup}

%<---------------------------------------------------------------------
\input{couverture}
%<--------- presentation première page  --------------------------------->
\newcommand\presentation{%
   \thispagestyle{empty}%
   \par\vspace*{3 cm}
    \begin{center}
      {\textcolor{myblue}{\Huge \@nameoffile}}
    \end{center}
    \par\vspace*{3 cm}
    \noindent
    \newlength{\tkz@lx}\settowidth{\tkz@lx}{\huge \tkznamecollection}%
    \advance\tkz@lx3em\quad
    \href{\tkzurlauthor}{%
    \rotatebox{90}{\hspace*{1.5em}{%
        \textcolor{sectioncolor}{\Huge \tkznamecollection}}}}
         \textcolor{sectioncolor}{\rule{2pt}{\tkz@lx}}\quad%
  \begin{minipage}[b]{.90\textwidth}
    {%
    \noindent\hfill
     \raggedleft\Large
     \href{mailto:al.ma@mac.com}{\textcolor{sectioncolor}{\tkzauthorofpack}}\par
     }%
    {\@defoffile}
   \par
  \end{minipage}
}
\endinput
