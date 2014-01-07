Deface::Override.new :virtual_path  => 'users/_preferences',
                     :name          => 'add-no-introductions-checkbox',
                     :insert_after => 'p:contains("warn_on_leaving_unsaved")',
                     :text          => '<p><%= pref_fields.check_box :no_introductions %></p>'
