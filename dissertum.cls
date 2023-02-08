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
\DeclareOption{ma}{
  \def\@degree{maîtrise ès arts (M.A.)}
  \def\@thesistype{mémoire}
}
\DeclareOption{phd}{
  \def\@degree{doctorat (Ph.D.)}
  \def\@thesistype{thèse}
  \thesistypefemtrue
}


% Passer les autres options à la classe report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{ma} % valeur par défaut
\ProcessOptions

\LoadClass[12pt]{report}

% Packages
\RequirePackage{setspace}
\RequirePackage{times}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1,T2A,T2B,T2C,T3,T4,T5]{fontenc}
\RequirePackage{natbib} % charger AVANT babel!
\RequirePackage[english,main=french]{babel}
\addto\captionsfrench{\renewcommand\listfigurename{Liste des figures}}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage[section]{placeins}

% Marges minimales: 25mm
\RequirePackage[margin=30mm]{geometry}

% Éviter les sauts de page après un trait-d'union
\brokenpenalty=10000

%% Interligne 1,5
\AtBeginDocument{\onehalfspacing}

%% Variables
\def\titre#1{\title{#1}}
\def\soustitre#1{\gdef\@subtitle{#1}}
\def\auteur#1{\author{#1}}
\def\autrice#1{\author{#1}}
\def\auteure#1{\author{#1}}
\def\faculte#1{\gdef\@faculty{#1}}
\def\departement#1{\gdef\@department{#1}}
\def\programme#1{\gdef\@program{#1}}
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
\def\date#1#2{\gdef\@month{#1}\gdef\@year{#2}}

% Page titre
\long\def\pagetitre{
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
\newsavebox{\@keywords}
\newenvironment{resume}[1]
  {\sbox{\@keywords}{#1}\prechapter{Résumé}}
  {\paragraph{Mots-clés:} \usebox{\@keywords}}
\renewenvironment{abstract}[1]
  {\begin{otherlanguage}{english}\sbox{\@keywords}{#1}\prechapter{Abstract}}
  {\paragraph{Keywords:} \usebox{\@keywords}\end{otherlanguage}}

% Table des matières, liste des tableaux et liste des figures
\long\def\matieres{
  \addcontentsline{toc}{chapter}{\contentsname}
  \tableofcontents
  
  \addcontentsline{toc}{chapter}{\listtablename}
  \listoftables
  
  \addcontentsline{toc}{chapter}{\listfigurename}
  \listoffigures
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


% Bibliographie
% \def\thebibliography#1{\chapter*{\bibname\@mkboth
%   {\uppercase{\bibname}}{\uppercase{\bibname}}}%
%   \addcontentsline{toc}{chapter}{\bibname}%
%   \list
%   {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
%     \leftmargin\labelwidth
%     \advance\leftmargin\labelsep
%     \usecounter{enumiv}%
%     \let\p@enumiv\@empty
%     \def\theenumiv{\arabic{enumiv}}}%
%     \def\newblock{\hskip .11em plus.33em minus.07em}%
%     \sloppy\clubpenalty4000\widowpenalty4000
%     \sfcode`\.=\@m}

% \def\endthebibliography{%
%   \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
%   \endlist}


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
