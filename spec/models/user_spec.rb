require 'rails_helper'

RSpec.describe User, type: :model do

    before do
        @user = build(:user)
    end

    describe '有効性の検証' do
        it '有効なファクトリを持つこと' do
            expect(build(:user)).to be_valid
        end
    
        it '名前、メール、パスワードがある場合、有効であること' do
            user = User.new(
                name: 'TestUser',
                email: 'test@expample.com',
                password: 'password'
            )
            expect(user).to be_valid
        end
    end

    describe '存在性の検証' do
        it '名前がない場合、無効であること' do
            @user.name = ''
            expect(@user).not_to be_valid
        end
    
        it 'メールアドレスがない場合、無効であること' do
            @user.email = ''
            expect(@user).not_to be_valid
        end

        it 'パスワードがない場合、無効であること' do
            @user.password = @user.password_confirmation = ''
            expect(@user).not_to be_valid
        end
    end

    describe '文字数の検証' do
        it '名前が20文字以内の場合、有効であること' do
            @user.name = 'a' * 20
            expect(@user).to be_valid
        end
    
        it '名前が21文字以上の場合、無効であること' do
            @user.name = 'a' * 21
            expect(@user).not_to be_valid
        end
    
        it 'メールアドレスが255文字以内の場合、有効であること' do
            @user.email = 'a' * 243 + '@example.com'
            expect(@user).to be_valid
        end
    
        it 'メールアドレスが256文字以上の場合、無効であること' do
            @user.email = 'a' * 244 + '@example.com'
            expect(@user).not_to be_valid
        end
    
        it 'パスワードが8文字以上の場合、有効であること' do
            @user.password = 'a' * 8
            expect(@user).to be_valid
        end
    
        it 'パスワードが7文字以下の場合、無効であること' do
            @user.password = 'a' * 7
            expect(@user).not_to be_valid
        end
    end

    describe 'フォーマットの検証' do
        it 'メールアドレスが正常なフォーマットの場合、有効であること' do
            valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                                 first.last@foo.jp alice+bob@baz.cn]
            valid_addresses.each do |valid_address|
            @user.email = valid_address
            expect(@user).to be_valid
            end
        end
    
        it 'メールアドレスが不正なフォーマットの場合、無効であること' do
            invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                   foo@bar_baz.com foo@bar+baz.com]
            invalid_addresses.each do |invalid_address|
            @user.email = invalid_address
            @user.valid?
            expect(@user).not_to be_valid
            end
        end
    end

    describe '一意性の検証' do
        it 'メールアドレスが小文字化されていること' do
            @user.email = "TEST@EXAMPLE.COM"
            @user.save
            expect(@user.email).to eq("test@example.com")
        end
    
        it '重複したメールアドレスの場合、無効であること' do
            user1 = create(:user, name: 'taro', email: 'taro@example.com')
            user2 = build(:user, name: 'jiro', email: user1.email)
            expect(user2).not_to be_valid
        end
    end
end