# frozen_string_literal: true

require "passivetotal/version"

require "passivetotal/clients/base"

require "passivetotal/clients/account"
require "passivetotal/clients/action"
require "passivetotal/clients/artifact"
require "passivetotal/clients/base"
require "passivetotal/clients/dns"
require "passivetotal/clients/enrichment"
require "passivetotal/clients/host"
require "passivetotal/clients/monitor"
require "passivetotal/clients/project"
require "passivetotal/clients/ssl"
require "passivetotal/clients/tag"
require "passivetotal/clients/tracker"
require "passivetotal/clients/whois"
require "passivetotal/clients/host"

require "passivetotal/api"

module PassiveTotal
  class Error < StandardError; end
end
