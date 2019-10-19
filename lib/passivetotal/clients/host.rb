# frozen_string_literal: true

module PassiveTotal
  module Client
    class Host < Base
      #
      # Retrieves the host attribute components of a query.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Host_Attributes-GetV2HostAttributesComponents
      #
      # @param [String] query
      # @param [String, nil] start_at
      # @param [String, nil] end_at
      #
      # @return [Hash]
      #
      def components(query, start_at: nil, end_at: nil)
        params = {
          query: query,
          start: start_at,
          end: end_at,
        }.compact

        _get("/host-attributes/components", params) { |json| json }
      end

      #
      # Retrieves the host attribute pairs related to the query.
      #
      # @see https://api.passivetotal.org/api/docs/#api-Host_Attributes-GetV2HostAttributesComponents
      #
      # @param [String] query
      # @param [String] direction
      # @param [String] start_at
      # @param [String] end_at
      #
      # @return [Hash]
      #
      def pairs(query, direction: "children", start_at: nil, end_at: nil)
        params = {
          query: query,
          direction: direction,
          start: start_at,
          end: end_at,
        }.compact

        _get("/host-attributes/pairs", params) { |json| json }
      end

      #
      # Retrieves the host attribute trackers
      #
      # @see https://api.passivetotal.org/api/docs/#api-Host_Attributes-GetV2HostAttributesTrackers
      #
      # @param [String] query
      # @param [String, nil] start_at
      # @param [String, nil] end_at
      #
      # @return [Hash]
      #
      def trackers(query, start_at: nil, end_at: nil)
        params = {
          query: query,
          start: start_at,
          end: end_at,
        }.compact

        _get("/host-attributes/trackers", params) { |json| json }
      end
    end
  end
end
