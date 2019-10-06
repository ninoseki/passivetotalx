# frozen_string_literal: true

RSpec.describe PassiveTotal::Client::Tracker, :vcr do
  let(:api) { PassiveTotal::API.new }

  let(:query) { "facebook.com" }
  let(:type) { "FacebookId" }

  describe "#search" do
    it do
      res = api.tracker.search(query: query, type: type)
      expect(res).to be_a(Hash)
    end
  end
end
