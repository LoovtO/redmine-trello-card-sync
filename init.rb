require 'redmine'
require 'active_support/dependencies'

ActiveSupport::Reloader.to_prepare do
  require 'concerns/trello_card_sync_project_extension'
  require 'redmine_trello_card_sync/hooks'
  require 'redmine_trello_card_sync/view_hooks'
  require 'redmine_trello_card_sync/patches'
  Project.send :include, TrelloCardSyncProjectExtension
  Project.send :include, TrelloCardSync::Patches::ProjectPatch
  User.send :include, TrelloCardSync::Patches::UserPatch
end

Redmine::Plugin.register :redmine_trello_card_sync do
  name 'Trello card sync plugin'
  author 'Sébastien Le Lourec'
  description 'Sync Redmine ticket to Trello card'
  version '2.0.0'
  url 'https://github.com/LoovtO/redmine-trello-card-sync/'
  author_url 'https://www.loovto.net/'
  requires_redmine version_or_higher: '4.0.1'

  settings default: { public_key: '', member_token: '', api_secret: '', webhooks_url: '' }, partial: 'settings/trello_sync_settings'

  project_module :trello_card_sync do
    permission :view_mappings,       mappings: [:index]
    permission :edit_mappings,       mappings: [:index, :save]
  end

  menu :project_menu, :mappings, { controller: 'mappings', action: 'index' }, caption: :trello_card_sync_title, before: :settings, param: :project_id
end
