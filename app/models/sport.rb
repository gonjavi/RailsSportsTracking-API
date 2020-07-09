# frozen_string_literal: true

class Sport < ApplicationRecord
  has_many :measurements
  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end
end
