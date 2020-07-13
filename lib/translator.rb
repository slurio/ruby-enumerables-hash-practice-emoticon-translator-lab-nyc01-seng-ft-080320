require 'yaml'
require 'pry'

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticons.each_with_object({}) do |(key, value), final_emoticons|
    final_emoticons[key] = {:english => "", :japanese => ""}
      value.each do |symbol|
        if value[0] == symbol
          final_emoticons[key][:english] = symbol
        else
          final_emoticons[key][:japanese] = symbol
      end
    end
  end
end


def get_japanese_emoticon(file, symbol)
  japanese_symbol = ""
  library = load_library(file)
  library.values.each do |symbol_file|
    if symbol_file[:english] == symbol
      japanese_symbol = symbol_file[:japanese]
    end
  end
  if japanese_symbol.empty?
    japanese_symbol = "Sorry, that emoticon was not found"
  end
  japanese_symbol
end

def get_english_meaning(file, symbol)
  english_meaning = ""
  library = load_library(file)
  library.each do |key, value|
    if value[:japanese] == symbol
      english_meaning = key
    end
    if english_meaning.empty?
      english_meaning = "Sorry, that emoticon was not found"
    end
  end
  english_meaning
end
