@bash
@video

Information sur le serveur X                                : `xdpyinfo`
trouver les noms des polices de caractères X11              : `xfontsel ou gfontsel`
chargement des ressources par défaut du client X            : `xrdb -merge Xressources`
modifier les préférences d'affichage X (souris, clavier...) : `xset`
information sur une fenêtre X : `xwininfo`

Get configuration of X server : 
    service lightdm|gdm stop
    Xorg -configure


### Configure the screen/ouput

	xrandr
	xrandr --output VGA-1 --left-of LVDS-1
	xrandr  --output VGA-1 --auto --same-as LVDS-1
	xrandr --output VGA-1 --mode 1280x1024 --auto --output LVDS-1 --mode 1280x800 --auto
    
