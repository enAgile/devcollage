require 'spec_helper'

describe MediumDecorator do
  let(:medium) { Medium.new.extend MediumDecorator }
  subject { medium }
  it { should be_a Medium }
end
