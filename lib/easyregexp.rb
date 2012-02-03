module Easyregexp

  class Easyregexp

    attr_reader :verbose, :regexp

    def anything_but_whitespaces
      if @regexp.nil?
        @regexp = Regexp.new('\S*')
      end
      verbalize(__method__)
    end

    def anything_but(arg)
      if @regexp.nil?
        @regexp = Regexp.new('\/'+arg.to_s+'*')
      end
      verbalize(__method__)
    end

    private

    def verbalize(method)
      @verbose = method.to_s.gsub!('_',' ').capitalize
    end

  end

end
