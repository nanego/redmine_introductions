require 'redmine'
require_dependency 'redmine_introductions/hooks'

Redmine::Plugin.register :redmine_introductions do
  name 'Redmine Introductions plugin'
  description 'This plugin add the ability to create better introductions for features with a step-by-step guide. It is based on the Intro.js project (http://usablica.github.io/intro.js/).'
  author 'Vincent ROBERT'
  version '0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'mailto:contact@vincent-robert.com'
  menu :admin_menu, :introductions, { :controller => 'introductions', :action => 'index' }, :caption => :introductions
end
