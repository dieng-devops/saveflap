# Flap (FraudBuster LDAP Account Provisioner)

## Bootstraper le projet sur sa machine

Pré requis: les éléments suivants doivent d'abord être installés :

* Mysql / MariaDB
* Redis
* [RVM](https://rvm.io/)
* Ruby 2.5.1 (`rvm install 2.5.1`)

1) On commence par cloner le projet et installer les dépendances :

```sh
nicolas@desktop:~/PROJECTS$ git clone ssh://git@gitlab.fb.int:2230/team-system/flap.git
nicolas@desktop:~/PROJECTS$ cd flap
nicolas@desktop:~/PROJECTS/flap$ bundle install
```


2) On créé ensuite le fichier de configuration de l'application à partir du [template fourni](/deploy/application.conf.sample) et on le customize :

```sh
nicolas@desktop:~/PROJECTS/flap$ cp deploy/application.conf.sample .env
nicolas@desktop:~/PROJECTS/flap$ (subl/vi/emacs/nano/eclipse/atom) .env
```

**Note :**

* La configuration de l'application est basée sur des variables d'environnement et utilise la gem [Dotenv](https://github.com/bkeepers/dotenv), d'où le fichier caché `.env`
* Si une variable de configuration n'est pas définie au lancement de l'application, le chargement s'arrête avec une erreur. (une variable peut être définie à vide)


3) On initialise la base de données :

```sh
nicolas@desktop:~/PROJECTS/flap$ bin/rails db:migrate
```


4) On créé le premier utilisateur :

```sh
nicolas@desktop:~/PROJECTS/flap$ bin/rails app:first_install
```


5) On démarre le serveur :

```sh
nicolas@desktop:~/PROJECTS/flap$ bin/rails s
```

L'application doit être accessible à cette adresse : http://localhost:5000


## Bootstraper le projet avec Docker

```sh
nicolas@laptop:~/PROJECTS/flap$ docker-compose up
nicolas@laptop:~/PROJECTS/flap$ docker-compose exec web rails db:migrate
nicolas@laptop:~/PROJECTS/flap$ docker-compose exec web rails app:first_install
```

L'application doit être accessible à cette adresse : http://localhost:5000


## Lancer les tests

```sh
nicolas@desktop:~/PROJECTS/flap$ bin/rspec
```


## Générer la documentation

```sh
nicolas@desktop:~/PROJECTS/flap$ bin/rails rdoc
```


## Déployer en production

1) On commence par se mettre sur la branche `master` et on crée une nouvelle release :

```sh
nicolas@desktop:~/PROJECTS/flap$ git checkout master
nicolas@desktop:~/PROJECTS/flap$ bin/release_manager release
```

**Note :**

* La création d'une nouvelle release se fait obligatoirement depuis la branche `master`
* Lors de la création d'une nouvelle release il ne doit pas y avoir de modifications en cours sur la branche. Pour vous en assurer faites un `bin/release_manager info`.


2) On pousse la nouvelle release sur Git :

```sh
nicolas@desktop:~/PROJECTS/flap$ bin/release_manager push
```


3) On déploie avec Capistrano :

```sh
nicolas@desktop:~/PROJECTS/flap$ cap production deploy
```
