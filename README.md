# TokenPhrase

TokenPhrase is a simple gem that generates unique phrases for you to use in your app as tokens.

"Why?" you may be asking. Why not? Token phrases give your app a little personality and make support a lot easier.

TokenPhrase was built for [Sellmer](http://justsellstuff.com), a simple yet powerful way to sell your digital goods.

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
=> "ultimate-beige-tartan-pants557846"

5.times { p TokenPhrase.generate }
"amazing-golden-plaid-dishwasher214832"
"thunderous-yellow-matte-greyhound516648"
"bodacious-violet-houndstooth-viper351290"
"dancing-golden-spotted-cardinal623081"
"sweet-jade-cracked-cape975328"
```

### Separators
If you would like a different separator, just pass a string as an argument: 

```ruby
TokenPhrase.generate('$')
=> "vegan$blue$spotted$capybara649484"

TokenPhrase.generate('MARSIPAN')
=> "bodaciousMARSIPANaquaMARSIPANmatteMARSIPANcardinal611650"
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
=> "glowing-white-striped-tapir168706"

5.times { p TokenPhrase.generate :nouns => %w(Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto) }
"better-red-satin-Venus956045"
"awesome-pearl-glossy-Saturn284244"
"sour-sea-green-checked-Saturn711076"
"groovy-lime-argyle-Venus213795"
"old-fashioned-topaz-waved-Pluto922970"
```
You can pass multiple dictionaries: 

```ruby
5.times { p TokenPhrase.generate :colors => %w(black white), :nouns => %w(cat dog) }
"grass-fed-white-polka-dotted-cat307486"
"grass-fed-black-cracked-cat882907"
"bluetooth-white-satin-dog77769"
"ultimate-black-fractal-dog328541"
"spectacular-black-satin-cat815018"
```

And you can, of course pass a separator before the dictionaries:

```ruby
5.times { p TokenPhrase.generate '^^^', :patterns => %w(striped), :adjectives =>%w(great awesome) }
"great^^^cornflower^^^blue^^^striped^^^machine662941"
"awesome^^^pearl^^^striped^^^banana^^^slug313429"
"awesome^^^navy^^^blue^^^striped^^^shirt279849"
"awesome^^^midnight^^^blue^^^striped^^^shark379464"
"awesome^^^ultraviolet^^^striped^^^hat748152"
```

## Numbers

To help with uniqueness, a random number is added to the token by default. This may not be your cup of tea, so if you pass :numbers => false with the dictionaries, you can remove the number:

```ruby
TokenPhrase.generate(:numbers => false)
=> "glazed-magenta-houndstooth-spider-wolf"
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
TokenPhrase.generate :patterns => your_patterns
=> "awesome-mauve-magic-eye-giraffe"
```

## Uniqueness

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

## Sellmer

I built TokenPhrase for use with [Sellmer](http://justsellstuff.com). I'm using token phrases for public-facing sales tokens as a way to give the application a little more personality and to make supporting sales and transactions easier. Sellmer is almost ready for beta testers, so if you are interested in being one of the first people to get their hands on it, head over to the [Sellmer page](http://justsellstuff.com) and add your email to the list. I'm looking forward to launching with features as big and as small as token phrase.
