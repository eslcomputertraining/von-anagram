class Word<ActiveRecord::Base


  def add_letters
    characters = self.text.chars
    alphabetized_characters = characters.sort
    self.letters = alphabetized_characters.join
  end

  def self.find_anagrams(string)
    # Convert word to an array of letters
    letters = string.split(//)
 
    # Create an array to store our anagrams
    anagrams = []
 
    # Loop through each letter in letters
    letters.each do |letter|
      # Select the remaining letters
      remaining = letters.select { |l| l != letter }
 
      # Create a new word by combining the letter + the remaining letters
      # Add new word to anagrams array
      anagrams << letter + remaining.join('')
 
      # Create a new word by combining the letter + the reverse of the remaining letters
      # Add new word to anagrams array
      anagrams << letter + reverse_letters(remaining).join('')
    end
 
    # Return anagrams array
    anagrams
  end

  #reverse letters in array
    def self.reverse_letters(two_word_anagram)
      length = two_word_anagram.length-1
      anagram=Array.new

      two_word_anagram.each_with_index do |i, x|
        anagram.push(two_word_anagram[length-x])
        end
      anagram
    end



 def self.valid_input(input)
   if Word.find_by_text(input).present?
     true
   else
     raise Exception.new("Try adding a word not already in our dictionary. ")
   end
 end
end
