require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "すべての値が正しく入力されていれば保存できること" do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは＠を含んでいないと保存出来ないこと' do
      @user.email = '@'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end  
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank", "Password confirmation is invalid")
    end
    it 'last_nameが空だと保存できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
   end
   it 'last_nameが全角日本語でないと保存できないこと' do
    @user.last_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
   it 'first_nameが空だと保存できないこと' do
    @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
   it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
   end
   it 'reading_lastが空だと保存できないこと' do
    @user.reading_last = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Reading last can't be blank")
    end
   it 'reading_lastが全角カタカナでないと保存できないこと' do
    @user.reading_first = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Reading first is invalid. Input full-width katakana characters.")
   end
   it 'reading_firstが空だと保存できないこと' do
    @user.reading_first = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Reading first can't be blank")
   end
   it 'reading_firstが全角カタカナでないと保存できないこと' do
    @user.reading_first = "ｽｽﾞｷ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Reading first is invalid. Input full-width katakana characters.")
   end
   it 'birthdayが空では保存できないこと' do
     @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
   end
  end


end
