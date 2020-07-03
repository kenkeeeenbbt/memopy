require 'rails_helper'

RSpec.describe FriendsDetail, type: :model do
    let(:friends_detail) { create(:friends_detail) }

    describe '有効性の検証' do
        it '有効なファクトリを持つこと' do
            expect(friends_detail).to be_valid
        end
    end
end