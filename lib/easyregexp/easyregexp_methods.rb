module EasyRegexpMethods

  def method_missing(method, *args, &block)
    arg = args[0]
    raise ArgumentError, 'Too many arguments' if args.count > 1
    raise ArgumentError, 'Argument is not of a valid type' unless (arg.is_a? String) || (arg.is_a? Array) || (arg.is_a? Hash) || arg.nil?
    regexp =  hashregexp[method]
    arg = arg.inject(:+) if arg.is_a? Array
    regexp.gsub!('$',arg) if arg
    r = Regexp.new(regexp)
    r.verbose = verbalize(method, arg)
    return r
  end

  def respond_to?(method)
    hashregexp.has_key?(method.to_sym) || Regexp.instance_methods.include?(method.to_sym)
  end

  def accepts(string)
    self =~ string
  end

  private

  def hashregexp
    {
      :anything_but_whitespaces => '\S',
      :anything_but => '[^$]',
      :all_the_whitespaces => '\s',
      :any_word => '\w',
      :any_nonword => '\W',
      :zero_or_one => '$?',
      :zero_or_more => '$*',
      :one_or_more => '$+',
      :any_digit => '\d',
      :any_nondigit => '\D',
      :capture => '($)'
    }
  end

  def verbalize(method, arg = '')
    arg = '' if arg.nil?
    arg = ' '+arg unless arg.empty?
    @verbose = method.to_s.gsub!('_',' ').capitalize+arg
  end

end
