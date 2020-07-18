require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, type: :controller do
  it { should route(:get, '/api/v1/measurements').to(action: :index) }
  it { should route(:post, '/api/v1/measurements').to(action: :create) }
  it { should route(:delete, '/api/v1/measurements/1').to(action: :destroy, id: 1) }
  it { should route(:patch, '/api/v1/measurements/1').to(action: :update, id: 1) }
  it { should route(:put, '/api/v1/measurements/1').to(action: :update, id: 1) }
end
