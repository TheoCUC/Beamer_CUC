\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUCBeamer}[isaac]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
		
\LoadClass[[10pt,aspectratio=43,mathserif]{beamer}


\RequirePackage{CUCStyle}
\RequirePackage{xeCJK}
\RequirePackage{amsmath,amsfonts,amssymb,bm}
\RequirePackage{color}
\RequirePackage{graphicx,hyperref,url}	
\RequirePackage{booktabs} % Allows the use of \toprule, \midrule and \bottomrule in tables
\RequirePackage{mathtools} %数学公式中case情况
\RequirePackage{tikz}% tikz做图
\RequirePackage{minted}% code highlighting
\RequirePackage{gbt7714}
\RequirePackage{cite}


%设置 Beamer 主题
\beamertemplateballitem


%%%%%%%%%%%%%%%%%%
\hypersetup{xetex,bookmarksnumbered=true,bookmarksopen=true,pdfborder=1,breaklinks, colorlinks, linkcolor=, urlcolor=structure.fg}
%引用文献高亮
\makeatletter
\let\@mycite\@cite
\def\@cite#1#2{{\hypersetup{linkcolor=blue!60!black}[{#1\if@tempswa , #2\fi}]}}
\makeatother

%中文图、表
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\setbeamertemplate{caption}[numbered] %图表编号

% mindmap ---------------------------------------------------------------------
\usetikzlibrary[topaths,mindmap,backgrounds]
\usetikzlibrary{chains,decorations.pathmorphing,positioning,fit}
\usetikzlibrary{decorations.shapes,calc,}
\usetikzlibrary{decorations.text,matrix}
\usetikzlibrary{arrows,shapes.geometric,shapes.symbols,scopes}
\usetikzlibrary{snakes}
% -----------------------------------------------------------------------------


% tikz -------------------------------------------------------------
\newcount\mycount
\tikzset{
    invisible/.style={opacity=0},
    visible on/.style={alt=#1{}{invisible}},
    alt/.code args={<#1>#2#3}{%
    \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}}
  },
}

\tikzset{
  orp/.style={
    overlay,
    remember picture,
  },
}
\newcommand<>\fadetitle[2][]{%
    \begin{tikzpicture}
      [
        orp,
        fade title fill/.style={
          fill=white,
          opacity=0.8,
        },
        #1
      ]
      \path[fade title fill] (current page.south west) +(-1cm, -1cm) rectangle ($ (current page.north east) + (1cm, -1cm) $);
      \node[above] at (current page) {\textbf{#2}};
    \end{tikzpicture}%
}
\tikzstyle{nodetype1pre}= [circle, fill=gray!60]
\tikzstyle{nodetype1}= [circle, fill=structure.fg!30]
\tikzstyle{unnodetype1}= [circle, fill=gray!60]
\tikzstyle{linktype1pre}= [-latex]
\tikzstyle{linktype1}= [-latex, draw=purple, line width=1.5pt]
\tikzstyle{dilinktype1pre}= [-]
\tikzstyle{dilinktype1}= [-, draw=purple, line width=1.5pt]
\tikzstyle{unlinktype1}= [-latex]
\tikzstyle{linktype2}= [-latex, snake=snake,line after snake=4mm, draw=structure.fg, line width=1.5pt]
\tikzstyle{every picture}+=[remember picture]
% -----------------------------------------------------------------------------

\AtBeginSection[]
{
  \begin{frame}<beamer>
    \frametitle{\textbf{目录}}
    \textbf{\tableofcontents[currentsection]}
  \end{frame}
}

