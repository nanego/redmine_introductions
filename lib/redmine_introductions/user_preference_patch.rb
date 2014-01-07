require_dependency 'user_preference'

class UserPreference

  def no_introductions; self[:no_introductions] || '0'; end
  def no_introductions=(value); self[:no_introductions]=value; end

end
