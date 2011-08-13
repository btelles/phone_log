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
    before do
      Fabricate(:log, title: 'yellow', company: Fabricate(:company, name: 'Rockets'))
    end
    context "when searching for titles with one possible result" do
      subject { Log.search({title_like: 'hello'}) }
      specify { subject.count.should == 1 }
      specify { subject.first.should == target  }
    end
  end
end
