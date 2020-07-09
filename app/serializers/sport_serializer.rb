# frozen_string_literal: true

class SportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug

  has_many :measurements
end
