require "rails_helper"

describe "get all messages route", :type => :request do
  # group = FactoryBot.build(:group_with_messages)
  let!(:group) { FactoryBot.create(:group_with_messages)}
  



  before { get "/groups/#{group.id}/messages" }

  after { Group.destroy_all }

  it "returns one group" do
  #  binding.pry
    expect(JSON.parse(response.body).size).to eq(5)
   
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end