class Session < ApplicationRecord
  belongs_to :campaign

  validates :date, presence: true
  validates :summary, presence: true

end
