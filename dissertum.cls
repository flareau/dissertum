% Adapté de la classe MUThesis de l'Université de Manchester
% https://studentnet.cs.manchester.ac.uk/resources/latex/MUThesis/

% Les éléments constitutifs d'un mémoire ou d'une thèse sont, dans l'ordre:
%    1. La page de titre.
%    2. La page d’identification des membres du jury.
%    3. Le résumé et les mots-clés en français.
%    4. Le résumé et les mots-clés en anglais.
%   *5. Le résumé dans une autre langue que l’anglais ou le français.
%   *6. Le résumé de vulgarisation.
%    7. La table des matières, la liste des tableaux, la liste des figures ou autres.
%    8. La liste des sigles et des abréviations.
%   *9. La dédicace.
%  *10. Les remerciements.
%  *11. L’avant-propos.
%   12. Le corps de l’ouvrage.
%  *13. Les index.
%   14. Les références bibliographiques.
%  *15. Les annexes.
%  *16. Les documents spéciaux.
%  * = facultatif


\NeedsTeXFormat{LaTeX2e} \ProvidesClass{dissertum}[2023/02/01 Dissertation UdeM]

% Type de dissertation (ma, phd)
\newif\ifthesistypefem
\newif\ifthesisphd
\newif\ifdissertumtitledefined
\newif\ifdissertumauthordefined
\newif\ifdissertumdatedefined
\newif\ifdissertumfacultydefined
\newif\ifdissertumdepartmentdefined
\newif\ifdissertumprogramdefined
\DeclareOption{ma}{
  \def\@degree{maîtrise ès arts (M.A.)}
  \def\@thesistype{mémoire}
  \thesisphdfalse
}
\DeclareOption{phd}{
  \def\@degree{doctorat (Ph.D.)}
  \def\@thesistype{thèse}
  \thesistypefemtrue
  \thesisphdtrue
}


% Passer les autres options à la classe report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{ma} % valeur par défaut
\ProcessOptions

\LoadClass[12pt,letterpaper]{report}

% Packages
\RequirePackage{setspace}
\RequirePackage{etoolbox}
\RequirePackage[skip=1em,indent=0pt,tocskip=0pt]{parskip}
\RequirePackage{xcolor}
\RequirePackage{iftex}
\ifPDFTeX
  \RequirePackage{times}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T3,T1]{fontenc}
\else
  \RequirePackage{fontspec}
  \IfFontExistsTF{TeX Gyre Termes}
    {\setmainfont{TeX Gyre Termes}}
    {\setmainfont{Latin Modern Roman}}
\fi
\RequirePackage[english,main=french]{babel}
\RequirePackage{csquotes}
\RequirePackage[backend=biber,style=apa]{biblatex}
% Pour conserver \citep et \citet dans un document existant, remplacer la
% ligne précédente par la suivante:
% \RequirePackage[backend=biber,style=apa,natbib=true]{biblatex}
\DefineBibliographyExtras{french}{%
  \protected\def\mkbibnamefamily#1{\textnohyphenation{#1}}%
}
% Terminologie universitaire québécoise
\DefineBibliographyStrings{french}{%
  mathesis = {mémoire de maîtrise},%
  phdthesis = {thèse de doctorat},%
}
\addto\captionsfrench{\renewcommand\listfigurename{Liste des figures}}
\addto\captionsfrench{\renewcommand{\tablename}{{\scshape Tableau}}}
\AtBeginDocument{%
  \ifdefined\lstlistingname
    \renewcommand\lstlistingname{Bloc de code}%
  \fi
  \ifdefined\lstlistlistingname
    \renewcommand\lstlistlistingname{Liste des blocs de code}%
  \fi
}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage[section]{placeins}

% Format lettre et marges minimales de 25mm
\RequirePackage[letterpaper,margin=30mm]{geometry}

% Éviter les sauts de page après un trait-d'union
\brokenpenalty=10000

%% Interligne 1,5, paragraphes séparés par environ une ligne et sans alinéa
\AtBeginDocument{%
  \onehalfspacing
  \setlength{\parskip}{\baselineskip}%
}

% Ne pas ajouter l'espacement des paragraphes à l'intérieur des titres de chapitre
\patchcmd{\@makechapterhead}
  {\parindent \z@}
  {\parskip \z@ \parindent \z@}
  {}
  {\ClassWarning{dissertum}{Impossible d'ajuster l'espacement des chapitres}}
\patchcmd{\@makeschapterhead}
  {\parindent \z@}
  {\parskip \z@ \parindent \z@}
  {}
  {\ClassWarning{dissertum}{Impossible d'ajuster l'espacement des chapitres non numerotes}}

%% Citations longues en retrait et à interligne simple
\AtBeginEnvironment{quote}{\singlespacing}
\AtBeginEnvironment{quotation}{\singlespacing}

%% Variables
\newcommand{\placeholder}[1]{\textcolor{red}{\textless#1\textgreater}}
\pretocmd{\title}{\dissertumtitledefinedtrue}{}{}
\pretocmd{\author}{\dissertumauthordefinedtrue}{}{}
\def\titre#1{\title{#1}}
\def\soustitre#1{\gdef\@subtitle{#1}}
\def\auteur#1{\author{#1}}
\def\autrice#1{\author{#1}}
\def\auteure#1{\author{#1}}
\def\faculte#1{\dissertumfacultydefinedtrue\gdef\@faculty{#1}}
\def\departement#1{\dissertumdepartmentdefinedtrue\gdef\@department{#1}}
\def\programme#1{\dissertumprogramdefinedtrue\gdef\@program{#1}}
\def\president#1{\gdef\@president{#1}}
\def\presidente#1{\gdef\@presidente{#1}}
\def\directeur#1{\gdef\@directeur{#1}}
\def\directrice#1{\gdef\@directrice{#1}}
\def\codirecteur#1{\gdef\@codirecteur{#1}}
\def\codirectrice#1{\gdef\@codirectrice{#1}}
\def\codirecteurdeux#1{\gdef\@codirecteurdeux{#1}}
\def\codirectricedeux#1{\gdef\@codirectricedeux{#1}}
\def\examinateur#1{\gdef\@examinateur{#1}}
\def\examinatrice#1{\gdef\@examinatrice{#1}}
\def\membre#1{\gdef\@membre{#1}}
\def\membredeux#1{\gdef\@membredeux{#1}}
\def\date#1#2{\dissertumdatedefinedtrue\gdef\@month{#1}\gdef\@year{#2}}

% Validation des renseignements de la page de titre
\def\@validatetitlepage{%
  \ifdissertumtitledefined\else
    \ClassWarningNoLine{dissertum}{Titre obligatoire: utilisez \string\titre}%
    \gdef\@title{\placeholder{TITRE}}%
  \fi
  \ifdissertumauthordefined\else
    \ClassWarningNoLine{dissertum}{Auteur ou autrice obligatoire: utilisez \string\auteur, \string\autrice\space ou \string\auteure}%
    \gdef\@author{\placeholder{AUTEUR\slash AUTRICE}}%
  \fi
  \ifdissertumdatedefined\else
    \ClassWarningNoLine{dissertum}{Date obligatoire: le mois et l'année courants ont été insérés automatiquement; pour modifier, utilisez \string\date}%
    \gdef\@month{%
      \ifcase\month\or
        Janvier\or Février\or Mars\or Avril\or Mai\or Juin\or
        Juillet\or Août\or Septembre\or Octobre\or Novembre\or Décembre%
      \fi
    }%
    \xdef\@year{\number\year}%
  \fi
  \ifdissertumdepartmentdefined\else
    \ClassWarningNoLine{dissertum}{Departement obligatoire: utilisez \string\departement}%
    \gdef\@department{\placeholder{DÉPARTEMENT}}%
  \fi
  \ifdissertumfacultydefined\else
    \ClassWarningNoLine{dissertum}{Faculte obligatoire: utilisez \string\faculte}%
    \gdef\@faculty{\placeholder{FACULTÉ}}%
  \fi
  \ifdissertumprogramdefined\else
    \ClassWarningNoLine{dissertum}{Programme obligatoire: utilisez \string\programme}%
    \gdef\@program{\placeholder{PROGRAMME}}%
  \fi
}

% Validation de la composition du jury
\def\@jurywarning#1{%
  \ClassWarningNoLine{dissertum}{Composition du jury non conforme: #1}%
}
\def\@validatejury{%
  \ifdefined\@president\else
    \ifdefined\@presidente\else
      \@jurywarning{President ou presidente obligatoire: utilisez \string\president ou \string\presidente}%
    \fi
  \fi
  \ifdefined\@directeur\else
    \ifdefined\@directrice\else
      \@jurywarning{Directeur ou directrice obligatoire: utilisez \string\directeur ou \string\directrice}%
    \fi
  \fi
  \ifdefined\@membre\else
    \@jurywarning{Membre du jury obligatoire: utilisez \string\membre}%
  \fi
  \ifthesisphd
    \ifdefined\@examinateur\else
      \ifdefined\@examinatrice\else
        \@jurywarning{Examinateur ou examinatrice externe obligatoire pour une these: utilisez \string\examinateur ou \string\examinatrice}%
      \fi
    \fi
  \else
    \ifdefined\@examinateur
      \@jurywarning{Examinateur ou examinatrice externe interdit pour un memoire}%
    \else
      \ifdefined\@examinatrice
        \@jurywarning{Examinateur ou examinatrice externe interdit pour un memoire}%
      \fi
    \fi
  \fi
}

% Page titre
\long\def\pagetitre{
  \@validatetitlepage
  \thispagestyle{empty}
  \begin{center}
    Université de Montréal\par\vfill
    {\Large\bf\@title}
    \ifdefined\@subtitle{\\\large\bf\@subtitle}\fi\par\vfill
    Par\\
    {\bf\@author}\par\vfill
    \@department, \@faculty\par\vfill
    \expandafter\MakeUppercase\@thesistype\ présenté\@f{e} en vue de l’obtention du grade de \@degree\ en \@program\par\vfill
    \@month\ \@year\par\vfill
    \copyright\ \@author, \@year
  \end{center}
  \newpage
}

% Page d'idenfitication du jury
\long\def\pagejury{
  \@validatejury
  \thispagestyle{empty}
  \begin{center}
    Université de Montréal\\
    \@department, \@faculty\\[-0.5ex]
    \rule{\linewidth}{1pt}\par\vfill
    {\it Ce\@f{tte} \@thesistype\ intitulé\@f{e}}\\
    {\bf\@title\ifdefined\@subtitle{\\\@subtitle}\fi}\par\vfill
    {\it Présenté\@f{e} par}\\
    {\bf\@author}\par\vfill
    {\it A été évalué\@f{e} par un jury composé des personnes suivantes}\\[\baselineskip]
    \ifdefined\@presidente{\bf\@presidente}\\Présidente-rapporteuse\\[\baselineskip]\fi
    \ifdefined\@president{\bf\@president}\\Président-rapporteur\\[\baselineskip]\fi
    \ifdefined\@directrice{\bf\@directrice}\\Directrice de recherche\\[\baselineskip]\fi
    \ifdefined\@directeur{\bf\@directeur}\\Directeur de recherche\\[\baselineskip]\fi
    \ifdefined\@codirectrice{\bf\@codirectrice}\\Codirectrice de recherche\\[\baselineskip]\fi
    \ifdefined\@codirecteur{\bf\@codirecteur}\\Codirecteur de recherche\\[\baselineskip]\fi
    \ifdefined\@codirectricedeux{\bf\@codirectricedeux}\\Codirectrice de recherche\\[\baselineskip]\fi
    \ifdefined\@codirecteurdeux{\bf\@codirecteurdeux}\\Codirecteur de recherche\\[\baselineskip]\fi
    \ifdefined\@membre{\bf\@membre}\\Membre du jury\\[\baselineskip]\fi
    \ifdefined\@membredeux{\bf\@membredeux}\\Membre du jury\\[\baselineskip]\fi
    \ifdefined\@examinatrice{\bf\@examinatrice}\\Examinatrice externe\\[\baselineskip]\fi
    \ifdefined\@examinateur{\bf\@examinateur}\\Examinateur externe\\[\baselineskip]\fi
  \end{center}
  \newpage
}

% Forme féminine selon le type de dissertation
\long\def\@f#1{\ifthesistypefem #1\fi}

% Titres de chapitres non numérotés en début de document
\long\def\prechapter#1{
  \chapter*{#1}
  \addcontentsline{toc}{chapter}{#1}
}

% Résumé et abstract
\newcommand{\@keywords}{}
\newenvironment{resume}[1]
  {\renewcommand{\@keywords}{#1}\prechapter{Résumé}}
  {\paragraph{Mots-clés:} \@keywords}
\renewenvironment{abstract}[1]
  {\begin{otherlanguage}{english}\renewcommand{\@keywords}{#1}\prechapter{Abstract}}
  {\paragraph{Keywords:} \@keywords\end{otherlanguage}}

% Table des matières, liste des tableaux et liste des figures
\long\def\matieres{
  \clearpage
  \addcontentsline{toc}{chapter}{\contentsname}
  \tableofcontents
  
  \clearpage
  \addcontentsline{toc}{chapter}{\listtablename}
  \listoftables
  
  \clearpage
  \addcontentsline{toc}{chapter}{\listfigurename}
  \listoffigures

  \ifdefined\lstlistoflistings
    \clearpage
    \addcontentsline{toc}{chapter}{\lstlistlistingname}
    \lstlistoflistings
  \fi
}


% Dédicace
\long\def\dedicace#1{
  \clearpage
  \thispagestyle{empty}
  \null\vfill
  #1
  \vfill\vfill
  \newpage
}


% En-têtes et pieds de pages
% Première page de chapitre
\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead{}
  \fancyfoot{}
}

% Pages normales
\fancypagestyle{dissert}{
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead{}
  \fancyfoot[C]{\thepage}
}

\pagestyle{dissert}
