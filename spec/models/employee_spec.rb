require 'spec_helper'

describe Employee do
  describe "#full_name" do
    let(:first_name) { nil }
    let(:last_name)  { nil }

    subject { Fabricate(:employee, first_name: first_name,
                        last_name: last_name ).full_name }

    context 'first and last name' do
      let(:first_name) { 'bob' }
      let(:last_name) { 'smith' }
      it { subject.should == 'bob smith' }
    end

    context 'first name only' do
      let(:first_name) { 'bob' }
      it {subject.should == 'bob'}
    end

    context 'last name only' do
      let(:last_name) { 'smith' }
      it {subject.should == 'smith'}
    end
  end
end
