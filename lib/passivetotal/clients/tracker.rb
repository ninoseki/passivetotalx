# frozen_string_literal: true

module PassiveTotal
  module Client
    class Tracker < Base
      #
      # Retrieves hosts that employ user tracking mechanisms served from another given host.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Trackers-GetV2TrackersSearch
      #
      # @param [String] query host from which trackers originate
      # @param [String] type type of trackers to retrieve; a type other than the offically supported ones may be supplied
      #
      # @return [Hash]
      #
      def search(query:, type:)
        params = {
          query: query,
          type: type,
        }.compact

        _get("/trackers/search", params) { |json| json }
      end
    end
  end
end
