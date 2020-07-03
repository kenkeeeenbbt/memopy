require 'rails_helper'

RSpec.describe Friend, type: :model do
    let(:friend) { create(:friend) }

    describe '有効性の検証' do
        it '有効なファクトリを持つこと' do
            expect(friend).to be_valid
        end
    end
end