require 'ruby-debug'
require 'spec_helper'

describe Log do
  specify { subject.should respond_to :reason_code }
  specify { subject.should respond_to :additional_reason_code }
  specify { subject.should respond_to :company }
  specify { subject.should respond_to :product}
  specify { subject.should respond_to :escalated_to }
  specify { subject.should respond_to :duration }

  describe ".search" do
    let!(:target) { Fabricate(:log, title: 'hello', company: Fabricate(:company, name: 'ACME'))}
    let!(:second_target) {Fabricate(:log, title: 'yellow', company: Fabricate(:company, name: 'Rockets')) }

    context "when searching for titles with one possible result" do
      subject { Log.search({title_like: 'hello'}) }
      specify { subject.count.should == 1 }
      specify { subject.first.should == target  }
    end

    context "excludes related logs" do
      subject { Log.search({related_logs: [target.id.to_s]}) }
      specify { subject.should_not include target }
      specify { subject.should include second_target }
    end
  end

  describe "#related_logs" do
    let!(:old) { Fabricate(:log, title: 'old') }
    let!(:new) { Fabricate(:log, title: 'new') }
    subject { new.related_logs }

    before do
      new.related_logs= [old]
    end

    specify { should == [old] }
    specify { old.related_logs[0].should == new }
  end
end
