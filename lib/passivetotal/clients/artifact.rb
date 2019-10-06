# frozen_string_literal: true

module PassiveTotal
  module Client
    class Artifact < Base
      #
      # Create artifacts in bulk.
      # http://api.passivetotal.org/api/docs/#api-Artifact-PutV2ArtifactBulk
      #
      # @param [Array<Hash>] artifacts a list of dictionaries that match the /v2/artifact interface (has query, type, tags, and project fields per dictionary)
      #
      # @return [Hash]
      #
      def bulk_create(artifacts)
        params = {
          artifacts: artifacts,
        }.compact

        _put("/artifact/bulk", params) { |json| json }
      end

      #
      # Delete artifacts in bulk.
      # http://api.passivetotal.org/api/docs/#api-Artifact-DeleteV2ArtifactBulk
      #
      # @param [Array<String>] artifacts the artifact ids to delete
      #
      # @return [Hash]
      #
      def bulk_delete(artifacts)
        params = {
          artifacts: artifacts,
        }.compact

        _delete("/artifact/bulk", params) { |json| json }
      end

      #
      # Perform artifact updates in bulk.
      # http://api.passivetotal.org/api/docs/#api-Artifact-PostV2ArtifactBulk
      #
      # @param [Array<Hash>] artifacts a list of dictionaries which match the fields for the /v2/artifact (artifact, monitor, tags)
      #
      # @return [Hash]
      #
      def bulk_update(artifacts)
        params = {
          artifacts: artifacts,
        }.compact

        _post("/artifact/bulk", params) { |json| json }
      end

      #
      # Create an artifact.
      # http://api.passivetotal.org/api/docs/#api-Artifact-PutV2Artifact
      #
      # @param [String] project the project id the artifact will live on
      # @param [String] query the actual artifact query (passivetotal.org, 8.8.8.8, etc).
      # @param [String, nil] type the type of the artifact (domain, ip, etc), or inferred by query string if domain or ip (optional).
      # @param [String, nil] tags the tags the new artifact will have
      #
      # @return [Hash]
      #
      def create(project:, query:, type: nil, tags: nil)
        params = {
          project: project,
          query: query,
          type: type,
          tags: tags,
        }.compact

        _put("/artifact", params) { |json| json }
      end

      #
      # Delete an artifact with a UUID.
      # http://api.passivetotal.org/api/docs/#api-Artifact-DeleteV2Artifact
      #
      # @param [String] artifact the artifact id
      #
      # @return [Hash]
      #
      def delete(artifact)
        params = {
          artifact: artifact,
        }.compact

        _delete("/artifact", params) { |json| json }
      end

      #
      # Read existing artifacts. If no filters are passed, this returns all your personal artifacts created by you or your organization.
      # http://api.passivetotal.org/api/docs/#api-Artifact-GetV2Artifact
      #
      # @param [String] artifact the artifact id
      # @param [String] project filter by project id
      # @param [String] owner filter by owner (an email or organization id)
      # @param [String] creator filter by creator
      # @param [String] organization filter by organization
      # @param [String] query filter by query (passivetotal.org, etc)
      # @param [String] type filter by artifact type (domain, ip, etc)
      #
      # @return [Hash]
      #
      def find(artifact: nil, project: nil, owner: nil, creator: nil, organization: nil, query: nil, type: nil)
        params = {
          artifact: artifact,
          project: project,
          owner: owner,
          creator: creator,
          organization: organization,
          query: query,
          type: type,
        }.compact

        _get("/artifact", params) { |json| json }
      end

      #
      # Update artifact, or toggle monitoring status. If you want to change the query or artifact type, simply delete it and create a new one. Use /v2/artifact/tag to add or delete tags without setting everything at once.
      # http://api.passivetotal.org/api/docs/#api-Artifact-PostV2Artifact
      #
      # @param [String] artifact the artifact id to update
      # @param [String, nil] monitor whether to monitor the artifact
      # @param [Array<String>, nil] tags sets the artifact's tags to this list
      #
      # @return [Hash]
      #
      def update(artifact, monitor: nil, tags: nil)
        params = {
          artifact: artifact,
          monitor: monitor,
          tags: tags,
        }.compact

        _post("/artifact", params) { |json| json }
      end
    end
  end
end
