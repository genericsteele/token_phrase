require "token_phrase/version"

module TokenPhrase
  Adjectives = %w(splendid superior spectacular amazing ultimate ferocious exciting lovely old-fashioned home-made grass-fed free-range grandmas grandpas governing prickly strong stellar awesome wonderful bodacious excellent stupendous groovy dancing energetic sweet sour sugarfilled glazed vegan letterman thunderous established magnetic better windy wind-up american soft genetically-modified tailored liberal conservative bluetooth)
  Colors = %w(red yellow blue green violet taupe mauve lime golden silver grey black white tangello sunshine brown tan infrared ultraviolet pink beige)
  Patterns = %w(striped checked spotted polka-dotted plaid wavy houndstooth argyle glossy matte pinstriped)
  Nouns = %w(floutist carpenter jacket president address machine computer mug lamp phone wall bicycle river lake fountain building book hat pants shirt cape soup gloves pen suit photograph sand profit energy fork compact-disk floppy-disk chandelier door window laboratory people tapir wolverine wolf spider wolf-spider spider-wolf banana-slug giraffe deer-mouse capybara dingo dragon cardinal owl octopus elk moose weasel elephant rhino iguana bullfrog greyhound stickbug ladybug ant rat coyote chimpanzee housecat barracuda raven crane fox panda racoon nessie whale dolphin shark viper frog toad flounder skunk wookie dishwasher bat space-heater bobble-head lego-set pinboard flag tv video-game envelope headphones mousepad jukebox)
  
  def self.adjectives
    TokenPhrase::Adjectives
  end
  
  def self.colors
    TokenPhrase::Colors
  end
  
  def self.patterns
    TokenPhrase::Patterns
  end
  
  def self.nouns
    TokenPhrase::Nouns
  end
  
  def self.generate(separator = nil, parts = {})
    if separator.is_a?(Hash)
      parts = separator
      separator = nil
    end
    parts[:adjectives] ||= TokenPhrase::Adjectives
    parts[:colors] ||= TokenPhrase::Colors
    parts[:patterns] ||= TokenPhrase::Patterns
    parts[:nouns] ||= TokenPhrase::Nouns
    phrase = [parts[:adjectives].sample, parts[:colors].sample, parts[:patterns].sample, parts[:nouns].sample].join('-')
    phrase.gsub!(/-/, separator) unless separator.nil?
    return phrase
  end
end
