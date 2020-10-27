require "rails_helper"

describe "get all groupss route", :type => :request do
  let!(:groups) { FactoryBot.create_list(:group, 20)}


  before { get "/groups" }
  after { Group.destroy_all }
  it "returns all messages" do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end