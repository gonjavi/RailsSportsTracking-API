require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, type: :controller do
  it { should route(:get, '/api/v1/measurements').to(action: :index) }
  it { should route(:post, '/api/v1/measurements').to(action: :create) }
  it { should route(:delete, '/api/v1/measurements/1').to(action: :destroy, id: 1) }

  let(:sport) { Sport.create({name: "Wrestling"}) }
  let(:valid_attributes) { { time: '00:40', date: '22/05/2020', sport_id: sport.id } }
  let(:invalid_attributes) { { time: '', date: '', sport_id: nil } }

  describe 'GET #index' do
    before { get :index }

    it { should respond_with(200) }
  end

  it { should use_before_action(:set_measurement) }

  describe 'POST #create' do
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

    it 'creates a new Measurement' do
      expect do
        post :create, params: { measurement: valid_attributes }
      end.to change(Measurement, :count).by(1)
      expect(response).to have_http_status(200)
    end

    it 'it fails to create a new Measurement' do
      expect do
        post :create, params: { measurement: invalid_attributes }
      end.to change(Measurement, :count).by(0)
      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE #destroy' do
    it 'it deletes a measurement' do
      @measurement = FactoryBot.create(:measurement)
      expect do
        delete 'destroy', params: { id: @measurement.id }
      end.to change(Measurement, :count).by(-1)
      expect(response).to have_http_status(204)
    end

    it 'it fails deletes a measurement' do
      expect do
        delete 'destroy', params: { id: 2 }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
