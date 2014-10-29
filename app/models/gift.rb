class Gift < ActiveRecord::Base
  model_name.instance_variable_set(:@route_key, 'gift')
  belongs_to :nonprofit
  has_one :user, through: :nonprofit
  validates :body, presence: true
end
