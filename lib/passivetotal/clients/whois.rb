# frozen_string_literal: true

module PassiveTotal
  module Client
    class WHOIS < Base
      #
      # Retrieves the WHOIS data for the specified query
      # http://api.passivetotal.org/api/docs/#api-WHOIS-GetV2Whois
      #
      # @param [String] query the domain being queried
      # @param [String, nil] compact_record whether to compress the results
      # @param [String, nil] history whether to return historical results
      #
      # @return [Hash]
      #
      def get(query, compact_record: nil, history: nil)
        params = {
          query: query,
          compact_record: compact_record,
          history: history,
        }.compact

        _get("/whois", params) { |json| json }
      end

      #
      # Search WHOIS data for a keyword.
      # http://api.passivetotal.org/api/docs/#api-WHOIS-GetV2WhoisSearchKeyword
      #
      # @param [String] query being queried
      #
      # @return [Hash]
      #
      def keyword(query)
        params = {
          query: query,
        }.compact

        _get("/whois/search/keyword", params) { |json| json }
      end

      #
      # Searches WHOIS data by field and query.
      # http://api.passivetotal.org/api/docs/#api-WHOIS-GetV2WhoisSearch
      #
      # @param [String] query the value of the field being queried
      # @param [String] field the field to query
      #
      # @return [Hash]
      #
      def search(query:, field:)
        params = {
          query: query,
          field: field,
        }.compact

        _get("/whois/search", params) { |json| json }
      end
    end
  end
end
