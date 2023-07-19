require_dependency 'principal'
require_dependency 'user'

module RedmineIntroductions
  module UserPatch

      def self.included(base)
        base.class_eval do
          unloadable

          has_many :introductions_users, :dependent => :destroy
        end
      end

  end
end

unless User.included_modules.include?(RedmineIntroductions::UserPatch)
  User.send(:include, RedmineIntroductions::UserPatch)
end
