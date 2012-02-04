require 'spec_helper'
describe Easyregexp::Easyregexp do
  describe 'attributes' do
  end
  describe 'generating methods' do
    describe '#anything_but_?' do
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
        describe 'array as argument' do
          it 'should work correctly when the argument is an array' do
            subject.anything_but(['d','e','f'])
            'def'.should_not =~ subject.regexp
         end
        end
      end
      describe '#anything_but_whitespaces' do
        it 'returns the correct regexp' do
          subject.anything_but_whitespaces
          subject.regexp.should == /\S*/
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
