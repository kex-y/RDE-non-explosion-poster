% Poster class with EPFL colors and logo.

\ProvidesClass{epflposter}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax

\LoadClass[25pt,a0paper,innermargin=5cm]{tikzposter}

\RequirePackage{epflcolor}

\definecolorpalette{epfl} {
  \definecolor{colorOne}{named}{epflbackgd}
  \definecolor{colorTwo}{named}{black}
  \definecolor{colorThree}{named}{epflfont}
}

\definecolorstyle{epfl} {}{
  \colorlet{backgroundcolor}{colorOne!50}
  \colorlet{framecolor}{colorOne!50}
  \colorlet{titlefgcolor}{colorThree}
  \colorlet{titlebgcolor}{colorOne!50}
  \colorlet{blocktitlebgcolor}{white}
  \colorlet{blocktitlefgcolor}{colorThree}
  \colorlet{blockbodybgcolor}{white}
  \colorlet{blockbodyfgcolor}{colorThree}
  \colorlet{innerblocktitlebgcolor}{white}
  \colorlet{innerblocktitlefgcolor}{colorThree}
  \colorlet{innerblockbodybgcolor}{white}
  \colorlet{innerblockbodyfgcolor}{colorThree}
  \colorlet{notefgcolor}{colorThree}
  \colorlet{noteframecolor}{colorTwo}
}

\definebackgroundstyle{epfl}{
  \draw[inner sep=0pt, line width=0pt, fill=backgroundcolor] 
  (bottomleft) rectangle (topright);
  \node[inner sep=0pt] (epfl) at   
  (0.45\paperwidth-9cm,0.5\paperheight-7.5cm)
      {\includegraphics[width=20cm]{images/EPFLlogo.png}};
}

\definetitlestyle{epfl}{
  width=0.9\paperwidth, roundedcorners=0, linewidth=0pt, innersep=0cm,
  titletotopverticalspace=5cm, titletoblockverticalspace=5cm
}{}

\renewcommand\TP@maketitle{%
  \begin{minipage}{0.8\titlewidth}
    \color{titlefgcolor}
    {\Huge \@title \par}
    \vspace*{2em}
    {\textcolor{epflred}{\rule{4cm}{2mm}}\par}
    \vspace*{2em}
    {\LARGE \@author \par}
    \vspace*{1em}
    {\@institute}
  \end{minipage}
}

\defineblockstyle{epfl}{ 
  titlewidthscale=1, bodywidthscale=1, titleleft,
  titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=15mm,
  bodyverticalshift=10mm, roundedcorners=0, linewidth=0pt,
  titleinnersep=1cm, bodyinnersep=1cm
}{
  \draw[color=framecolor, fill=blockbodybgcolor,
  rounded corners=\blockroundedcorners] (blockbody.south west)
  rectangle (blockbody.north east);
  \ifBlockHasTitle
    \draw[color=framecolor, fill=blocktitlebgcolor,
    rounded corners=\blockroundedcorners] (blocktitle.south west) -- 
    (blocktitle.north west) -- (blocktitle.north east) -- (blocktitle.south 
    east);
  \fi
}

\definelayouttheme{epfl}{
  \usecolorstyle[colorPalette=epfl]{epfl}
  \usebackgroundstyle{epfl}
  \usetitlestyle{epfl}
  \useblockstyle{epfl}
}
\usetheme{epfl}

\tikzposterlatexaffectionproofoff

