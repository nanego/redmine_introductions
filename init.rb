require 'redmine'
require_relative 'lib/redmine_introductions/hooks'

Redmine::Plugin.register :redmine_introductions do
  name 'Redmine Introductions plugin'
  description 'This plugin add the ability to create better introductions for features with a step-by-step guide. It is based on the Intro.js project (http://usablica.github.io/intro.js/).'
  author 'Vincent ROBERT'
  version '5.0.0'
  requires_redmine_plugin :redmine_base_deface, :version_or_higher => '0.0.1'
  url 'https://github.com/nanego/redmine_introductions'
  author_url 'mailto:contact@vincent-robert.com'
  menu :admin_menu, :introductions, {:controller => 'introductions', :action => 'index'},
       :caption => :introductions,
       :html => {:class => 'icon'}
  settings :partial => 'settings/introductions_settings',
           :default => {
               'display_issue_update_warning' => '0',
               'issue_update_warning' => "Merci d'actualiser le statut et l'assignation avant d'enregistrer vos modifications.",
           }
end

# Support for Redmine 5
if Redmine::VERSION::MAJOR < 6
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
