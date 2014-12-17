class Bill < ActiveRecord::Base
  validates :title, presence: true
end
