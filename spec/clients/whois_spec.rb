# frozen_string_literal: true

RSpec.describe PassiveTotal::Client::WHOIS, :vcr do
  let(:api) { PassiveTotal::API.new }

  let(:query) { "passivetotal.org" }

  describe "#get" do
    it do
      res = api.whois.get(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#keyword" do
    let(:query) { "riskiq" }

    it do
      res = api.whois.keyword(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#search" do
    let(:query) { "domains@riskiq.com" }
    let(:field) { "email" }

    it do
      res = api.whois.search(query: query, field: field)
      expect(res).to be_a(Hash)
    end
  end
end
