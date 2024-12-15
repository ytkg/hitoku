# frozen_string_literal: true

require 'active_support'
require_relative 'hitoku/cli'
require_relative 'hitoku/client'
require_relative 'hitoku/encryptor'
require_relative 'hitoku/reader'
require_relative 'hitoku/version'
require_relative 'hitoku/writer'

module Hitoku
  class << self
    def respond_to_missing?(method_name, include_private)
      client.get(method_name).present? || super
    end

    def method_missing(method_name, *args)
      client.get(method_name).presence || super
    end

    private

    def client
      Client.new
    end
  end
end
