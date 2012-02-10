require 'spec_helper'

describe Easyregexp::Easyregexp do
  describe 'generating methods' do
    describe '#all_the' do
      describe '#all_the_whitespaces' do
        it 'returns the correct regexp' do
          subject.all_the_whitespaces
          subject.regexp.should == /\s/
        end
        it 'returns the correct verbose form' do
          subject.all_the_whitespaces
          subject.verbose.should == 'All the whitespaces'
        end
        it 'should behave properly' do
          subject.all_the_whitespaces
          'AAA AA'.should =~ subject.regexp
        end
      end
    end
    describe '#anything_but' do
      describe '#anything_but()' do
        it 'returns the correct regexp' do
          subject.anything_but('a')
          subject.regexp.should == /[^a]/
        end
        it 'returns the correct verbose form' do
          subject.anything_but('b')
          subject.verbose.should == 'Anything but b'
        end
        it 'should behave properly accepting' do
          subject.anything_but('c')
          'aaa'.should =~ subject.regexp
        end
        it 'should behave properly rejecting' do
          subject.anything_but('c')
          'ccc'.should_not =~ subject.regexp
        end
        it 'raises an exception if the argument is not valid' do
          proc { subject.anything_but(true) }.should raise_error
        end
        describe 'array as argument' do
          it 'returns the correct regexp' do
            subject.anything_but('fgh')
            subject.regexp.should == /[^fgh]/
          end
          it 'should work correctly when the argument is an array' do
            subject.anything_but(['d','e','f'])
            'def'.should_not =~ subject.regexp
         end
        end
      end
      describe '#anything_but_whitespaces' do
        it 'responds to the method' do
          subject.respond_to?('anything_but_whitespaces').should be_true
        end
        it 'returns the correct regexp' do
          subject.anything_but_whitespaces
          subject.regexp.should == /\S/
        end
        it 'returns the correct verbose form' do
          subject.anything_but_whitespaces
          subject.verbose.should == 'Anything but whitespaces'
        end
        it 'should behave properly' do
          subject.anything_but_whitespaces
          'AAAAA'.should =~ subject.regexp
        end
      end
    end
  end
end
