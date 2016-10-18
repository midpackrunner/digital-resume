# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  date_start :datetime
#  date_end   :datetime
#  owner_id   :integer
#  owner_type :string
#

require 'rails_helper'

describe Period do
  let(:period) { create(:period) }

  it 'must start before ending' do
    period.date_end = period.date_start - 1.month
    expect(period).to_not be_valid
  end

  describe '#ended' do
    context 'when date_end not present' do
      before { period.date_end = nil }

      it "should be 'Present'" do
        expect(period.ended).to eq 'Present'
      end
    end
  end

end
