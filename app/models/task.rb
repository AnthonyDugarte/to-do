class Task < ApplicationRecord
    validates :title, presence: true

    belongs_to :line
    has_one :project, through: :line
end
