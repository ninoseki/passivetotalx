# frozen_string_literal: true

module PassiveTotal
  class API
    attr_reader :username
    attr_reader :api_key

    def initialize(username: ENV["PASSIVETOTAL_USERNAME"], api_key: ENV["PASSIVETOTAL_API_KEY"])
      @username = username
      raise ArgumentError, "No usernamme has been found or provided!" unless @username

      @api_key = api_key
      raise ArgumentError, "No api key has been found or provided!" unless @api_key
    end

    def account
      @account ||= Client::Account.new(username: username, api_key: api_key)
    end

    def action
      @action ||= Client::Action.new(username: username, api_key: api_key)
    end

    def artifact
      @artifact ||= Client::Artifact.new(username: username, api_key: api_key)
    end

    def base
      @base ||= Client::Base.new(username: username, api_key: api_key)
    end

    def dns
      @dns ||= Client::DNS.new(username: username, api_key: api_key)
    end

    def enrichment
      @enrichment ||= Client::Enrichment.new(username: username, api_key: api_key)
    end

    def host
      @host ||= Client::Host.new(username: username, api_key: api_key)
    end

    def monitor
      @monitor ||= Client::Monitor.new(username: username, api_key: api_key)
    end

    def project
      @project ||= Client::Project.new(username: username, api_key: api_key)
    end

    def ssl
      @ssl ||= Client::SSL.new(username: username, api_key: api_key)
    end

    def tag
      @tag ||= Client::Tag.new(username: username, api_key: api_key)
    end

    def tracker
      @tracker ||= Client::Tracker.new(username: username, api_key: api_key)
    end

    def whois
      @whois ||= Client::WHOIS.new(username: username, api_key: api_key)
    end
  end
end
