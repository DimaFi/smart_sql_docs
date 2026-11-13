% Класс отчёта по учебной практике «НИР» с настройками оформления по ГОСТ и требованиям СГУ.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sgu-nir}[2026/11/13 SGU research practice report]
\LoadClass[14pt,a4paper]{extarticle}
% Левое поле 30 мм в соответствии с ГОСТ 7.32-2017.
\RequirePackage[a4paper,left=30mm,right=15mm,top=20mm,bottom=20mm,headheight=0pt,footskip=12mm]{geometry}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{tocloft}
\onehalfspacing
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}
\pagestyle{fancy}\fancyhf{}\fancyfoot[R]{\thepage}\renewcommand{\headrulewidth}{0pt}
% Заголовки разделов и подразделов начинаются с абзацного отступа.
\titleformat{\section}{\normalfont\bfseries}{\thesection}{0.6em}{}
\titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{0.6em}{}
\titleformat{\subsubsection}{\normalfont\bfseries}{\thesubsubsection}{0.6em}{}
\titlespacing*{\section}{1.25cm}{10pt}{6pt}
\titlespacing*{\subsection}{1.25cm}{8pt}{3pt}
\titlespacing*{\subsubsection}{1.25cm}{6pt}{3pt}
\captionsetup[figure]{name=Рисунок,labelsep=endash,justification=centering,font=normalsize}
\captionsetup[table]{name=Таблица,labelsep=endash,justification=raggedright,singlelinecheck=false,font=normalsize,position=top}
\renewcommand{\contentsname}{СОДЕРЖАНИЕ}
\renewcommand{\cfttoctitlefont}{\hfill\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsubsecfont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\setcounter{tocdepth}{3}
% «ВВЕДЕНИЕ», «ЗАКЛЮЧЕНИЕ» — отдельные страницы и в содержании.
\newcommand{\nirsection}[1]{\clearpage\phantomsection\section*{\centering #1}\addcontentsline{toc}{section}{#1}}
% Список использованных источников выводится без записи в содержании.
\newcommand{\nirsectionnoentry}[1]{\clearpage\phantomsection\section*{\centering #1}}