# frozen_string_literal: true

RSpec.describe PassiveTotal::Client::Host, :vcr do
  let(:api) { PassiveTotal::API.new }

  let(:query) { "passivetotal.org" }

  describe "#components" do
    it do
      res = api.host.components(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#pairs" do
    it do
      res = api.host.pairs(query)
      expect(res).to be_a(Hash)
    end
  end
end
