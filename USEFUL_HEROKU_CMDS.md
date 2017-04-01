# Heroku commands

### Dynos
- Running list ``heroku ps``
- Scaling ``heroku ps:scale web=<NUMBER_OF_DYNOS>``
- Bash ``heroku run bash``

### Develop
- Run local ``heroku local``

### Env Config
- List ``heroku config``
- New env var ``heroku config:set <KEY>=<VALUE>``

### Deploy
- push to heroku ``git push heroku master``

### Addons
- Addons list ``heroku addons``
- Papertrail log console ``heroku addons:open papertrail``

### Remote
- rails console on remote ``heroku run rails console``
- remote migrate ``heroku run rake db:migrate``
- postgres console ``heroku pg:psql``

#### Releases
- Release list ``heroku releases``
- Rollback ``heroku releases:rollback v102``