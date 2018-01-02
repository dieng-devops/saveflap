node('libvirt') {
  // Checkout repository first
  stage("Flap! - Checkout") {
    checkout scm
  }

  stage("Flap! - Setup") {
    checkout scm
    sh "test_db_manager create flap ${env.BUILD_NUMBER}"
  }

  stage("Flap! - Build") {
    withBundler('ruby-2.5.0', 'flap') {
      try {
        withEnv(["DB_NAME=flap_${env.BUILD_NUMBER}", "DB_USER=flap_${env.BUILD_NUMBER}", "DB_PASS=flap_${env.BUILD_NUMBER}"]) {
          sh "cp deploy/application.ci.conf ./.env"
          sh "bundle install"
          sh "bundle exec rake db:test:prepare RAILS_ENV=test"
          sh "bundle exec rspec"
        }

        updateGitlabCommitStatus(name: 'Flap!', state: 'success')
      }
      catch(Exception e) {
        updateGitlabCommitStatus(name: 'Flap!', state: 'failed')
        throw e
      }
      finally {
        sh "test_db_manager delete flap ${env.BUILD_NUMBER}"
        deleteDir()
      }
    }
  }
}

def withBundler(version, gemset, cl) {
  withRvm(version, gemset) {
    sh "gem install bundler"
    cl()
  }
}

def withRvm(version, gemset, cl) {
  RVM_HOME='/home/jenkins/.rvm'

  paths = [
    "$RVM_HOME/gems/$version@$gemset/bin",
    "$RVM_HOME/gems/$version@global/bin",
    "$RVM_HOME/rubies/$version/bin",
    "$RVM_HOME/bin",
    "${env.PATH}"
  ]

  def path = paths.join(':')

  withEnv(["PATH=${env.PATH}:$RVM_HOME", "RVM_HOME=$RVM_HOME"]) {
    sh "set +x; source $RVM_HOME/scripts/rvm; rvm use --create --install --binary $version@$gemset"
  }

  withEnv([
      "PATH=$path",
      "GEM_HOME=$RVM_HOME/gems/$version@$gemset",
      "GEM_PATH=$RVM_HOME/gems/$version@$gemset:$RVM_HOME/gems/$version@global",
      "MY_RUBY_HOME=$RVM_HOME/rubies/$version",
      "IRBRC=$RVM_HOME/rubies/$version/.irbrc",
      "RUBY_VERSION=$version"
      ]) {
    cl()
  }
}
