https://github.com/julia-actions/setup-julia\

https://stackoverflow.com/questions/9741433/appending-a-line-break-to-an-output-file-in-a-shell-script

https://github.com/actions/virtual-environments/blob/main/images/macos/macos-10.15-Readme.md

    steps:
      - uses: actions/checkout@v1.0.0
      - name: "Install apt-get packages"
        if: runner.os == 'Linux'
        run: |-
            sudo apt-get update
            sudo apt-get install -y python-matplotlib python3-matplotlib
        if: runner.os == 'macOS'
        run: |
          pip3 install matplotlib


https://onlinelibrary.wiley.com/doi/epdf/10.1111/ele.13582

https://huygens.science.uva.nl/PlotsOfData/

https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}

```{r, fig.cap="Figure associé à la table 1 [...]. Le gris pour l'expérience 1, bleu pour la seconde et violet pour la troisième.\\label{figcol}", dpi = 300, fig.heigh = 4, fig.width = 5}
par(bty="l", font=2)
plot(tab1$var1, tab1$var2, pch=15:19, col=rep(c(8,4,6),each=5), xlab="Mon axe des abscisses",
    ylab="Mon axe des ordonnées")
  legend("bottomright", letters[1:5], pch=15:19, bty="n")
```

J'ai ajouté à la fin de la légende "\\label{figcol}", je peux donc l'appeler en
utilisant "\\ref{figcol}" mai ce n'est valable que pour la sortie PDF. De mon
point de vue, on peut considérée qu'on a une extension graphique en ligne de
commande un peu moins verbeuse que
[PGF/TikZ](http://sourceforge.net/projects/pgf/).


```{r, fig.cap = "Ma rosace", fig.height = 6, fig.width = 6}
kcircle <- function(rad=1,centre=c(0,0), from=0, to=2*pi, dt=0.001,...){
    pt <- seq(from, to, dt)
    polygon(centre[1]+rad*cos(pt),centre[2]+rad*sin(pt),...)
}
plot(c(-1.5,1.5), c(-1.5,1.5), type="n", ann=FALSE,
    axes=FALSE, xaxs="i", yaxs="i")
kcircle(col="#AA000088")
for (i in 1:6) kcircle(1,c(cos(i*pi/3),sin(i*pi/3)), col="#0000AA88")
```


https://www.debian.org/releases/jessie/amd64/ch04s03.html.en

