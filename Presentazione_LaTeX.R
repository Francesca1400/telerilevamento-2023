% My LaTeX code for the related presentation
% in the ecological remote sensing exam of Prof.D. Rocchini

\documentclass{beamer}
\usepackage{graphicx} % Required for inserting images
\usepackage{color}
\usepackage{natbib}
\usepackage{hyperref}

\usetheme{JuanLesPins}
\usecolortheme{spruce}

\author{\Large Francesca Cipolletta}
\title{Esame telerilevamento geoecologico - Analisi dei danni vegetatvi a seguito degli incendi avvenuti in Sicilia nei pressi di Belmonte}
\date{15 Settembre 2023}
\logo{\includegraphics[width=13mm]{logo.png}}
\institute{\large Alma Mater Studiorum- Università di Bologna}

\begin{document}

\maketitle

\AtBeginSection[]
{
\begin{frame}
\frametititle{}
\tableofcontents[currentsection]
\end{frame}
}

\section{Introduzione}
\begin{frame}{}
Il progetto si suddivide nelle seguenti \textbf{sezioni}:
\begin{itemize}
    \item Obiettivo del progetto
    \item Importazione e visualizzazione delle immagini 
    \item Calcolo DVI e NDVI
    \item Classificazione e Land Cover
\end{itemize}
\end{frame}

\begin{frame}{Obiettivo del progetto}
Il progetto mira ad analizzare lo stato di salute della \textbf{vegetazione} in \textbf{Sicilia}, precisamente nell'area di Belmonte in provincia di Palermo, a seguito di devastanti incendi che hanno colpito l'area presa in esame.
    
\end{frame}

\begin{frame}{Area di studio}
 \includegraphics[width=250]{Area di studio.png} 
 \centering
\end{frame}

\section{Materiali e metodi}
\begin{frame}{Importazione e visualizzazione delle immagini}
\begin{itemize}
    \item Importazione delle immagini 
    \item Crop delle immagini per ritagliare l'area di indagine
    \item Plot RGB dell'area di studio con colori reali
\end{itemize}
    \end{frame}

\begin{frame}{Plot RGB con colori reali}
\includegraphics[width=\textwidth]{Plot in par.pdf}
 \centering   
\end{frame}

\begin{frame}{Calcolo DVI e NDVI}
    \begin{itemize}
        \item DVI (Difference Vegetation Index): indice sensibile alla quantità della vegetazione 
        \begin{equation}
           DVI= NIR-red
        \end{equation}
        \item NDVI (Normalized Difference Vegetation Index): descrive al meglio lo stato di salute della vegetazione
        \begin{equation}
           NDVI=  \frac{(NIR – Red)}{NIR + Red} 
        \end{equation}
        \end{itemize}
\end{frame}

\begin{frame}{Plot DVI e NDVI}
    Maggio 2023
    \includegraphics[width=200]{dvimay.pdf}
    \includegraphics[width=200]{ndvi may.pdf}
 \centering  
\end{frame}

\begin{frame}{Plot DVI e NDVI}
    Luglio 2023
    \includegraphics[width=200]{dvijuly.pdf}
    \includegraphics[width=200]{ndvi august.pdf}
 \centering  
\end{frame}

\begin{frame}{Plot DVI e NDVI}
    Agosto 2023
    \includegraphics[width=200]{dviaugust.pdf}
    \includegraphics[width=200]{ndvi august.pdf}
 \centering  
\end{frame}

\begin{frame}{Differenza tra DVI e NDVI}
    \includegraphics[width=300]{difNDVI.pdf}
  \centering  
\end{frame}

\begin{frame}{Classificazione e Land Cover}
 \begin{itemize}
     \item Classificazione attraverso 3 classi: Suolo bruciato, acqua e vegetazione
    \item Calcolo percentuali per ogni classe
    \item Creazione degli istogrammi relativi ai 3 mesi di indagine
 \end{itemize}   
\end{frame}

\section{Risultati}
\begin{frame}{}
    \includegraphics[width=300]{grafico percentuali.pdf}
    \centering
\end{frame}

\section{Conclusione}
\begin{frame}{}
    Possiamo quindi notare che, fatta eccezione per la superficie dell'acqua che è rimasta la stessa:
   
    \begin{itemize}
        \item La percentuale di \textbf{suolo bruciato} è aumentata durante i 3 mesi di osservazione e si spera che con il passare dei mesi la situazione migliori con il calo delle temperature
        \item La percentuale di \textbf{vegetazione} è invece diminuita proprio a causa di queste situazioni ambientali dastriche che hanno colpito la Sicilia tutta
    \end{itemize}

\end{frame}

\begin{frame}{}
    \LARGE Grazie per l'attenzione!!!
    \centering
\end{frame}

\end{document}
