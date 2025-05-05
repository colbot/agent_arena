\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fdureport}[2025/04/25 v0.1 Experiment report for FuDan University]

\LoadClass[utf8,fontset=windows,zihao=-4]{ctexart}

\RequirePackage{expl3}
\RequirePackage{xparse}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{caption}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{titling}
\RequirePackage{xcolor}
\RequirePackage{newclude}

% geometry
\geometry{
    a4paper,
    vmargin = 2.54cm,
    hmargin = 3.18cm,
    footnotesep = 0.5cm,
}

% line height
\linespread{1.5}

% section 
\ctexset{
    section = {
        format    = \rmfamily\bfseries\zihao{-2},
        indent    = 0pt,
        number    = \chinese{section},
        aftername = {、},
        afterskip = 0.5em plus 0.2em minus 0.1em,
        },
        subsection = {
                format    = \rmfamily\bfseries\zihao{-3},
                indent    = 0pt,
                afterskip = 0.25em plus 0.1em minus 0.1em,
            },
        subsubsection = {
                format    = \rmfamily\bfseries\zihao{-4},
                indent    = 0pt,
                afterskip = 0.25em plus 0.1em minus 0.1em,
            },
        }

% caption
\captionsetup[figure]{
    font     = small,
    labelsep = quad,
    labelfont = bf,
}
\captionsetup[table]{
    font     = small,
    labelsep = quad,
    labelfont = bf,
}

% cover page details

\ExplSyntaxOn
\str_set:Nn \g_cover_detail_lesson {未指定课程}
\newcommand{\lesson}[1]{
    \str_set:Nn \g_cover_detail_lesson {#1}
}

\str_set:Nn \g_cover_detail_teacher {未指定教师}
\newcommand{\teacher}[1]{
    \str_set:Nn \g_cover_detail_teacher {#1}
}

\str_set:Nn \g_cover_detail_group {未指定组名}
\newcommand{\expgroup}[1]{
    \str_set:Nn \g_cover_detail_group {#1}
}

\clist_set:Nn \g_cover_detail_members {无组员}
\newcommand{\expmembers}[1]{
    \clist_set:Nn \g_cover_detail_members {#1}
}

\newcommand{\makedetail}{
    \begin{tabular}{l l}
    \bfseries 课程名称：                                & \g_cover_detail_lesson  \\
    \bfseries 授课教师：                                & \g_cover_detail_teacher \\
    \bfseries 实验小组：                                & \g_cover_detail_group   \\
    \multirow{\clist_count:N \g_cover_detail_members}{*}{\bfseries 小组成员： } &
    \clist_use:Nn \g_cover_detail_members { \\ & }
    \end{tabular} \par
}
\ExplSyntaxOff

% redefine maketitle to generate cover page
\newcommand{\makecover}{
    \begin{titlepage}
        \linespread{1.2} \selectfont
        \centering
        \vspace*{2cm}
        \includegraphics[width=0.5\textwidth]{template/fdu_logo_zh_en.png} \\
        \vspace*{2cm}
        {\zihao{2}\bfseries\@title\par}
        {\vspace{8cm}}
        \makedetail
        \thispagestyle{empty}
    \end{titlepage}
}

\newcommand{\imagefigure}[4][0.8]{
    \begin{figure}[htb]
        \centering
        \includegraphics[width=#1\textwidth]{#2}
        \caption{#4}
        \label{fig:#3}
    \end{figure}
}
