# frozen_string_literal: true

module PassiveTotal
  module Client
    class Tag < Base
      #
      # Retrieve the tags of an artifact or artifacts.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Tag_Artifact-GetV2ArtifactTag
      #
      # @param [String] artifact the artifact id or ids to list
      #
      # @return [Hash]
      #
      def get(artifact)
        params = {
          artifact: artifact,
        }.compact

        _get("/artifact/tag", params) { |json| json }
      end

      #
      # Remove a set of tags from an artifact or artifacts.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Tag_Artifact-DeleteV2ArtifactTag
      #
      # @param [String] artifact the artifact id or ids to update
      # @param [Array<String>] tags the tags or tag to delete (list or str)
      #
      # @return [Hash]
      #
      def delete(artifact, tags)
        params = {
          artifact: artifact,
          tags: tags,
        }.compact

        _delete("/artifact/tag", params) { |json| json }
      end

      #
      # Set the tags of an artifact or artifacts.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Tag_Artifact-PutV2ArtifactTag
      #
      # @param [String] artifact the artifact id or ids to update
      # @param [Array<String>] tags the tags or tag to set (list or str)
      #
      # @return [Hash]
      #
      def set(artifact, tags)
        params = {
          artifact: artifact,
          tags: tags,
        }.compact

        _put("/artifact/tag", params) { |json| json }
      end

      #
      # Add tags to an artifact or artifacts.
      #
      # @see http://api.passivetotal.org/api/docs/#api-Tag_Artifact-PostV2ArtifactTag
      #
      # @param [String] artifact the artifact id or ids to update
      # @param [Array<String>] tags the tags or tag to add (list or str)
      #
      # @return [Hash]
      #
      def update(artifact, tags)
        params = {
          artifact: artifact,
          tags: tags,
        }.compact

        _post("/artifact/tag", params) { |json| json }
      end
    end
  end
end
