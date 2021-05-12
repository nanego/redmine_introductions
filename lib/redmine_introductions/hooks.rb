require File.dirname(__FILE__) + '/../../app/helpers/introductions_helper'
include IntroductionsHelper

module RedmineIntroductions
  class Hooks < Redmine::Hook::ViewListener

    def view_layouts_base_html_head(context)
      stylesheet_link_tag("introjs", :plugin => "redmine_introductions") +
        stylesheet_link_tag("introductions", :plugin => "redmine_introductions") +
        javascript_include_tag("introjs", :plugin => "redmine_introductions") +
        javascript_include_tag("introductions", :plugin => "redmine_introductions")
    end

    # check if an introduction is active
    render_on :view_layouts_base_body_bottom, :partial => 'hooks/view_layouts_base_body_bottom_intro'

  end
end
