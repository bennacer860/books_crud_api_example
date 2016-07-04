class Book < ActiveRecord::Base
  validates :title, presence: true
  scope :finished, -> { where("finished_at is not null") }
end
