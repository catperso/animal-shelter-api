require 'rails_helper'

describe 'update an animal route', :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20) }

  before { put "/animals/#{Animal.first.id}", params: { name: 'Snot Bakula', species: 'cat', age: '2' } }

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns an update status message' do
    expect(JSON.parse(response.body)['message']).to eq('This pet has been updated successfully.')
  end

  it 'should have updated attributes' do
    expect(Animal.first.name).to eq("Snot Bakula")
    expect(Animal.first.species).to eq("cat")
    expect(Animal.first.age).to eq(2)
  end
end