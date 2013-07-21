module TokenPhrase
  def self.dictionary
    {
      :adjectives => %w(wireless furry fuzzy sleek messy incredible generous splendid superior spectacular amazing ultimate ferocious exciting lovely old-fashioned home-made grass-fed free-range grandmas grandpas governing prickly strong stellar awesome wonderful bodacious excellent stupendous groovy dancing energetic sweet sour sugarfilled glazed vegan letterman thunderous established magnetic better windy wind-up american soft genetically-modified tailored liberal conservative bluetooth),
      :colors => %w(red yellow blue green violet taupe mauve lime golden silver grey black white tangello sunshine brown tan infrared ultraviolet pink beige almond aquamarine burnt-orange cerulean cornflower-blue denim forest-green midnight-blue peach plum sea-green ruby emerald jade rose topaz onyx pearl coral crimson cyan chocolate aqua azure lavendar chiffon khaki ivory magenta navy-blue olive salmon turquoise),
      :patterns =>  %w(striped checked spotted polka-dotted plaid wavy houndstooth argyle glossy matte pinstriped tartan paisley satin honeycomb fractal waved cracked ),
      :nouns => %w(floutist carpenter jacket president address machine computer mug lamp phone wall bicycle river lake fountain building book hat pants shirt cape soup gloves pen suit photograph sand profit energy fork compact-disk floppy-disk chandelier door window laboratory people tapir wolverine wolf spider wolf-spider spider-wolf banana-slug giraffe deer-mouse capybara dingo dragon cardinal owl octopus elk moose weasel elephant rhino iguana bullfrog greyhound stickbug ladybug ant rat coyote chimpanzee housecat barracuda raven crane fox panda racoon nessie whale dolphin shark viper frog toad flounder skunk wookie dishwasher bat space-heater bobble-head lego-set pinboard flag tv video-game envelope headphones mousepad jukebox bacon eggs cereal milk sausage ham turkey nerf-gun bowl plate lazy-susan safe fireworks table chair muscles trek journey quest mission laser-gun gladiator pumpkin),
      :numbers => (1..1000000).to_a
    }
  end

  def self.adjectives more = []
    dictionary[:adjectives] | more
  end

  def self.colors more = []
    dictionary[:colors] | more
  end

  def self.patterns more = []
    dictionary[:patterns] | more
  end

  def self.nouns more = []
    dictionary[:nouns] | more
  end

  def self.numbers more = []
    dictionary[:numbers] | more
  end
end

