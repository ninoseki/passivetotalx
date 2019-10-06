# frozen_string_literal: true

module PassiveTotal
  module Client
    class Base
      HOST = "api.passivetotal.org"
      VERSION = "v2"
      BASE_URL = "https://#{HOST}/#{VERSION}"

      def initialize(username:, api_key:)
        @username = username
        @api_key = api_key
      end

      private

      def url_for(path)
        URI(BASE_URL + path)
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def make_request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          response = http.request(req)

          code = response.code.to_i
          body = response.body
          json = JSON.parse(body)

          case code
          when 200
            yield json
          else
            error = json.dig("error") || body
            raise Error, "Unsupported response code returned: #{code} - #{error}"
          end
        end
      end

      def build_request(type: "GET", path:, params: {})
        uri = url_for(path)
        uri.query = URI.encode_www_form(params) if type == "GET"

        request = case type
                  when "GET"
                    Net::HTTP::Get.new(uri)
                  when "POST"
                    Net::HTTP::Post.new(uri)
                  when "PUT"
                    Net::HTTP::Put.new(path)
                  when "DELETE"
                    Net::HTTP::Delete.new(path)
                  else
                    raise ArgumentError, "#{type} HTTP method is not supported"
                  end

        request.body = JSON.generate(params) unless type == "GET"
        request.basic_auth @username, @api_key

        request
      end

      def _get(path, params = {}, &block)
        request = build_request(type: "GET", path: path, params: params)
        make_request(request, &block)
      end

      def _post(path, params = {}, &block)
        request = build_request(type: "POST", path: path, params: params)
        make_request(request, &block)
      end

      def _put(path, params = {}, &block)
        request = build_request(type: "PUT", path: path, params: params)
        make_request(request, &block)
      end

      def _delete(path, params = {}, &block)
        request = build_request(type: "DELETE", path: path, params: params)
        make_request(request, &block)
      end
    end
  end
end
