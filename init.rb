require 'redmine'
require_dependency 'redmine_introductions/hooks'
require_dependency 'redmine_introductions/user_preference_patch'

# Little hack for deface in redmine:
# - redmine plugins are not railties nor engines, so deface overrides are not detected automatically
# - deface doesn't support direct loading anymore ; it unloads everything at boot so that reload in dev works
# - hack consists in adding "app/overrides" path of the plugin in Redmine's main #paths
Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)

Redmine::Plugin.register :redmine_introductions do
  name 'Redmine Introductions plugin'
  description 'This plugin add the ability to create better introductions for features with a step-by-step guide. It is based on the Intro.js project (http://usablica.github.io/intro.js/).'
  author 'Vincent ROBERT'
  version '0.1'
  url 'https://github.com/nanego/redmine_introductions'
  author_url 'mailto:contact@vincent-robert.com'
  menu :admin_menu, :introductions, { :controller => 'introductions', :action => 'index' }, :caption => :introductions
end
