require_dependency 'user_preference'

module RedmineIntroductions
  module UserPreferencePatch

    def no_introductions
      self[:no_introductions] || '0'
    end

    def no_introductions=(value)
      self[:no_introductions] = value
    end

  end
end

unless UserPreference.included_modules.include?(RedmineIntroductions::UserPreferencePatch)
  UserPreference.send(:include, RedmineIntroductions::UserPreferencePatch)
end
