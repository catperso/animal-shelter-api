require 'rails_helper'

describe 'post a pet route', :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20) }

  before { post '/animals', params: { name: 'Sir Bors', species: 'cat', age: '8'} }

  it 'returns the pet attributes' do
    expect(JSON.parse(response.body)['name']).to eq('Sir Bors')
    expect(JSON.parse(response.body)['species']).to eq('cat')
    expect(JSON.parse(response.body)['age']).to eq(8)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

end