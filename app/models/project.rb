class Project < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :lines, dependent: :destroy
  has_many :tasks, through: :lines
end
