require 'rails_helper'

RSpec.describe Api::V1::SportsController, type: :controller do
  it { should route(:get, '/api/v1/sports').to(action: :index) }

  describe 'GET #index' do
    before { get :index }
  
    it { should respond_with(200) }
  end
end
