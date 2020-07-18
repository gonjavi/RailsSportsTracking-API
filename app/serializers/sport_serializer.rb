class SportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug

  has_many :measurements
end
