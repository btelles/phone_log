require 'spec_helper'

describe ReasonCode do
  specify { subject.should respond_to :logs }
end
