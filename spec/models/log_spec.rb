require 'spec_helper'

describe Log do
  specify { subject.should respond_to :reason_code }
end
