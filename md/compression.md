@bash
@linux

http://forum.zebulon.fr/faq-comment-decompresser-des-packages-archives-t52983.html


 format              extraction             compression                 package
-----------------  ---------------------- ---------------------------  ------------
Z                  uncompress <fichier.Z>              
gz                 gzip -d <fichier.gz>
bz2                bzip2 -d <fichier.bz2>
tar                tar xvf <fichier.tar>   tar czvf f.tar f
tgz ou un tar.gz   tar zxvf                tar czvf <fn>.tar.gz <fn>
tar.bz2            tar jxvf
tar.xz             tar xvfJ
rar                unrar x <file>
zip                unzip <fichier.zip>     zip -r data *               zip / infozip

Avant toute chose, si vous ne savez pas ce que contient un fichier : file <fichier>
(Ces informations sont basées sur le fichier /etc/magic)

- Extraire un rpm : rpm2cpio <fichier.rpm> | cpio -mid
- Extraire un deb : dpkg-deb -x <fichier.deb>

- Extraire un cab Microsoft : cabextract <fichier.cab>
cabextract peut s'obtenir sur uklinux.net

- Extraire un cab InstallShield : unshield <fichier.cab>
unshield peut s'obtenir sur synce.sourceforge.net
Note : dans le cas de cabs InstallShield, les fichiers s'appellent généralement data1.cab, data1.hdr, data2.cab, etc.

- Extraire un arj : unarj x <fichier.arj>
unarj appartient au package "bin", et une version complète de arj peut s'obtenir sur arj.sourceforge.net 

- Extraire un rar : unrar x <fichier.rar>
unrar peut s'obtenir sur rarlab.com

- Extraire un ace : unace x <fichier.ace>
unace ("LinUnAce") peut s'obtenir sur winace.com

- Extraire un lha : lha x <fichier.lha ou fichier.lzh>
lha est disponible sur son site officiel

- Extraire un jar : jar xvf <fichier.jar>
jar peut s'obtenir dans le JRE ou le JDK de Sun
Remarque : les fichiers xpi sont en fait des jar.

- Extraire un 7z : 7za x <fichier.7z>
7za peut s'obtenir sur la page du projet p7zip de Sourceforge.
Pour ceux qui ignoreraient ce qu'est le format 7z, allez jeter un oeil sur la homepage de 7zip qui est un archiveur zip / 7z gratuit pour Windows.

- Mounter un iso : mount -o loop -t iso9660 <fichier.iso> /point/de/montage

-- Quelqu'un utilise encore ces trucs ? --
Pour le cas où vous voudriez vous amuser avec votre mailbox (qui contient des attachements en base64, voire en UUE), allez chercher uudeview.

- Extraire des fichiers uuencodés ou en base64 : uudeview -i <fichier>
(note : parfois les fichiers sont affublés de l'extension b64 ou uue, mais la plupart du temps, non) 


### Cut files

cut:
    split --bytes=10M --filter='gzip > $FILE.gz' stirling.npy  path/to/stirling
    zip -r package  path/to 

join:
    gunzip path/to/* && cat path/to/* > stirling.npy
