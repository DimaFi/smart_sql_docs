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
% Как в образце Word: кегль 14 пт, одинарная база 16 пт.
\let\nir@original@normalsize\normalsize
\renewcommand{\normalsize}{\nir@original@normalsize\@setfontsize\normalsize{14bp}{16bp}}
\setstretch{1.5}
\newcommand{\nir@indent}{1.25cm}
\setlength{\parindent}{\nir@indent}
\setlength{\parskip}{0pt}
\pagestyle{fancy}\fancyhf{}\fancyfoot[R]{\thepage}\renewcommand{\headrulewidth}{0pt}
% Нумерованные заголовки имеют отступ только в первой строке.
\titleformat{\section}[block]{\normalfont\normalsize\bfseries}{\hspace*{\nir@indent}\thesection}{\fontdimen2\font}{}
\titleformat{\subsection}[block]{\normalfont\normalsize\bfseries}{\hspace*{\nir@indent}\thesubsection}{\fontdimen2\font}{}
\titleformat{\subsubsection}[block]{\normalfont\normalsize\bfseries}{\hspace*{\nir@indent}\thesubsubsection}{\fontdimen2\font}{}
\titleformat{name=\section,numberless}[block]{\normalfont\normalsize\bfseries\centering}{}{0pt}{}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}
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
\newcommand{\nirsection}[1]{\clearpage\phantomsection\section*{#1}\addcontentsline{toc}{section}{#1}}
% Список использованных источников выводится без записи в содержании.
\newcommand{\nirsectionnoentry}[1]{\clearpage\phantomsection\section*{#1}}
