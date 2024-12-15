# frozen_string_literal: true

module Hitoku
  class Encryptor < ActiveSupport::MessageEncryptor
    def initialize(key)
      super([key].pack('H*'))
    end
  end
end
