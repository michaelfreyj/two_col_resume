%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------%
%---------------------Simple yet refined resume template----------------------%
%-----------------------------------------------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
% This class file defines the structure and design of the template.           %
%                                                                             %
% Copyright (c) 2020 by Michael J. Frey                                       %
%                                                                             %
% Permission is hereby granted, free of charge, to any person obtaining a     %
% copy of this software and associated documentation files (the "Software"),  %
% to deal in the Software without restriction, including without limitation   %
% the rights to use, copy, modify, merge, publish, distribute, sublicense,    %
% and or sell copies of the Software, and to permit persons to whom the       %
% Software is furnished to do so, subject to the following conditions:        %
%                                                                             %
% The above copyright notice and this permission notice shall be included in  %
% all copies or substantial portions of the Software.                         %
%                                                                             %
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  %
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    %
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE %
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      %
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     %
% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         %
% DEALINGS IN THE SOFTWARE.                                                   %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resumeMF}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{fontawesome}
\usepackage{vwcol}
\usepackage{multicol}
\usepackage{etoolbox}

% \faEnvelopO
% \faHome
% \faPhone
% \faMobile
% \faAt


% \faGithub
% \faGooglePlus
% \faInstagram
% \faLinkedin
% \faReddit
% \faSkype
% \faSoundcloud
% \faTwitter
% \faVimeo
% \faWhatsapp
% \faWordpress
% \faYoutube



\pagestyle{empty} % Suppress page numbers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------TITLE, CONTACT INFO, SKILLS, ACHIEVEMENTS------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def \name#1{\def\@name{#1}}
\def \address#1{\def\@address{#1}}
\def \phone#1{\def\@phone{#1}}
\def \email#1{\def\@soos{#1}}
\def \github{\def\@github{#1}}
\def \instagram#1{\def\@soos{#1}}
\def \googleplus#1{\def\@soos{#1}}
\def \linkedin#1{\def\@soos{#1}}
\def \mobile#1{\def\@soos{#1}}
\def \reddit#1{\def\@soos{#1}}
\def \soundcloud#1{\def\@soos{#1}}
\def \skype#1{\def\@soos{#1}}
\def \twitter{\def\@twitter{#1}}
\def \vimeo#1{\def\@soos{#1}}
\def \whatsapp#1{\def\@whatsapp{#1}}
\def \wordpress#1{\def\@wordpress{#1}}
\def \youtube#1{\def\@soos{#1}}


% \@ifundefined{cmd}{action if undefined}{action if defined}
% extra space out front
% \hspace*{4em}

% Put \vfill\null after the last line to break.
% And then put \columnbreak after \vfill\null.

\renewcommand\maketitle{

}


\newcommand\newskill[2]{
    \listadd\skilz{#1 \ifthenelse{\equal{#2}{}}{}{{\\                                                               
    \hspace*{1em}{\em#2}}}}}


\newcounter{itemcount}
\begin{list}{$\cdot$}{\leftmargin=1em}
\itemsep -0.5em \vspace{-0.5em}
\forlistloop{\stepcounter{itemcount}\item}{\skilz}
\end{list}


\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------------MAKE TITLE----------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------------------------SUMMARY FORMATTING------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\summaryname{Summary}
\newenvironment{Summary}{
        \small
        \begin{center}%
         {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------BODY FORMATTING-------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{body}[3]{

    \begin{vwcol}[width={0.3,0.7}]


}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------------------ENTRY FORMATTING-------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defines the rSection environment for the large sections within the CV
% 1 input argument - section name
% Section title
% Horizontal line
% List for each individual item in the section
% Margin within the section

\newenvironment{entry}[1]{ 
  \sectionskip
  \MakeUppercase{\bf #1} 
  \sectionlineskip
  \hrule 
  \begin{list}{}{ 
    \setlength{\leftmargin}{1.5em} 
  }
  \item[]
}{
  \end{list}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------------SUB-ENTRY FORMATTING-----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4 input arguments - company name, year(s) employed, job title, location, and
% additional info
% Bold company name and date on the right
% If the third argument is not specified, don't print the job title and location line
% Italic job title and location
% If the fifth argument is not specified, don't print the additional info
% Italic additional info
% \cdot used for bullets, no indentation
% Compress items in list together for aesthetics
% Some space after the list of bullet points

\newenvironment{subentry}[5]{ 
 {\bf #1} \hfill {#2} 
 \ifthenelse{\equal{#3}{}}{}{ 
  \\
  {\em #3} \hfill {\em #4} 
  }\smallskip
 \ifthenelse{\equal{#5}{}}{}{ 
  \\
  \hspace*{4em}{\em #5} 
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} 
   \itemsep -0.5em \vspace{-0.5em} 
  }{
  \end{list}
  \vspace{0.5em}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------WHITESPACE DEFINITIONS----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The below commands define the whitespace after certain things in the document
% they can be \smallskip, \medskip or \bigskip

% Size of the name at the top of the document
\def\namesize{\huge} 
% The space between the two address (or phone/email) lines
\def\addressskip{\smallskip} 
% The space above the horizontal line for each section 
\def\sectionlineskip{\medskip} 
% The space after your name at the top
\def\nameskip{\bigskip} 
% The space after the heading section
\def\sectionskip{\medskip} 

