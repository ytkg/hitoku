# frozen_string_literal: true

module Hitoku
  class Writer
    attr_reader :encryptor

    def initialize(encryptor)
      @encryptor = encryptor
    end

    def write(filepath, data)
      File.write(filepath, encryptor.encrypt_and_sign(data))
    end
  end
end
