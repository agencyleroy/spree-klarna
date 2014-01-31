require 'spec_helper'

describe Spree::KlarnaPayment do
  context 'relation' do
    it { should have_many :payments }
  end

  context 'validation' do
    it { should validate_presence_of :personal_identity_number }
  end
end
