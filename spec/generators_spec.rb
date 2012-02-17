require 'spec_helper'

describe Regexp.easy do

  describe 'generating methods' do

    describe '#all_the' do
      describe '#all_the_whitespaces' do
        it 'changes the source' do
          subject.all_the_whitespaces.source.should == '\s'
        end
        it 'returns the correct regexp' do
          subject.all_the_whitespaces.should == /\s/
        end
        it 'returns the correct verbose form' do
          subject.all_the_whitespaces
          subject.verbose.should == 'All the whitespaces'
        end
        it 'should behave properly' do
          subject.all_the_whitespaces
          'AAA AA'.should =~ subject
        end
      end
    end

    describe '#anything_but' do
      describe '#anything_but()' do
        it 'returns the correct regexp' do
          subject.anything_but('a').should == /[^a]/
        end
        it 'returns the correct verbose form' do
          subject.anything_but('b').verbose.should == 'Anything but b'
        end
        it 'should behave properly accepting' do
          'aaa'.should =~ subject.anything_but('c')
        end
        it 'should behave properly rejecting' do
          'ccc'.should_not =~ subject.anything_but('c')
        end
        it 'raises an exception if the argument is not valid' do
          proc { subject.anything_but(true) }.should raise_error
        end
        describe 'array as argument' do
          it 'returns the correct regexp' do
            subject.anything_but('fgh').should == /[^fgh]/
          end
          it 'should work correctly when the argument is an array' do
            'def'.should_not =~ subject.anything_but(['d','e','f'])
         end
        end
      end

      describe '#anything_but_whitespaces' do
        it 'responds to the method' do
          subject.respond_to?('anything_but_whitespaces').should be_true
        end
        it 'returns the correct regexp' do
          subject.anything_but_whitespaces.should == /\S/
        end
        it 'returns the correct verbose form' do
          subject.anything_but_whitespaces.verbose.should == 'Anything but whitespaces'
        end
        it 'should behave properly' do
          'AAAAA'.should =~ subject.anything_but_whitespaces
        end
      end

    end
  end
end
