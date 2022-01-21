require 'rails_helper'

describe "delete an animal (from the database) route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20) }

  before { delete "/v1/animals/#{Animal.first.id}"}

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns a delete success message' do
    expect(JSON.parse(response.body)['message']).to eq("This animal has been deleted (from the database) successfully.")
  end
end