require 'spec_helper'

describe Regexp do

  describe 'class' do
    it 'is of Regexp class' do
      subject.class == 'Regexp'
    end
  end

  describe 'responding' do
    it 'has a verbose element' do
      subject.respond_to?(:verbose).should be_true
    end
    it 'responds to all the Regexp instance methods' do
      Regexp.instance_methods.each do |method|
        subject.respond_to?(method.to_sym).should be_true
      end
    end
    it 'responds to some special methods' do
      subject.respond_to?(:any_nonword).should be_true
    end
  end

  describe 'Easyregexp methods' do
    describe 'accepts' do
      it 'does exactly the same that its typical Regexp counterpart' do
        subject.accepts('hola sfa').should == (// =~ 'hola sfa')
      end
    end
  end
end
