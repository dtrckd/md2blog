@linux
@bash

Manipulation de variables simples

	var=val ou var="a b"   affectation de la variable "var"
	$var ou ${var}   contenu de la variable "var"
	${#var}   longueur de la variable "var"
	export var ou declare -x var   exportation de la variable "var" vers les shells fils
	set   affichage de l'ensemble des variables définies dans le shell
	unset var   suppression de la variable "var"

Manipulation complexes

	${var#prefix} remove prefix
	${var%%suffix} remove suffix
	${var##prefix} remove as much as possible prefix
	${var%%suffix} remove as much as possible suffix
    ${var-} the hyphen means that if var is null or empty it will return '' is set -u is active

Tableaux

	tab[0]=val   affectation du premier enregistrement du tableau "tab"
	${tab[0]} ou $tab   contenu du premier enregistrement du tableau "tab"
	${tab[11]}   contenu du douzième enregistrement du tableau "tab"
	${tab[*]}   ensemble des enregistrements du tableau "tab"
	${#tab[11]}   longueur du douzième enregistrement du tableau "tab"
	${#tab[*]}   nombre d'enregistrements du tableau "tab"

Paramètres positionnels et arguments

	$0   nom du script
	$1 $2 ... ${10}   paramètres positionnels (1, 2 et 10)
	$#   nombre de paramètres positionnels
	$* ou $@   ensemble des paramètres positionnels, équivalant à $1 $2 ... ${n}
	"$*"   ensemble des paramètres positionnels, équivalant à "$1 $2 ... ${n}"
	"$@"   ensemble des paramètres positionnels, équivalant à "$1" "$2" ... "${n}"
	Variables spéciales
	$$   PID du shell courant
	$!   PID du dernier travail lancé en arrière plan
	$?   code retour de la dernière commande

Variables d'environnement

	$HOME   chemin du répertoire personnel de l'utilisateur
	$OLDPWD   chemin du répertoire précédent
	$PATH   liste des chemins de recherche des commandes exécutables
	$PPID   PID du processus père du shell
	$PS1   invite principale du shell
	$PS2   invite secondaire du shell
	$PS3   invite de la structure shell "select"
	$PS4   invite de l'option shell de débogage "xtrace"
	$PWD   chemin du répertoire courant
	$RANDOM   nombre entier aléatoire compris entre 0 et 32767
	$REPLY   variable par défaut de la commande "read" et de la structure shell "select"
	$SECONDS   nombre de secondes écoulées depuis le lancement du shell
