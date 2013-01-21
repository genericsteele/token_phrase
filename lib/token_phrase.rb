require "token_phrase/dictionary"
require "token_phrase/generator"
require "token_phrase/version"

module TokenPhrase
  def self.generate *args
    Generator.new(*args).generate
  end

  def self.permutations *args
    Generator.new(*args).permutations
  end
end

