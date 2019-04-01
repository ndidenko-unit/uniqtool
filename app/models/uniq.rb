class Uniq < ApplicationRecord
  validates :request, presence: true
  validates :result, presence: true

end
