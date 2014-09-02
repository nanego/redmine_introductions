require 'redmine'
require_dependency 'redmine_introductions/hooks'

Rails.application.config.to_prepare do
  require_dependency 'redmine_introductions/user_preference_patch'
end

Redmine::Plugin.register :redmine_introductions do
  name 'Redmine Introductions plugin'
  description 'This plugin add the ability to create better introductions for features with a step-by-step guide. It is based on the Intro.js project (http://usablica.github.io/intro.js/).'
  author 'Vincent ROBERT'
  version '0.1'
  requires_redmine_plugin :redmine_base_deface, :version_or_higher => '0.0.1'
  url 'https://github.com/nanego/redmine_introductions'
  author_url 'mailto:contact@vincent-robert.com'
  menu :admin_menu, :introductions, { :controller => 'introductions', :action => 'index' }, :caption => :introductions
end
