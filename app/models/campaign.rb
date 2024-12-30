class Campaign < ApplicationRecord
  belongs_to :user
  has_many :sessions, dependent: :destroy

  validates :title, presence: true
  validates :synopsis, presence: true

  PROGRESS = ["À Venir", "En Cours", "Terminée"]
  validates :progress, presence: true, inclusion: { in: PROGRESS }

  FORMAT = ["One-Shot", "Courte", "Longue"]
  validates :format, presence: true, inclusion: { in: FORMAT }

  validates :setting, presence: true
  # validates :players, presence: true
  # def player_list
  #   players.join(", ")
  # end
end
