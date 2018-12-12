class Introduction < ActiveRecord::Base
  include Redmine::SafeAttributes

  POSITIONS = {l('bottom') => 'bottom',
               l('top') =>'top',
               l('left') =>'left',
               l('right') =>'right'}

  safe_attributes :name, :url, :start_at, :stop_at, :introduction_steps_attributes, :test_url

  validates_presence_of :name

  has_many :introduction_steps, :dependent => :destroy
  accepts_nested_attributes_for :introduction_steps, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => true

  has_many :introductions_users
  has_many :users, through: :introductions_users

  scope :active, -> { where("(start_at = NULL OR start_at <= ?) AND (stop_at = NULL OR stop_at >= ?)", DateTime.now, DateTime.now ) }

  def self.not_disabled_by_user(user)
    where("")
  end

end
