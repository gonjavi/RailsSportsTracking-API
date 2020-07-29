class Sport < ApplicationRecord
  validates :name, presence: true
  has_many :measurements, dependent: :destroy
  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end
end
