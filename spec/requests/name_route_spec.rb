require 'rails_helper'

describe "search for animals by name route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20) }

  before { post '/animals', params: { name: 'Sir Bors', species: 'cat', age: '8'} }

  before { get "/animals?name=bors" }

  it 'returns all animals with Bors in their name' do
    expect(JSON.parse(response.body).first['name']).to eq('Sir Bors')
  end

  it 'returns with 200 status' do
    expect(response).to have_http_status(200)
  end
end