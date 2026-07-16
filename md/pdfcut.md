# Memo PDF - manipulation en ligne de commande

## Installation

```bash
sudo apt install qpdf pdftk poppler-utils texlive-extra-utils
```

- `qpdf` : extraction, split, merge, rotation, chiffrement
- `pdftk` : idem, syntaxe simple
- `poppler-utils` : `pdfinfo`, `pdftoppm`, `pdfimages`, `pdftotext`
- `texlive-extra-utils` : `pdfcrop`, `pdfjam`

## Extraire / garder des pages

```bash
qpdf in.pdf --pages in.pdf 2-5 -- out.pdf      # pages 2 a 5
qpdf in.pdf --pages in.pdf 1,3,5 -- out.pdf    # pages 1, 3, 5
qpdf in.pdf --pages in.pdf 5-2 -- out.pdf      # ordre inverse
qpdf in.pdf --pages in.pdf z-2 -- out.pdf      # de la fin (z) a la page 2

pdftk in.pdf cat 2-5 output out.pdf
pdftk in.pdf cat 1 3 5 output out.pdf
```

## Fusionner (merge)

```bash
qpdf --empty --pages a.pdf b.pdf c.pdf -- out.pdf
pdftk a.pdf b.pdf c.pdf cat output out.pdf
```

## Separer (split) en pages individuelles

```bash
qpdf --split-pages in.pdf out.pdf      # genere out-01.pdf, out-02.pdf...
pdftk in.pdf burst output page_%02d.pdf
```

## Supprimer des pages

```bash
qpdf in.pdf --pages in.pdf 1-3,6-z -- out.pdf   # retire pages 4 et 5
```

## Rotation

```bash
qpdf in.pdf out.pdf --rotate=+90:1        # tourne page 1 de 90
qpdf in.pdf out.pdf --rotate=+90          # toutes les pages
pdftk in.pdf cat 1east output out.pdf     # page 1 tournee a droite
```

## Rogner les marges (crop)

```bash
pdfcrop in.pdf out.pdf                     # auto-detecte et rogne les blancs
pdfcrop --margins 10 in.pdf out.pdf        # garde 10pt de marge
```

## Redimensionner / assembler (pdfjam)

```bash
pdfjam in.pdf 2-5 -o out.pdf               # extrait pages 2-5
pdfjam --nup 2x1 in.pdf -o out.pdf         # 2 pages par feuille
```

## Compresser

```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH \
   -sOutputFile=out.pdf in.pdf
# /screen (petit), /ebook (moyen), /printer, /prepress (qualite)
```

## Infos et conversions

```bash
pdfinfo in.pdf                             # nb pages, taille, metadata
pdftotext in.pdf out.txt                   # extraire le texte
pdftoppm -png -r 150 in.pdf page           # PDF -> images PNG
pdfimages -all in.pdf img                  # extraire les images
```

## Chiffrer / dechiffrer

```bash
qpdf --encrypt user owner 256 -- in.pdf out.pdf   # protege par mot de passe
qpdf --decrypt --password=motdepasse in.pdf out.pdf
```

## Rappels syntaxe qpdf

- Plage : `2-5`, liste : `1,3,5`, fin : `z`, inverse : `5-2`
- `--` separe la liste des pages du fichier de sortie
- `--empty` demarre sans document (pour merge pur)
