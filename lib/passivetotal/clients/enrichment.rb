# frozen_string_literal: true

module PassiveTotal
  module Client
    class Enrichment < Base
      #
      # Get enrichment data for a query
      # http://api.passivetotal.org/api/docs/#api-Enrichment-GetV2Enrichment
      #
      # @param [String] query the domain or IP being queried
      #
      # @return [Hash]
      #
      def get(query)
        params = {
          query: query,
        }.compact

        _get("/enrichment", params) { |json| json }
      end

      #
      # Get malware data for a query
      # http://api.passivetotal.org/api/docs/#api-Enrichment-GetV2EnrichmentMalware
      #
      # @param [String] query the domain or IP being queried
      #
      # @return [Hash]
      #
      def malware(query)
        params = {
          query: query,
        }.compact

        _get("/enrichment/malware", params) { |json| json }
      end

      #
      # Get osint data for a query
      # http://api.passivetotal.org/api/docs/#api-Enrichment-GetV2EnrichmentOsint
      #
      # @param [String] query the domain or IP being queried
      #
      # @return [Hash]
      #
      def osint(query)
        params = {
          query: query,
        }.compact

        _get("/enrichment/osint", params) { |json| json }
      end

      #
      # Get subdomains data for a query
      # http://api.passivetotal.org/api/docs/#api-Enrichment-GetV2EnrichmentSubdomains
      #
      # @param [String] query the domain being queried
      #
      # @return [Hash]
      #
      def subdomains(query)
        params = {
          query: query,
        }.compact

        _get("/enrichment/subdomains", params) { |json| json }
      end

      #
      # Get bulk enrichment data for many queries
      # http://api.passivetotal.org/api/docs/#api-Bulk_Enrichment-GetV2EnrichmentBulk
      #
      # @param [Array<String>] query the domains and IPs being queried
      #
      # @return [Hash]
      #
      def bulk_data(*query)
        params = {
          query: query,
        }.compact

        _get("/enrichment/bulk", params) { |json| json }
      end

      #
      # Get bulk malware data for many queries
      # http://api.passivetotal.org/api/docs/#api-Bulk_Enrichment-GetV2EnrichmentBulkMalware
      #
      # @param [Array<String>] query the domains and IPs being queried
      #
      # @return [Hash]
      #
      def bulk_malware(*query)
        params = {
          query: query,
        }.compact

        _get("/enrichment/bulk/malware", params) { |json| json }
      end

      #
      # Get bulk osint data for many queries
      # http://api.passivetotal.org/api/docs/#api-Bulk_Enrichment-GetV2EnrichmentBulkOsint
      #
      # @param [Array<String>] query the domains and IPs being queried
      #
      # @return [Hash]
      #
      def bulk_osint(*query)
        params = {
          query: query,
        }.compact

        _get("/enrichment/bulk/osint", params) { |json| json }
      end
    end
  end
end
