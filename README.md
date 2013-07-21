# TokenPhrase (v1.0.6)
[![Build Status](https://travis-ci.org/genericsteele/token_phrase.png?branch=master)](https://travis-ci.org/genericsteele/token_phrase)

TokenPhrase is a simple gem that generates unique phrases for you to use in your app as tokens.

"Why?" you may be asking. Why not? Token phrases give your app a little personality and make support a lot easier.

## Installation

Add this line to your application's Gemfile:

    gem 'token_phrase'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install token_phrase

## TokenPhrase.generate(separator = nil, dictionaries = {})

### Defaults
By default, TokenPhrase uses the included dictionaries, separates everything with a hyphen (-), and appends a random number between 1 and 1,000,000 :

```ruby
TokenPhrase.generate
=> "groovy-red-fractal-fork-101589"

5.times { p TokenPhrase.generate }
"bodacious-blue-spotted-envelope-428491"
"magnetic-burnt-orange-polka-dotted-spider-wolf-268974"
"conservative-plum-paisley-banana-slug-771632"
"bluetooth-chiffon-houndstooth-wolf-spider-700306"
"sweet-violet-tartan-coyote-16101"
```

With the current dictionaries and numbers, there are 4,199,040,000,000 (four trillion!) unique possibilites.

### Separators
If you would like a different separator, just pass a string as an argument: 

```ruby
TokenPhrase.generate('$')
=> "groovy$salmon$paisley$cape$848536"

TokenPhrase.generate('MARSIPAN')
=> "sugarfilledMARSIPANcrimsonMARSIPANstripedMARSIPANfrogMARSIPAN860203"
```

### Dictionaries
TokenPhrase combines words from four different dictionaries:

* :adjectives
* :colors
* :patterns
* :nouns

If you want to replace the dictionary, just pass a hash with an array as an argument:

```ruby
TokenPhrase.generate :adjectives => %w(glowing)
=> "glowing-peach-glossy-barracuda-743220"

5.times { p TokenPhrase.generate :nouns => %w(Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto) }
"stupendous-crimson-tartan-Uranus-431203"
"tailored-khaki-fractal-Neptune-957683"
"better-almond-striped-Pluto-299491"
"soft-chiffon-tartan-Saturn-29752"
"tailored-azure-honeycomb-Saturn-668823"
```
You can pass multiple dictionaries: 

```ruby
5.times { p TokenPhrase.generate :colors => %w(black white), :nouns => %w(cat dog) }
"windy-white-satin-dog-663888"
"exciting-black-spotted-cat-502218"
"sour-white-houndstooth-cat-591001"
"thunderous-white-pinstriped-cat-375006"
"grandpas-white-honeycomb-cat-23992"
```

And you can, of course pass a separator before the dictionaries:

```ruby
5.times { p TokenPhrase.generate '^^^', :patterns => %w(striped), :adjectives =>%w(great awesome) }
"awesome^^^aquamarine^^^striped^^^pen^^^345915"
"great^^^salmon^^^striped^^^pants^^^852927"
"great^^^white^^^striped^^^spider^^^wolf^^^646401"
"awesome^^^blue^^^striped^^^people^^^314195"
"awesome^^^aqua^^^striped^^^wolverine^^^113478"
```

### Numbers

To help with uniqueness, a random number is added to the token by default. This may not be your cup of tea, so if you pass :numbers => false with the dictionaries, you can remove the number:

```ruby
TokenPhrase.generate(:numbers => false)
=> "energetic-yellow-pinstriped-skunk"
```

## Dictionary Methods

If you like the existing dictionaries, but want to add your own words, you can use get an array of each dictionary:

* TokenPhrase.adjectives(more_adjectives = nil)
* TokenPhrase.colors(more_colors = nil)
* TokenPhrase.patterns(more_patterns = nil)
* TokenPhrase.nouns(more_nouns = nil)

Each of these dictionary methods accept an array as an argument that will merge the existing dictionary with your array

```ruby
your_patterns = TokenPhrase.patterns %w(magic-eye)
2.times { p TokenPhrase.generate :patterns => your_patterns }
"prickly-magenta-matte-space-heater-687093"
"stupendous-aquamarine-magic-eye-skunk-690072"
```

## TokenPhrase.permutations(dictionaries = {})

If you want to see how many unique combinations you can generate, use the permutations method. Just pass it the dictionaries hash the same way you would use TokenPhrase.generate: 

```ruby
TokenPhrase.permutations
=> 4199040000000

TokenPhrase.permutations :nouns => %w(cat dog)
=> 87480000000

TokenPhrase.permutations :nouns => %w(scooter boat car vroom-vroom), :numbers => false
=> 174960
```

## Rails Uniqueness

The simplest way to create a unique token for your models is to add a before_create filter to your model: 

```ruby
#assuming your Thing model has a token property
class Thing < ActiveRecord::Base
  before_create :generate_token
  
  private
  def generate_token
    begin
      self.token = TokenPhrase.generate
    end while self.class.exists?(token: token)
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Thanks

Thanks to [benolee](https://github.com/benolee) for [refactoring the generator model](https://github.com/genericsteele/token_phrase/commit/7e5a0877882ba7d08f0c5a40d7873ebb0d205a45)!
