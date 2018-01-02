# Flap (FraudBuster LDAP Account Provisioner)

## Bootstraper le projet

Pré requis: les éléments suivants doivent d'abord être installés :

* Mysql / MariaDB
* Redis
* [RVM](https://rvm.io/)
* Ruby 2.5.0 (`rvm install 2.5.0`)

1) On commence par installer les dépendances :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER$ git clone ssh://git@gitlab.fb.int:2230/team-system/flap.git
nicolas@desktop:~/PROJECTS/FRAUDBUSTER$ cd flap
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bundle install
```


2) On créé ensuite le fichier de configuration de l'application à partir du [template fourni](/deploy/application.conf.sample) et on le customize :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ cp deploy/application.conf.sample .env
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ (vi/subl/emacs/nano/eclipse) .env
```

**Note :**

* La configuration de l'application est basée sur des variables d'environnement et utilise la gem [Dotenv](https://github.com/bkeepers/dotenv), d'où le fichier caché `.env`
* Si une variable de configuration n'est pas définie au lancement de l'application, le chargement s'arrête avec une erreur. (une variable peut être définie à vide)


3) On initialise la base de données :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bin/rails db:migrate
```


4) On créé le premier utilisateur :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bin/rails app:first_install
```


5) On démarre le serveur :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bin/rails s
```

L'application doit être accessible à cette adresse : http://localhost:5000


## Déployer en production

1) On commence par se mettre sur la branche `master` et on crée une nouvelle release :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ git checkout master
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bin/release_manager release
```

**Note :**

* La création d'une nouvelle release se fait obligatoirement depuis la branche `master`
* Lors de la création d'une nouvelle release il ne doit pas y avoir de modifications en cours sur la branche. Pour vous en assurer faites un `bin/release_manager info`.


2) On pousse la nouvelle release sur Git :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bin/release_manager push
```


3) On déploie avec Capistrano :

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ cap production deploy
```


## Lancer les tests

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bin/rspec
```


## Générer la documentation

```sh
nicolas@desktop:~/PROJECTS/FRAUDBUSTER/flap$ bin/rails rdoc
```
