%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% easyclass.cls - LaTeX2e class for Lecture Note use.
%% To Make Lecture Note for Computer Science Courses
%%	Version 1.00
%%  written by Naijia Fan, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\std}{1} % for students
%\newcommand{\std}{0} % for teacher
 
\newcommand{\includegraphicsex}[3]{
    \ifnum\std=1 \includegraphics[#1]{#3} \else \includegraphics[#2]{#3} \fi
}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{easyclass}[2/6/2019 custom lecture note class]
\LoadClass[twoside=false]{scrbook}
\RequirePackage{mathtools,amssymb,bm,bbold,enumerate}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref,cleveref}
\RequirePackage{ifthen}
\RequirePackage{gensymb}
\RequirePackage{luacolor}
\RequirePackage{tasks}
\usepackage{lipsum}

\newcommand\myshade{90}
\colorlet{mylinkcolor}{NavyBlue}
\colorlet{mycitecolor}{Aquamarine}
\colorlet{myurlcolor}{Aquamarine}

\hypersetup{
  linkcolor  = mylinkcolor!\myshade!black,
  citecolor  = mycitecolor!\myshade!black,
  urlcolor   = myurlcolor!\myshade!black,
  colorlinks = true,
}

%--------------------------------------------------------------------
% Bibliography
\RequirePackage[]{natbib}
\bibliographystyle{chicago}

%--------------------------------------------------------------------
% Theorem
%=================================
% pre-defined theorem environments
% custom theorem boxes
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{amsthm}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem{remark}{Remark}[chapter]
\newtheorem*{assumption}{Assumption}
\newtheorem{example}{Example}
\newtheorem{exercise}{Exercise}
\newtheorem{solution}{Solution}
%Theorem
\newcounter{theo}[chapter] \setcounter{theo}{0}
\renewcommand{\thetheo}{\arabic{chapter}.\arabic{theo}}
\newenvironment{theo}[2][]{%
\refstepcounter{theo}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=blue!40]
{\strut Theorem~\thetheo};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=blue!40]
{\strut Theorem~\thetheo:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=blue!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}

%Lemma
\newcounter{lem}[theo] %\setcounter{lem}{0}
\renewcommand{\thelem}{\arabic{chapter}.\arabic{theo}}
\newenvironment{lem}[2][]{%
\refstepcounter{theo}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=green!40]
{\strut Lemma~\thelem};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=green!40]
{\strut Lemma~\thelem:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=green!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}

%Definition
\newcounter{def}[theo]
\renewcommand{\thedef}{\arabic{chapter}.\arabic{theo}}
\newenvironment{defi}[2][]{%
\refstepcounter{theo}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=orange!40]
{\strut Definition~\thedef};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=orange!40]
{\strut Definition~\thedef:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=orange!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}

%Proof
\newcounter{prf}[theo] %\setcounter{prf}{0}
\renewcommand{\theprf}{\arabic{chapter}.\arabic{theo}}
\newenvironment{prf}[2][]{%
\refstepcounter{prf}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=red!40]
{\strut Proof~\theprf};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=red!40]
{\strut Proof~\theprf:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=red!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\qed\end{mdframed}}

%Example
\newcounter{egx}[chapter] \setcounter{egx}{0}
\newcommand{\egx}{\arabic{chapter}.\arabic{egx}}
\newenvironment{eg}[2][]{%
\refstepcounter{egx}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=brown!40]
{\strut Example~\egx};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=brown!40]
{\strut Example~\egx:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=brown!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}


%Exercise
\newenvironment{ex}[2][]{%
\refstepcounter{egx}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=brown!40]
{\strut Exercise~\egx};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=brown!40]
{\strut Exercise~\egx:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=brown!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}

%Solution
\newcommand{\soln}{\arabic{chapter}.\arabic{egx}}

%Example Solution 
\newenvironment{egsol}[2][]{%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=gray!40]
{\strut Solution~\soln};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=gray!40]
{\strut Solution~\soln:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=gray!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}

%Exercise Solution 
\newenvironment{exsol}[2][]{%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=gray!40]
{\strut Solution~\soln};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=gray!40]
{\strut Solution~\soln:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=gray!40,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}\ifnum\std=1 \color{white} \fi}{\end{mdframed}}
%=================================
% useful commands
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\supp}{supp}

\def\vec#1{{\ensuremath{\bm{{#1}}}}}
\def\mat#1{\vec{#1}}
\def\bvec#1{\mathbf{#1}}

%=================================
% convenient notations
\newcommand{\XX}{\mathbb{X}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\EE}{\mathbb{E}}
\newcommand{\PP}{\mathbb{P}}

\newcommand{\sL}{\mathcal{L}}
\newcommand{\sX}{\mathcal{X}}
\newcommand{\sY}{\mathcal{Y}}

\newcommand{\ind}{\mathbb{1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typography, change document font
\RequirePackage[tt=false, type1=true]{libertine}
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[T1]{fontenc}

\RequirePackage[protrusion=true,expansion=true]{microtype}

% Disable paragraph indentation, and increase gap
\RequirePackage{parskip}

%=================================
% header and footer
\RequirePackage{scrpage2}
\pagestyle{scrheadings}
\deftripstyle{pagestyle}
%   [0.5pt]
%   [0.3pt]
  {}
  {}
  {\headmark}
  {}
  {\pagemark}
  {}

\pagestyle{pagestyle}
\renewcommand{\chapterpagestyle}{pagestyle}


%=================================
% draw pictures
\RequirePackage{tikz}
\usetikzlibrary{arrows,positioning,calc} 
\tikzstyle{labeled}=[execute at begin node=$\scriptstyle,
   execute at end node=$]
\RequirePackage{graphicx}

%=================================
% title page
% define university 
\def\@university{no university}
\newcommand{\university}[1]{
  \def\@university{#1}
}
% define course id
\def\@courseid{CS 000}
\newcommand{\courseid}[1]{
  \def\@courseid{#1}
}
% define version
\def\@version{Great Year}
\newcommand{\version}[1]{
  \def\@version{#1}
}
% define instructor info
\def\@instructor{Instructor}
\newcommand{\instructor}[1]{
  \def\@instructor{#1}
}
% make title
\renewcommand{\maketitle}{
    \centering
    {\scshape{\Large  \@university} \par}
    \vspace{0.5cm}
    {\large \@courseid \par}
    \vspace{1cm}
    {\huge\bfseries{\@title} \par}
    \vspace{2cm}
    \@instructor
    \vspace{4cm}
    \includegraphics[width=0.25\textwidth]{figures/LOGO_NDHU.png}
    \vfill
    % Bottom of the page
    {\Large\itshape \@author \par}
    {\large \@version \par}
}

%=================================
% add current instructor info 
% on the right
\newcommand{\curinstructor}[1]{
    % instructor info
    \vfill
    \begin{flushright}
    Instructor: #1
    \end{flushright}
}
