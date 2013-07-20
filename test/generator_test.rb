require 'minitest/unit'
require 'minitest/autorun'
require 'token_phrase'

class GeneratorTest < MiniTest::Unit::TestCase
  def test_that_numbers_can_be_excluded
    phrase = TokenPhrase.generate numbers: false
    refute_match /\d+$/, phrase
  end

  def test_that_permutations_calculate_all_combinations
    permutations = TokenPhrase.permutations(
      adjectives: %w(test),
      colors: %w(test),
      patterns: %w(test),
      nouns: %w(test),
      numbers: false
    )
    assert_equal 1, permutations
  end

  def test_that_separator_can_be_overridden
    phrase = TokenPhrase.generate "+"
    assert_match /\+/, phrase
    refute_match /-/, phrase
  end

  def test_that_adjectives_can_be_overridden
    phrase = TokenPhrase.generate adjectives: %w(test)
    assert_match /test/, phrase
  end

  def test_that_colors_can_be_overridden
    phrase = TokenPhrase.generate colors: %w(test)
    assert_match /test/, phrase
  end
  
  def test_that_patterns_can_be_overridden
    phrase = TokenPhrase.generate patterns: %w(test)
    assert_match /test/, phrase
  end
  
  def test_that_nouns_can_be_overridden
    phrase = TokenPhrase.generate nouns: %w(test)
    assert_match /test/, phrase
  end

  def test_that_dictionaries_can_be_added_to
    adjectives = TokenPhrase.adjectives %w(test)
    colors = TokenPhrase.colors %w(test)
    patterns = TokenPhrase.patterns %w(test)
    nouns = TokenPhrase.nouns %w(test)
    assert_equal (TokenPhrase.adjectives.count + 1), adjectives.count
    assert_equal (TokenPhrase.colors.count + 1), colors.count
    assert_equal (TokenPhrase.patterns.count + 1), patterns.count
    assert_equal (TokenPhrase.nouns.count + 1), nouns.count
  end
end
