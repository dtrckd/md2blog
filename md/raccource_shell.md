@linux
@bash

Raccourcis clavier pour Bash
Posted on May 4, 2010 by pascal.rapaz

Le shell par défaut de la plupart des systèmes d’exploitation GNU/Linux est appelée Bash. Si vous prévoyez de passer beaucoup de temps avec cette ligne de commandes les raccourcis clavier qui suivent devraient vous simplifier la vie !
Déplacement
Ctrl + a 	Déplace le curseur au début de la ligne courante
Ctrl + e 	Déplace le curseur à la fin de la ligne courante
Alt + b 	Déplace le curseur mot à mot vers l’arrière
Alt + f 	Déplace le curseur mot à mot vers l’avant
Crtl + xx 	Positionne le curseur au début ou à la fin du mot
Edition
Ctrl + k 	Coupe la ligne après la position du curseur
Ctrl + u 	Coupe la ligne avant la position du curseur
Ctrl + w 	Coupe le chaîne avant le curseur
Alt + Backspace 	Coupe le chaîne avant le curseur mais s’arrête aux “/” et au “.”
Ctrl + y 	Colle la ligne ou la chaîne
Ctrl + h 	Supprime le caractère avant le curseur (identique touche Backspace)
Ctrl + t 	Inverse la position des deux caractères avant le curseur
Alt + t 	Inverse la position des deux mots avant le curseur
Alt + c 	Met une lettre en majuscule
Alt + l 	Met un mot en minuscule
Alt + u 	Met un mot en majuscule
Alt + . ou Esc + . 	Réécrit le dernier mot de la ligne précédente
Crtl + _ 	Annule la dernière modification
Historique
Ctrl + r 	Recherche parmi les commandes précédentes
Ctrl + p 	Commande précédente
Ctrl + n 	Commande suivante
^[chaîne 1]^[chaîne 2]^ 	Exécute la dernière commande en remplaçant la [chaîne 1] par la [chaîne 2]
!# 	Exécute la plus ancienne commande de l’historique
!! 	Exécute la dernière commande
! + [chaîne] 	Exécute la dernière commande commançant par la [chaîne] de caractères
!? + [chaîne] 	Exécute la dernière commande contenant la [chaîne] de caractères
! + [n] 	Rappelle la commande lancée il y a [n] commandes
[commande] + !^ 	Exécute la commande avec le premier argument de la commande précédente
[commande] + !:[n]-[m] 	Exécute la commande avec les arguments de [n] à [m] de la commande précédente
[commande] + !:[n] 	Exécute la commande avec l’argument [n] de la commande précédente
[commande] + !$ 	Exécute la commande avec le dernier argument de la commande précédente
Processus
Ctrl + c 	Arrête la commande en cours
Ctrl + d 	Quitte le shell courant
Ctrl + z 	“Suspend” l’exécution de tous les processus en cours d’exécution. Les commandes fg ou bg permettent de (re)démarrer les processus.
Ctrl + s 	Masque la saisie et suspends le défilement (Ctrl + q pour revenir)
Ctrl + q 	Fait apparaître la saisie et relance l’affichage
Divers
Tab 	Complète automatiquement le nom du fichier ou répertoire
Ctrl + l 	Efface le contenu de l’écran (idem commande clear)

