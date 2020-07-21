require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, type: :controller do
  it { should route(:get, '/api/v1/measurements').to(action: :index) }
  it { should route(:post, '/api/v1/measurements').to(action: :create) }
  it { should route(:delete, '/api/v1/measurements/1').to(action: :destroy, id: 1) }

  describe 'GET #index' do
    before { get :index }

    it { should respond_with(200) }
  end

  it { should use_before_action(:set_measurement) }

  it do
    params = {
      measurement: {
        id: 1,
        params: {
          time: '00:30',
          date: '22/05/2020',
          sport_id: 1
        }
      }
    }
    should permit(:time, :date, :sport_id)
      .for(:create, params: params)
      .on(:measurement)
  end
end
