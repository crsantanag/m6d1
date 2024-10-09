class Movie < ApplicationRecord
  belongs_to :client, optional: true

  include PgSearch::Model
  pg_search_scope :search_full_text,
  against: { name: "A" }

  validates :name,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..50, message: "debe tener entre 2 y 50 caracteres" }

  def to_s
    self.name
  end
end
