# NcuApi
The ruby API behind the NcuWiki web-app

## Docker

Ce projet peut être lancé en production via Docker.

### Prérequis
- Docker
- Docker Compose

### Lancement

1. S'assurer que la clé maître est disponible dans `config/master.key` ou via la variable d'environnement `RAILS_MASTER_KEY`.
2. Lancer les conteneurs :
   ```bash
   docker compose up -d
   ```

L'API sera accessible sur le port 8080.
