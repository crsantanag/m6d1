class Client < ApplicationRecord
  has_many :movies, dependent: :restrict_with_error

  include PgSearch::Model
  pg_search_scope :search_full_text,
  against: { name: "A" }

  validates :name,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..50, message: "debe tener entre 2 y 50 caracteres" }

  validates :age, 
  presence: { message: "No puede estar vacío" }, 
  numericality: { greater_than: 0, message: "debe ser mayor que 0" }

end
