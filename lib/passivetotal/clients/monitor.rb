# frozen_string_literal: true

module PassiveTotal
  module Client
    class Monitor < Base
      #
      # Retrieve all alerts associated with an artifact or project.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Monitor-GetV2Monitor
      #
      # @param [String, nil] project the project to filter on
      # @param [String, nil] artifact the artifact to filter on
      # @param [String, nll] start filter results to after this datetime
      # @param [String, nil] end filter results to before this datetime
      #
      # @return [Hash]
      #
      def alerts(project: nil, artifact: nil, start_at: nil, end_at: nil)
        params = {
          project: project,
          artifact: artifact,
          start: start_at,
          end: end_at,
        }.compact

        _get("/monitor", params) { |json| json }
      end
    end
  end
end
