# frozen_string_literal: true

module PassiveTotal
  module Client
    class SSL < Base
      #
      # Retrieves the SSL certificate history for a given certificate SHA-1 hash or IP address.
      #
      # @see http://api.passivetotal.org/api/docs/#api-SSL_Certificates-GetV2SslCertificateHistory
      #
      # @param [String] query SHA-1 hash or associated IP address for which to retrieve certificate history
      #
      # @return [Hash]
      #
      def history(query)
        params = {
          query: query,
        }.compact

        _get("/ssl-certificate/history", params) { |json| json }
      end

      #
      # Retrieves an SSL certificate by its SHA-1 hash.
      #
      # @see http://api.passivetotal.org/api/docs/#api-SSL_Certificates-GetV2SslCertificate
      #
      # @param [String] query SHA-1 hash of the certificate to retrieve
      #
      # @return [Hash]
      #
      def get(query)
        params = {
          query: query,
        }.compact

        _get("/ssl-certificate", params) { |json| json }
      end

      #
      # Retrieves SSL certificates for a given keyword.
      #
      # @see http://api.passivetotal.org/api/docs/#api-SSL_Certificates-GetV2SslCertificateSearchKeyword
      #
      # @param [String] query keyword on which to search
      #
      # @return [Hash]
      #
      def keyword(query)
        params = {
          query: query,
        }.compact

        _get("/ssl-certificate/search/keyword", params) { |json| json }
      end

      #
      # Retrieves SSL certificates for a given field value.
      #
      # @see http://api.passivetotal.org/api/docs/#api-SSL_Certificates-GetV2SslCertificateSearch
      #
      # @param [String] query field value for which to search
      # @param [String] field field by which to search
      #
      # @return [Hash]
      #
      def search(query:, field:)
        params = {
          field: field,
          query: query,
        }.compact

        _get("/ssl-certificate/search", params) { |json| json }
      end
    end
  end
end
