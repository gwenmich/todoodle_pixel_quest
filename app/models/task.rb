class Task < ApplicationRecord
  belongs_to :quest
  validates :title, presence: true
end
