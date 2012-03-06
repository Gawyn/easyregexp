class Regexp

  attr_accessor :verbose

  alias :old_initialize :initialize

  def initialize(pattern="", opts=nil, lang=nil)
    old_initialize(pattern, opts, lang)
    @verbose = ""
  end

  def method_missing(method, *args, &block)
    arg = args[0]
    super unless HASHREGEXP.has_key?(method.to_sym)
    regexp = HASHREGEXP[method]
    arg = arg.inject(:+) if arg.is_a? Array
    regexp = regexp.gsub('$',arg) if arg
    regexp = source + regexp
    r = Regexp.new(regexp)
    r.verbose = verbalize(method, arg)
    return r
  end

  def respond_to?(method)
    HASHREGEXP.has_key?(method.to_sym) || Regexp.instance_methods.include?(method.to_sym)
  end

  def accepts(string)
    self =~ string
  end

  private

  HASHREGEXP = 
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

  def verbalize(method, arg)
    arg = '' if arg.nil?
    arg = ' '+arg unless arg.empty?
    @verbose += method.to_s.gsub!('_',' ').capitalize+arg
  end

end
