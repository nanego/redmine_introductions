module IntroductionsHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render "step_fields", f: builder
    end
    link_to(name, '#', class: "add_fields icon icon-add", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_intro_test(introduction)
    "#{request.protocol}#{request.host_with_port}#{introduction.test_url}?intro_id=#{introduction.id}"
  end

  def bottom_buttons(intro, step, params)
    "<div>
      <div class='replay_button_container'>
        #{link_to(l('replay'), '#', :onclick=> "#{params[:first_url] ? "location.href=\'#{params[:first_url]}\';" : 'location.reload();'}", class: 'introjs-button introjs-replay') if intro.introduction_steps.size > 1 && step == intro.introduction_steps.last }
      </div>
      <div class='skipbutton_container_left'>
        #{ form_for :update_last_view_date, url: introduction_update_last_view_date_path(intro), method: :post, :remote => true do |f|
            f.submit l("replay_later"), class: 'introjs-button introjs-quit', id: "introjs-quitButton"
          end }
          #{ content_tag :div, l('quit_tooltip'), class: "tooltipDelayIntro", style: "display: none;" }
          #{ form_for :do_not_show_again, url: introduction_do_not_show_again_path(intro), method: :post, :remote => true do |f|
            f.submit l(:button_confirm_do_not_show_intro), class: 'introjs-alwaysSkipButton alwaysSkip'
          end }
      </div>
    </div>"
  end

end
