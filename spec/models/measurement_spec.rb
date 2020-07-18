require 'rails_helper'

RSpec.describe Measurement, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:time) }
    it { should belong_to(:sport).class_name('Sport') }
  end
end
