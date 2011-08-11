require 'spec_helper'

describe Log do
  specify { subject.should respond_to :reason_code }
  specify { subject.should respond_to :additional_reason_code }
  specify { subject.should respond_to :company }
end
