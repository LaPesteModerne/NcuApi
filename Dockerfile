FROM ruby:3.1.3-slim

# Installer les dépendances système nécessaires
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential curl git && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Définir le répertoire de travail
WORKDIR /rails

# Définir l'environnement de production
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development test"

# Installer les gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copier le reste de l'application
COPY . .

# S'assurer que les scripts dans bin sont exécutables
RUN chmod +x bin/*

# Précompiler les assets (si nécessaire, bien que ce soit une API)
# RUN bundle exec rake assets:precompile

# Exposer le port 3000
EXPOSE 3000

# Commande par défaut pour démarrer le serveur
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
