class Cat < ActiveRecord::Base
  validates :name, presence: true
  validates :birth_date, presence: { :message => "Should be a date"}
end
