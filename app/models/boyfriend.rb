class Boyfriend < ApplicationRecord
  geocoded_by :ville
  after_validation :geocode, if: :will_save_change_to_ville?
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :ville, presence: true
  validates :age, presence: true
  validates :description, presence: true
  validates :name, presence: true, uniqueness: true
  has_many_attached :photos
  include PgSearch::Model
    pg_search_scope :search_by_name_and_ville,
      against: [:name, :ville],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
