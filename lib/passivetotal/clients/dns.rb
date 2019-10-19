# frozen_string_literal: true

module PassiveTotal
  module Client
    class DNS < Base
      #
      # Retrieves the passive DNS results from active account sources.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Passive_DNS-GetV2DnsPassive
      #
      # @param [String] query the domain or IP being queried
      # @param [String] start the start datetime
      # @param [String] end the end datetime
      # @param [String] timeout timeout to use for external resources
      #
      # @return [Hash]
      #
      def passive(query, start_at: nil, end_at: nil, timeout: 7)
        params = {
          query: query,
          start: start_at,
          end: end_at,
          timeout: timeout,
        }.compact

        _get("/dns/passive", params) { |json| json }
      end

      #
      # Retrieves the unique passive DNS results from active account sources.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Passive_DNS-GetV2DnsPassiveUnique
      #
      # @param [String] query the domain or IP being queried
      #
      # @return [Hash]
      #
      def passive_unique(query)
        params = {
          query: query,
        }.compact

        _get("/dns/passive/unique", params) { |json| json }
      end

      #
      # Searches the Passive DNS data for a keyword query.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Passive_DNS-GetV2DnsSearchKeyword
      #
      # @param [String] query query
      #
      # @return [Hash]
      #
      def search(query)
        params = {
          query: query
        }.compact

        _get("/dns/search/keyword", params) { |json| json }
      end
    end
  end
end
