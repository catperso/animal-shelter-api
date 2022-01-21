require 'rails_helper'

describe 'get a random animal route', :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20) }

  before { get '/v1/animals/random'}

  it 'returns a single animal' do
    expect(JSON.parse(response.body).size).to eq(6)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

end