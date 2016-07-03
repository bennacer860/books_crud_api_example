class Book < ActiveRecord::Base
  scope :finished, -> { where("finished_at is not null") }
end
