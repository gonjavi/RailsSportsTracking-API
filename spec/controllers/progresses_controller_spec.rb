require 'rails_helper'

RSpec.describe Api::V1::ProgressesController, type: :controller do
  it { should route(:get, '/api/v1/progresses').to(action: :index) }

  describe 'GET #index' do
    before { get :index }

    it { should respond_with(200) }
  end
end
