class Boyfriend < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  has_many_attached :photos

  include PgSearch::Model
    pg_search_scope :search_by_name_and_ville,
      against: [:name, :ville],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
