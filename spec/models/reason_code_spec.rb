require 'spec_helper'

describe ReasonCode do
  specify { subject.should respond_to :logs }
  specify { subject.should respond_to :additional_logs }
end
