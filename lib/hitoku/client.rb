# frozen_string_literal: true

module Hitoku
  class Client
    def show
      read_credentials
    end

    def get(name)
      credentials = read_credentials

      credentials[name.to_sym]
    end

    def set(name, value)
      credentials = read_credentials

      write_credentials(credentials.merge({ name.to_sym => value }))
    end

    private

    def key
      return File.read('./hitoku.key').strip if File.exist?('./hitoku.key')

      ENV.fetch('HITOKU_KEY', nil)
    end

    def filepath
      'credentials.yml.enc'
    end

    def encryptor
      Encryptor.new(key)
    end

    def read_credentials
      reader = Reader.new(encryptor)

      reader.read(filepath)
    end

    def write_credentials(credentials)
      writer = Writer.new(encryptor)

      writer.write(filepath, credentials)
    end
  end
end
