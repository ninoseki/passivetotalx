# frozen_string_literal: true

module PassiveTotal
  module Client
    class Project < Base
      #
      # Add project tags.
      # http://api.passivetotal.org/api/docs/#api-Project-PostV2ProjectTag
      #
      # @param [String] project the project id to update
      # @param [String] tags the tags or tag to add (list or str)
      #
      # @return [Hash]
      #
      def add_tags(project, tags)
        params = {
          project: project,
          tags: tags,
        }.compact

        _get("/project/tag", params) { |json| json }
      end

      #
      # Create a new project
      # http://api.passivetotal.org/api/docs/#api-Project-PutV2Project
      #
      # @param [String] name name of the project
      # @param [String] visibility the visibility
      # @param [String, nil] description the description
      # @param [String, nil] featured whether to feature the project
      # @param [String, nil] tags sets the project's tags to this list
      #
      # @return [Hash]
      #
      def create(name, visibility:, description: nil, featured: nil, tags: nil)
        params = {
          name: name,
          visibility: visibility,
          description: description,
          featured: featured,
          tags: tags,
        }.compact

        _put("/project", params) { |json| json }
      end

      #
      # Delete project
      # http://api.passivetotal.org/api/docs/#api-Project-DeleteV2Project
      #
      # @param [String] project the project id to delete
      #
      # @return [Hash]
      #
      def delete(project)
        params = {
          project: project,
        }.compact

        _delete("/project", params) { |json| json }
      end

      #
      # Retrieves a project or projects by search filter
      # http://api.passivetotal.org/api/docs/#api-Project-GetV2Project
      #
      # @param [String, nil] project filter by project id
      # @param [String, nil] owner filter by owner (an email or organization id)
      # @param [String, nil] creator filter by creator email
      # @param [String, nil] organization filter by organization
      # @param [String, nil] visibility filter by visibility
      # @param [String, nil] featured filter by featured status
      #
      # @return [Hash]
      #
      def get(project: nil, owner: nil, creator: nil, organization: nil, visibility: nil, featured: nil)
        params = {
          project: project,
          owner: owner,
          creator: creator,
          organization: organization,
          visibility: visibility,
          featured: featured,
        }.compact

        _get("/project", params) { |json| json }
      end

      #
      # Remove project tags.
      # http://api.passivetotal.org/api/docs/#api-Project-DeleteV2ProjectTag
      #
      # @param [String] project the project id to update
      # @param [Array<String>] tags the tags or tag to remove (list or str)
      #
      # @return [Hash]
      #
      def remove_tags(project, tags)
        params = {
          project: project,
          tags: tags,
        }.compact

        _delete("/project/tag", params) { |json| json }
      end

      #
      # Set project tags.
      # http://api.passivetotal.org/api/docs/#api-Project-PutV2ProjectTag
      #
      # @param [String] project the project id to update
      # @param [Array<String>] tags the tags or tag to set to (list or str)
      #
      # @return [Hash]
      #
      def set_tags(project, tags)
        params = {
          project: project,
          tags: tags,
        }.compact

        _put("/project/tag", params) { |json| json }
      end

      #
      # Updates a project denoted by project ID
      # http://api.passivetotal.org/api/docs/#api-Project-PostV2Project
      #
      # @param [String] project the project id to update
      # @param [String, nil] name the new name
      # @param [String, nil] description the new description
      # @param [String, nil] visibility ,"private","analyst"] the new visibility
      # @param [String, nil] featured whether to feature the project
      # @param [String, nil] tags sets the project's tags to this list
      #
      # @return [Hash]
      #
      def update(project, name: nil, description: nil, visibility: nil, featured: nil, tags: nil)
        params = {
          project: project,
          name: name,
          description: description,
          visibility: visibility,
          featured: featured,
          tags: tags,
        }.compact

        _post("/project", params) { |json| json }
      end
    end
  end
end
