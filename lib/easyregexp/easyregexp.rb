require 'easyregexp/easyregexp_methods.rb'

class Regexp

  attr_accessor :verbose

  class << self
    def easy
      v = Regexp.new(/.*/)
      v.verbose = 'Anything'
      v.extend(EasyRegexpMethods)
      return v
    end
  end
end
