require_dependency 'principal'
require_dependency 'user'

class User < Principal
  has_many :introductions_users, :dependent => :destroy
end