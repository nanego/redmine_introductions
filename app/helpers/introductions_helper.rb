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

end
