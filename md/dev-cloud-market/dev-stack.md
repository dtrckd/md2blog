# Brief — stacks de prototypage rapide & monitoring

## 1. Les trois étages

Un produit = **backend données/auth** + **surface de déploiement** + **observabilité**. Le piège du prototypage rapide, c'est de choisir les deux premiers en 10 minutes et le troisième jamais, puis de découvrir en prod qu'on n'a aucune idée de qui utilise quoi.

## 2. Backend (données + auth + storage)

| | Modèle | Auth | Expo Go | Self-host | Free tier |
|---|---|---|---|---|---|
| **Supabase** | Postgres, SQL réel | intégrée + RLS | ✅ JS pur | ✅ | 500 MB DB, 1 GB storage, 2 projets |
| **Firebase** | Firestore (doc) | intégrée | ❌ module natif → prebuild | ❌ | généreux, facturation à l'usage |
| **Appwrite** | doc sur MariaDB | intégrée | ✅ | ✅ (son argument) | cloud 5 $/mois, self-host gratuit |
| **PocketBase** | SQLite, 1 binaire Go | intégrée | ✅ | ✅ obligatoire | gratuit, un VPS à 5 $ |

**Règle de choix :** données relationnelles (jointures, agrégats, classements) → Supabase. Prototype solo jetable → PocketBase, c'est un `./pocketbase serve`. Besoin de push + analytics natifs day one → Firebase, en acceptant de quitter le managed workflow.

## 3. Déploiement

**Web**

| | Fort en | Faible en | Free tier |
|---|---|---|---|
| **Vercel** | Next.js, DX imbattable, previews par PR | bande passante facturée, factures surprises | 100 GB/mois hobby |
| **Cloudflare Pages** | bande passante illimitée, edge mondial, R2 sans egress | runtime Workers ≠ Node | très large |
| **Netlify** | statique + forms + edge, simple | à la traîne sur Next | 100 GB/mois |
| **Render / Fly.io** | process long, cron, worker, DB managée | pas de magie serverless | 1 petit service gratuit |
| **GitHub Pages** | statique pur, zéro compte en plus | rien d'autre | gratuit |

**Mobile — pas de concurrence réelle : EAS.** `eas build` compile iOS dans le cloud (indispensable sous Linux), `eas submit` pousse aux stores, `eas update` livre du JS OTA sans repasser par la review. Free tier = file d'attente ; ~19 $/mois pour l'éviter.

## 4. Monitoring — les 5 questions, et qui y répond

C'est la partie qu'on saute et qu'on regrette. Cinq questions distinctes, cinq outils différents :

### a) « Ça plante ? » — crash & erreurs
**Sentry.** Standard de fait, SDK React Native + plugin Expo, source maps uploadées par EAS, crash-free rate, release health, breadcrumbs. Free tier 5k événements/mois.
⚠️ **Nécessite un development build ou un build EAS — ne remonte rien depuis Expo Go.** À brancher au moment du premier build interne, pas avant.
*Alternative :* Bugsnag, équivalent, moins d'écosystème.

### b) « Qui fait quoi ? » — analytics produit
**PostHog.** Le meilleur rapport valeur/effort en prototypage : événements, funnels, rétention, session replay, feature flags et A/B dans un seul outil. SDK RN, cloud gratuit jusqu'à 1M événements/mois, self-hostable.
*Alternatives :* Amplitude (funnels plus fins, gratuit jusqu'à 50k MTU), Mixpanel, Firebase Analytics (gratuit illimité, mais te ramène dans Firebase).

**À instrumenter dès le premier écran, pas « plus tard » :** signup terminé, premier objet ajouté à la collection, retour J+1. Trois événements suffisent à savoir si le produit vit.

### c) « Combien, et d'où ? » — trafic web
**Cloudflare Web Analytics** (gratuit, sans cookie, sans bandeau RGPD) ou **Plausible** / **Umami** (self-host, ~40 lignes de conf). **Vercel Analytics** si déjà chez eux, mais facturé par événement.

### d) « Et côté stores ? » — le monitoring gratuit qu'on oublie
**App Store Connect** et **Google Play Console** offrent déjà : installations, désinstallations, crashs ANR, notes, conversion de la fiche, rétention par cohorte. Zéro intégration, zéro coût. À regarder chaque semaine avant d'acheter un outil payant.

### e) « Le backend tient ? » — infra
- **Supabase Dashboard** : logs API/Postgres, requêtes lentes via `pg_stat_statements`, taille de la base, quotas. Souvent suffisant.
- **Uptime externe** : UptimeRobot ou BetterStack (free tier), ping toutes les 5 min + alerte. Le dashboard d'un fournisseur ne t'alerte jamais que *lui* est tombé.
- **Healthchecks.io** si tu as des jobs cron (un seed, un import) — te prévient quand un job *n'a pas* tourné, ce que rien d'autre ne détecte.

### f) Le mètre-étalon oublié
**Les logs de builds et d'updates EAS** : taux d'adoption d'une OTA update, part des utilisateurs restés sur une vieille version. Décisif quand tu pousses un correctif et que 40 % du parc ne l'a pas.

## 5. Stack recommandée pour un prototype mobile en 2026

```
Expo (managed) + expo-router     ← un code, deux stores, dev sous Linux
Supabase                          ← Postgres + auth + RLS, zéro serveur écrit
EAS Build / Submit / Update       ← iOS sans Mac, correctifs OTA
GitHub Pages                      ← privacy policy (obligatoire Apple)
─── monitoring ───
Sentry          crashs        dès le 1er build EAS
PostHog         usage         dès le 1er écran
Stores          installs      gratuit, déjà là
UptimeRobot     dispo         5 min de setup
```

Coût total en phase prototype : **0 €**, hors 99 $/an Apple + 25 $ Google au moment de publier.

## 6. Les trois erreurs classiques

1. **Choisir Firestore pour des données relationnelles.** Chaque agrégat devient un compteur dénormalisé maintenu à la main, chaque tri un index composite déclaré. On code un ORM à l'envers.
2. **Brancher le monitoring après le lancement.** Les 500 premiers utilisateurs sont les plus instructifs et ils ne repassent pas.
3. **Confondre analytics et logs.** Un log répond à « pourquoi ça a cassé », un événement produit à « pourquoi personne ne clique ». Les deux, ou aucune décision n'est informée.


---

# Contenders EU / français, couche par couche

## 1. Cloud & hébergement

| Rôle | EU / FR | Note |
|---|---|---|
| IaaS généraliste | **OVHcloud** 🇫🇷, **Scaleway** 🇫🇷 (Iliad), **Hetzner** 🇩🇪, **IONOS** 🇩🇪, **UpCloud** 🇫🇮 | Hetzner = le meilleur prix/perf d'Europe, Scaleway la meilleure API |
| PaaS (le « Vercel » EU) | **Clever Cloud** 🇫🇷 (Nantes), **Koyeb** 🇫🇷 (Paris, serverless), **Scaleway Containers**, **Platform.sh** 🇫🇷 | Clever Cloud = git push → déployé, DB managée incluse |
| CDN / edge | **Bunny.net** 🇸🇮 | Le vrai rival de Cloudflare : moins cher, excellent, storage edge inclus |
| Object storage (S3) | **Scaleway Object Storage**, **OVH**, **Bunny Storage**, **Infomaniak** 🇨🇭 | Scaleway a un tier gratuit 75 Go |
| Souverain SecNumCloud | **OVHcloud**, **Outscale** (Dassault), **Cloud Temple**, **S3NS**, **Bleu** | Utile seulement si contrainte réglementaire réelle |

## 2. Backend / BaaS — le trou dans la raquette

**Il n'existe pas de Supabase européen.** Les options honnêtes :

| Approche | Solution | Réalité |
|---|---|---|
| Supabase, région EU | Supabase Cloud → région **Paris (eu-west-3)** ou Francfort | RGPD ok avec DPA, mais société US sur AWS → **Cloud Act s'applique**. Ce n'est pas de la souveraineté, c'est de la localisation |
| Supabase self-hosted | Docker compose officiel sur **Scaleway / Hetzner / Clever Cloud** | Même API, même SDK, ton Postgres. Coût : tu deviens l'ops (backups, upgrades, monitoring) |
| Équivalent natif EU | **Nhost** 🇸🇪 (Postgres + Hasura + auth), **Appwrite** self-host, **PocketBase** | Nhost est le plus proche fonctionnellement |
| Briques séparées | Postgres **Aiven** 🇫🇮 ou **Scaleway Managed DB** + auth **Ory** 🇩🇪 / **Zitadel** 🇨🇭 / **Keycloak** | Le plus souverain, le plus de code à écrire |

## 3. Monitoring — là, l'Europe est bien fournie

| Besoin | EU / FR |
|---|---|
| **Analytics web** | **Plausible** 🇪🇪 (EU-hosted, sans cookie), **Matomo** 🇩🇪🇫🇷 (héritage Piwik, cloud à Francfort), **Pirsch** 🇩🇪, **Wide Angle** 🇵🇱 |
| **Analytics produit** | **PostHog EU Cloud** (Francfort — même produit, données en UE), **Matomo** en repli |
| **Crashs / erreurs** | **Sentry EU region** (Francfort, à choisir *à la création* du projet, non migrable après), **GlitchTip** (open source, API compatible Sentry, self-host) |
| **Uptime** | **updown.io** 🇫🇷 (excellent, ~1 €/mois), **Better Stack** 🇨🇿, **Uptime Kuma** (self-host) |
| **Logs / APM** | **Dash0** 🇩🇪, **Grafana Cloud EU**, ou Loki/Grafana self-host |
| **Email transactionnel** | **Brevo** 🇫🇷 (ex-Sendinblue), **Mailjet** 🇫🇷, **Scaleway TEM**, **Tipimail** 🇫🇷 |

## 4. Mobile — le point dur

**EAS Build n'a pas d'équivalent européen.** Expo est américain, le service de push Expo aussi.

La seule alternative crédible : **Scaleway loue des Mac mini M1/M2/M4** à l'heure ou au mois 🇫🇷. Tu y montes un runner CI (GitLab, Forgejo) qui fait `fastlane` + `xcodebuild`. C'est du vrai iOS CI en France — mais tu échanges « 19 $/mois et je ne pense à rien » contre « ~60 €/mois et je maintiens une chaîne Xcode ». Pour un prototype, non.

Pour les push, si Expo Push devient un problème : **ntfy** 🇩🇪 (self-host) ou APNs/FCM directement — mais FCM est Google, donc on tourne en rond.

Autres briques 🇫🇷 utiles : **Mistral** (LLM), **Jawg** (cartes, Nantes), **IGN Géoplateforme**, **Gandi** (domaines), **Framagit / Codeberg** 🇩🇪 (repos).

