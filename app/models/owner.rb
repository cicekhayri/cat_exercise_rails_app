class Owner < ActiveRecord::Base
  has_many :cats
  accepts_nested_attributes_for :cats,:reject_if => lambda { |c| c[:name].blank? }
end
