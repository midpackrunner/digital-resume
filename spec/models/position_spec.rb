# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  company    :string
#  title      :string
#  date_start :datetime
#  date_end   :datetime
#

require 'rails_helper'

describe Position do
  it 'should fail' do
    expect(false).to be_truthy
  end
end
