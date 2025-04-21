\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fdureport}[2025/04/25 v0.1 Experiment report for FuDan University]

\LoadClass[utf8,fontset=fandol,zihao=-4]{ctexart}

\RequirePackage{caption}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{titling}
\RequirePackage{color}

% geometry
\geometry{
    a4paper,
    margin = 2.5cm,
    footnotesep = 0.5cm,
}

% section 
\ctexset{
    section = {
      format    = \rmfamily\bfseries\zihao{4},
      indent    = 0pt,
      number    = \chinese{section},
      aftername = {、},
     }
}


% caption
\captionsetup[figure]{
    font     = small,
    labelsep = quad,
}
\captionsetup[table]{
    font     = small,
    labelsep = quad,
}

% cover
% \renewcommand{\title}[1]{
%     \def\@title{#1}
% }

\newcommand{\@lesson}{未指定课程}
\newcommand{\lesson}[1]{
    \renewcommand{\@lesson}{\bfseries 课程名称： & #1 \\}
}

\newcommand{\@teacher}{未指定教师}
\newcommand{\teacher}[1]{
    \renewcommand{\@teacher}{\bfseries 授课教师： & #1 \\}
}

\newcommand{\@expgroup}{未指定组名}
\newcommand{\expgroup}[1]{
    \renewcommand{\@expgroup}{\bfseries 实验小组: & #1 \\}
}

\newcommand{\@expmembers}{无组员}
% \makeatletter
\newcommand{\expmembers}[1]{%
    \renewcommand{\@expmembers}{第一个组员}%
    % \@for\@temp:=#1\do{%
    %     \ifx\@temp\@empty%
    %     \else
            % \ifx\@expmembers\@empty
            %     \g@addto@macro\@expmembers{\@temp}%
            % \else
            %     \g@addto@macro\@expmembers{\par \@temp}%
            % \fi
    %     \fi
    % }%
}%
% \makeatother

% redefine maketitle to generate cover page
\newcommand{\makecover}{
    \begin{titlepage}
        \centering
        \vspace*{2cm}
        \includegraphics[width=0.5\textwidth]{template/fdu_logo_zh_en.png} \\
        \vspace*{2cm}
        {\zihao{2}\bfseries\@title\par}
        {\vspace{8cm}}
        \begin{tabular}{l l}\zihao{-4}
            \@lesson
            \@teacher
            \@expgroup
        \end{tabular} \par
        {\@expmembers}
        \thispagestyle{empty}
    \end{titlepage}
}