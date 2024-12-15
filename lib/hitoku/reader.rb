# frozen_string_literal: true

module Hitoku
  class Reader
    attr_reader :encryptor

    def initialize(encryptor)
      @encryptor = encryptor
    end

    def read(filepath)
      encrypted_data = File.read(filepath).strip

      encryptor.decrypt_and_verify(encrypted_data)
    end
  end
end
