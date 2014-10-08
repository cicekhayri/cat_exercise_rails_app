class Cat < ActiveRecord::Base
  belongs_to :owner
  validates :name, presence: true
  validates :birth_date, presence: { :message => "Should be a date"}

  mount_uploader :picture, CatPictureUploader

end
