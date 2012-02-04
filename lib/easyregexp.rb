module Easyregexp

  class Easyregexp

    attr_reader :verbose, :regexp

    def anything_but_whitespaces
      @regexp ||= Regexp.new('\S*')
      verbalize(__method__)
    end

    def anything_but(arg)
      raise ArgumentError, 'Argument is not of a valid type' unless (arg.is_a? String) || (arg.is_a? Array)
      arg = arg.inject(:+) if arg.is_a? Array
      @regexp ||= Regexp.new('[^'+arg.to_s+']')
      verbalize(__method__, arg)
    end

    private

    def verbalize(method, arg = '')
      unless arg.empty?
        arg = ' '+arg
      end
      @verbose = method.to_s.gsub!('_',' ').capitalize+arg
    end

  end

end
