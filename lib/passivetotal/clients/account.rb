# frozen_string_literal: true

module PassiveTotal
  module Client
    class Account < Base
      #
      # Read current account metadata and settings.
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2Account
      #
      #
      # @return [Hash]
      #
      def get
        _get("/account") { |json| json }
      end

      #
      # Read API usage history of the account.
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2AccountHistory
      #
      # @param [String, nil] source history type (api/ui), defaults to both
      #
      # @return [Hash]
      #
      def history(source = nil)
        params = {
          source: source
        }.compact

        _get("/account/history", params) { |json| json }
      end

      #
      # Get active monitors
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2AccountMonitors
      #
      #
      # @return [Hash]
      #
      def monitors
        _get("/account/monitors") { |json| json }
      end

      #
      # Read current organization metadata
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2AccountOrganization
      #
      #
      # @return [Hash]
      #
      def organization
        _get("/account/organization") { |json| json }
      end

      #
      # Read current account and organization quotas.
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2AccountQuotas
      #
      #
      # @return [Hash]
      #
      def quotas
        _get("/account/quotas") { |json| json }
      end

      #
      # Check sources being used for queries.
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2AccountSources
      #
      # @param [String, nil] source the source to filter on
      #
      # @return [Hash]
      #
      def sources(source: nil)
        params = {
          source: source
        }.compact

        _get("/account/sources", params) { |json| json }
      end

      #
      # Read team activity.
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2AccountOrganizationTeamstream
      #
      # @param [String, nil] source filter to this source
      # @param [String, nil] dt filter to this datetime
      # @param [String, nil] type filter by type field
      # @param [String, nil] focus filter by focus (domain, ip, etc)
      #
      # @return [Hash]
      #
      def teamstream(source: nil, dt: nil, type: nil, focus: nil)
        params = {
          source: source,
          dt: dt,
          type: type,
          focus: focus,
        }.compact

        _get("/account/organization/teamstream", params) { |json| json }
      end

      #
      # Retrieve items with the specified classification.
      # http://api.passivetotal.org/api/docs/#api-Account-GetV2AccountClassifications
      #
      # @param [String] classification classification for which to retrieve items for
      #
      # @return [Hash]
      #
      def classifications(classification)
        params = {
          classification: classification
        }.compact

        _get("/account/classifications", params) { |json| json }
      end
    end
  end
end
