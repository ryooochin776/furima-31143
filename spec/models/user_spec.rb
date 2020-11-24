require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "情報を全て入力すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複するemailの場合は登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@を含まない場合は登録できないこと" do
      @user.email = "domybest776gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが6文字より少なければ登録できないこと" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角英数字混合でなければ登録できないこと" do
      @user.password = "ddddddd"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角数字のみでは登録できないこと" do
      @user.password = "00000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "last_nameが空では登録できないこと" do 
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameは全角でなければ登録できないこと" do
      @user.last_name = "hhh"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameは全角でないと登録できないこと" do
      @user.first_name = "hhh"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaは全角でないと登録できないこと" do
      @user.last_name_kana = "hhh"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "first_name_kanaは全角でないと登録できないこと" do
      @user.first_name_kana = "hhh"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
