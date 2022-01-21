require 'rails_helper'

describe "get all animals route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 9) }

  it 'returns all animals' do
    get '/animals'
    expect(JSON.parse(response.body).size).to eq(9)
  end

  it 'returns the first 5 animals' do
    get '/animals?page=1'
    expect(JSON.parse(response.body).size).to eq(5)
  end

  it 'returns the last 4 animals' do
    get '/animals?page=2'
    expect(JSON.parse(response.body).size).to eq(4)
  end

  it 'returns status code 200' do
    get '/animals'
    expect(response).to have_http_status(:success)
  end

end