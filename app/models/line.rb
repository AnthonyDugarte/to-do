class Line < ApplicationRecord
    validates :name, presence: true

    has_many :tasks, dependent: :destroy
end
