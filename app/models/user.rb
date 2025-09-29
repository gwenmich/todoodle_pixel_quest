class User < ApplicationRecord
  has_many :quests, dependent: :destroy
  has_many :tasks, through: :quests
  has_many :rewards, dependent: :destroy
end
