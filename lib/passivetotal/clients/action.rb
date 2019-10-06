# frozen_string_literal: true

module PassiveTotal
  module Client
    class Action < Base
      #
      # Adds tags to a given artifact.
      # http://api.passivetotal.org/api/docs/#api-Actions-PostV2ActionsTags
      #
      # @param [String] query artifact for which to add tags
      # @param [Array<String>] tags tags to add to artifact
      #
      # @return [Hash]
      #
      def add_tags(query:, tags:)
        params = {
          query: query,
          tags: tags,
        }.compact

        _post("/actions/tags", params) { |json| json }
      end

      #
      # Removes tags from an artifact.
      # http://api.passivetotal.org/api/docs/#api-Actions-DeleteV2ActionsTags
      #
      # @param [String] query artifact from which to remove tags
      # @param [Array<String>] tags tags to remove from artifact
      #
      # @return [Hash]
      #
      def delete_tags(query:, tags:)
        params = {
          query: query,
          tags: tags,
        }.compact

        _delete("/actions/tags", params) { |json| json }
      end

      #
      # Retrieve classification statuses for given domains.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsBulkClassification
      #
      # @param [Array<String>] query domains for which to retrieve classification statuses
      #
      # @return [Hash]
      #
      def bulk_classification(*query)
        params = {
          query: query,
        }.compact

        _get("/actions/bulk/classification", params) { |json| json }
      end

      #
      # Retrieve classification status for a given domain.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsClassification
      #
      # @param [String] query domain for which to retrieve classification status
      #
      # @return [Hash]
      #
      def classification(query)
        params = {
          query: query,
        }.compact

        _get("/actions/classification", params) { |json| json }
      end

      #
      # Indicates whether or not a given domain has ever been compromised.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsEverCompromised
      #
      # @param [String] query domain to check for compromised status
      #
      # @return [Hash]
      #
      def ever_compromised(query)
        params = {
          query: query,
        }.compact

        _get("/actions/ever-compromised", params) { |json| json }
      end

      #
      # Indicates whether or not a domain's DNS records are updated via dynamic DNS.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsDynamicDns
      #
      # @param [String] query domain for which to retrieve dynamic DNS status
      #
      # @return [Hash]
      #
      def dynamic_dns(query)
        params = {
          query: query,
        }.compact

        _get("/actions/dynamic-dns", params) { |json| json }
      end

      #
      # Indicates whether or not a domain is monitored.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsMonitor
      #
      # @param [String] query domain for which to check for monitoring
      #
      # @return [Hash]
      #
      def monitor(query)
        params = {
          query: query,
        }.compact

        _get("/actions/monitor", params) { |json| json }
      end

      #
      # Indicates whether or not an IP address is a sinkhole.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsSinkhole
      #
      # @param [String] query IP address to check for sinkhole status
      #
      # @return [Hash]
      #
      def sinkhole(query)
        params = {
          query: query,
        }.compact

        _get("/actions/sinkhole", params) { |json| json }
      end

      #
      # Retrieves tags for a given artifact.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsTags
      #
      # @param [String] query artifact for which to retrieve tags
      #
      # @return [Hash]
      #
      def tags(query)
        params = {
          query: query,
        }.compact

        _get("/actions/tags", params) { |json| json }
      end

      #
      # Retrieve artifacts for a given tag.
      # http://api.passivetotal.org/api/docs/#api-Actions-GetV2ActionsTagsSearch
      #
      # @param [String] query tag for which to retrieve artifacts
      #
      # @return [Hash]
      #
      def search_by_tags(query)
        params = {
          query: query,
        }.compact

        _get("/actions/tags/search", params) { |json| json }
      end

      #
      # Set classification statuses for given domains.
      # http://api.passivetotal.org/api/docs/#api-Actions-PostV2ActionsBulkClassification
      #
      # @param [Arra<String>] queries domain for which to set classification status
      # @param [String] classification classification status to set for domain
      #
      # @return [Hash]
      #
      def set_bulk_classification(queries:, classification:)
        params = {
          queries: queries,
          classification: classification,
        }.compact

        _post("/actions/bulk/classification", params) { |json| json }
      end

      #
      # Sets the classification status for a given domain.
      # https://api.passivetotal.org/api/docs/#api-Actions-PostV2ActionsClassification
      #
      # @param [String] query domain for which to set classification status
      # @param [String] classification classification status to set for domain
      #
      # @return [Hash]
      #
      def set_classification(query:, classification:)
        params = {
          query: query,
          classification: classification,
        }.compact

        _post("/actions/classification", params) { |json| json }
      end

      #
      # Sets status for a domain to indicate if it has ever been compromised.
      # http://api.passivetotal.org/api/docs/#api-Actions-PostV2ActionsEverCompromised
      #
      # @param [String] query domain for which to set compromised status
      # @param [Boolean] status if the domain has ever been compromised
      #
      # @return [Hash]
      #
      def set_ever_compromised(query:, status:)
        params = {
          query: query,
          status: status,
        }.compact

        _post("/actions/ever-compromised", params) { |json| json }
      end

      #
      # Sets a domain's status to indicate whether or not its DNS records are updated via dynamic DNS.
      # http://api.passivetotal.org/api/docs/#api-Actions-PostV2ActionsDynamicDns
      #
      # @param [String] query domain for which to set dynamic DNS status
      # @param [Boolean] status if the domain's DNS records are updated via dynamic DNS
      #
      # @return [Hash]
      #
      def set_dynamic_dns(query:, status:)
        params = {
          query: query,
          status: status,
        }.compact

        _post("/actions/dynamic-dns", params) { |json| json }
      end

      #
      # Sets status for an IP address to indicate whether or not it is a sinkhole.
      # http://api.passivetotal.org/api/docs/#api-Actions-PostV2ActionsSinkhole
      #
      # @param [String] query IP address for which to set sinkhole status
      # @param [Boolean] status if the IP address is a sinkhole
      #
      # @return [Hash]
      #
      def set_sinkhole(query:, status:)
        params = {
          query: query,
          status: status,
        }.compact

        _post("/actions/sinkhole", params) { |json| json }
      end

      #
      # Sets the tags for a given artifact.
      # http://api.passivetotal.org/api/docs/#api-Actions-PutV2ActionsTags
      #
      # @param [String] query artifact for which to set tags
      # @param [Array<String>] tags tags to set for artifact
      #
      # @return [Hash]
      #
      def set_tags(query:, tags:)
        params = {
          query: query,
          tags: tags,
        }.compact

        _put("/actions/tags", params) { |json| json }
      end
    end
  end
end
