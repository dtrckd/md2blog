@disk
@linux

>>> Graver un iso bootable sur une clé usb

# En ligne de commande

Connectez votre clé usb. Ne laissez pas votre environnement de bureau monter la clé usb. S'il le fait, démontez la.
Utilisez fdisk ou cfdisk pour créer une partition sur la clé usb. Définissez lui le type fat16 et assignez lui le flag de boot.
Sauvegardez la table de partition puis quittez fdisk ou cfdisk:

### for an unilateral formatage / if corrupted or GPT problem:
dd if=/dev/zero of=/dev/sdc bs=512 count=1
gdisk /dev/sdX # / expert / remove GPT ...

`
fdisk /dev/sdb
  n (primary, 1) // create parttion
  ... // cylender (default for all)
  a // make it bootable
  t // choose type (fat 16/32 W95 work)
  w  // write change
`

### Creer systeme de fichier (optionnel !!!) :
mkfs.vfat /dev/sdb1 # -F 32 ?

>>> EASY WAY %%%%%%%%%%%%%%%%%%%%%%%
(fs is umounted)

###### from a Image:
	cp debian.iso /dev/sdxx
	sync

###### from a File:
	zcat boot.img.gz > /dev/sdxx
	mnt /dev/sdX /mnt
	cp debian.iso /mnt

End reboot.

### Else 
Pour commencer, installez les paquets syslinux et mbr>
	apt-get install syslinux mbr

Installer le bootloader syslinux :
	syslinux /dev/sdb1

Récupérer l'un des mini.iso de ubuntu (ou n'importe quelle image en fonction de la taille de votre clé usb).
Montez l'image iso que vous venez de télécharger :
	mount -o loop ~/mini.iso /media/cdrom0
	mount /dev/sdb1 /mnt
	cp -r /media/cdrom0/* /mnt

 Renommez le fichier isolinux.cfg sur la clé usb :
	cd /mnt
	mv isolinux.cfg syslinux.cfg

 Enfin, installez un mbr sur la clé usb :
	install-mbr /dev/sdb



# Méthode graphique

Installez le paquet usb-creator (gtk) ou usb-creator-kde (qt) :

	apt-get install usb-creator-kde # See also UNetbootin


Récupérée de « http://wiki.csnu.org/index.php?title=Graver_un_iso_bootable_sur_une_cl%C3%A9_usb »
http://www.debian.org/releases/stable/i386/ch04s03.html.en

