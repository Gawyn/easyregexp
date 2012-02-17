class Regexp

  require 'easyregexp/easyregexp_methods.rb'

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
