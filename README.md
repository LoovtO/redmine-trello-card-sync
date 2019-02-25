# Sync Redmine ticket to Trello card

## Setup

1. cd `${YOUR_REDMINE_HOME}/plugins`
1. `git clone https://github.com/LoovtO/redmine_trello_card_sync.git`
1. Change directory back to your Redmine installation. (`cd ${YOUR_REDMINE_HOME}`)
1. Run `bundle install --without development test` to install essential gems.
1. Run `bundle exec rake redmine:plugins:migrate RAILS_ENV=production` to setup plugin-related database tables. (In older version of Redmine, you may need to run `RAILS_ENV=production bundle exec rake redmine:plugins:migrate` instead)
1. Go to `http(s)://${YOUR_REDMINE_HOST}/settings/plugin/redmine_trello_card_sync`, enter the essential settings to enable this plugin.
    * Get your API key (32 characters long) & member token (64 characters long) from [here](https://trello.com/app-key), note they are *different*, one is the value of "Key", another is what you will get from the "Token" link.
1. Restart your Redmine server to take effect.

## Docker Specific
1. Official Docker image does not allow this plugin to build. My advice : do not use this plugin with Docker.
1. If you are using Docker and want to use this plugin, you have to
    * Install g++ make
    * Run setup commands.
1. On each upgrade, you will have to
    * Remove this plugin
    * Install g++ make
    * Run setup commands.

## Configuration

Enable this plugin module in each project's settings -> modules page, such as `http(s)://${YOUR_REDMINE_HOST}/projects/${YOUR_PROJECT}/settings/modules`.

Once you enable the module, you can configure mappings at `http(s)://${YOUR_REDMINE_HOST}/projects/${YOUR_PROJECT}/trello_card_sync/mappings`.

You can enter your Trello username at `http(s)://${YOUR_REDMINE_HOST}/my/account`.
