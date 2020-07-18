class Sport < ApplicationRecord
  validates :name, presence: name
  validates :slug, presence: true
  has_many :measurements
  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end
end
