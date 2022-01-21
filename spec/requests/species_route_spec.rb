require 'rails_helper'

describe "search for animals by species route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20) }

  it 'returns 20 cats' do
    get "/animals?species=cat"
    expect(JSON.parse(response.body).size).to eq(20)
    expect(response).to have_http_status(200)
  end

  it 'returns 0 dogs' do
    get "/animals?species=dog"
    expect(JSON.parse(response.body).size).to eq(0)
    expect(response).to have_http_status(200)
  end
end