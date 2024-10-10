@python

## Alembic

Create a new alembic (empty) template version:

    PYTHONPATH=. alembic revision -m  "vXXX"

Autogenerate a new alembic upgrade version script:

    PYTHONPATH=. alembic revision --autogenerate -m "vXXX"

Upgrade a database according to alemic revision:

    PYTHONPATH=. alembic upgrade head

## o1-mini

Bien sûr ! Voici un tableau récapitulatif des commandes principales d'Alembic en Python :

| **Commande**              | **Description**                                                                                   | **Exemple d'utilisation**                                      |
|---------------------------|---------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| `init <répertoire>`       | Initialise un nouveau environnement Alembic dans le répertoire spécifié.                          | `alembic init alembic`                                         |
| `revision`                | Crée une nouvelle révision de migration.                                                          | `alembic revision -m "Ajout de la table utilisateur"`          |
| `revision --autogenerate` | Génère automatiquement une révision basée sur les changements du modèle.                          | `alembic revision --autogenerate -m "Mise à jour du schéma"`   |
| `upgrade <cible>`         | Applique les migrations jusqu'à la révision spécifiée ou à la tête.                               | `alembic upgrade head` / `alembic upgrade +1`                  |
| `downgrade <cible>`       | Rétrograde la base de données jusqu'à la révision spécifiée.                                      | `alembic downgrade -1` / `alembic downgrade base`              |
| `current`                 | Affiche la révision actuelle appliquée à la base de données.                                      | `alembic current`                                              |
| `history`                 | Affiche l'historique des révisions.                                                               | `alembic history --verbose`                                    |
| `branches`                | Affiche les branches de révisions actives.                                                        | `alembic branches`                                             |
| `heads`                   | Affiche les têtes actuelles des branches de migration.                                            | `alembic heads`                                                |
| `merge <cible1> <cible2>` | Fusionne deux branches de révision.                                                               | `alembic merge head branch_a`                                  |
| `show <révision>`         | Affiche le contenu de la révision spécifiée.                                                      | `alembic show ae1027a6acf`                                     |
| `stamp <cible>`           | Marque la base de données avec la révision spécifiée sans appliquer de migration.                 | `alembic stamp head`                                           |
| `current -v`              | Affiche les informations détaillées de la révision actuelle.                                      | `alembic current --verbose`                                    |
| `upgrade --sql <cible>`   | Génère le script SQL nécessaire pour atteindre la révision spécifiée sans l'exécuter.             | `alembic upgrade head --sql > upgrade.sql`                     |
| `downgrade --sql <cible>` | Génère le script SQL nécessaire pour rétrograder jusqu'à la révision spécifiée sans l'exécuter.   | `alembic downgrade -1 --sql > downgrade.sql`                   |


### Options Courantes

- `-m`, `--message`: Spécifie un message descriptif pour la révision.
- `-n`, `--name`: Donne un nom à la révision lors de la création manuelle.
- `--autogenerate`: Compare le schéma actuel de la base de données avec les modèles SQLAlchemy pour générer automatiquement les migrations.
- `--sql`: Génère un script SQL au lieu d'exécuter les migrations directement.
- `--head`: Spécifie la tête actuelle dans les commandes `upgrade` ou `downgrade`.

### Exemple de Flux de Travail Typique

1. **Initialiser Alembic** :
   ```bash
   alembic init alembic
   ```

2. **Créer une nouvelle révision avec autogénération** :
   ```bash
   alembic revision --autogenerate -m "Création de la table produit"
   ```

3. **Appliquer les migrations** :
   ```bash
   alembic upgrade head
   ```

4. **Voir l'état actuel** :
   ```bash
   alembic current
   ```

5. **Rétrograder d'une révision** :
   ```bash
   alembic downgrade -1
   ```

Ce tableau couvre les commandes les plus courantes utilisées avec Alembic pour gérer les migrations de bases de données en Python. Pour plus de détails, vous pouvez consulter la [documentation officielle d'Alembic](https://alembic.sqlalchemy.org/en/latest/).
