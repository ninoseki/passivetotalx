# frozen_string_literal: true

RSpec.describe PassiveTotal::Client::DNS, :vcr do
  let(:api) { PassiveTotal::API.new }

  let(:query) { "passivetotal.org" }

  describe "#passive" do
    it do
      res = api.dns.passive(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#passive_unique" do
    it do
      res = api.dns.passive_unique(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#search" do
    let(:query) { "passivetotal" }

    it do
      res = api.dns.search(query)
      expect(res).to be_a(Hash)
    end
  end
end
