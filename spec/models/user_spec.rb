# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before { @user = User.new(name: "Test User", email: "testuser@email.com") }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  describe 'when name is not present' do
    before { @user.name = '' }
    it { should_not be_valid }
  end

  describe 'when name is too long' do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { @user.email = '' }
    it { should_not be_valid }
  end

  describe "when email format is not valid" do
    it "should be invalid" do
      invalid_list = ['this is not valid', "another_invalid_address", '@streamweaver']
      invalid_list.each do |invalid_email|
        @user.email = invalid_email
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "Should be valid" do
      valid_list = ['test@email.com', 'name.me@company.org', 'next.text@COMPANY.COM']
      valid_list.each do |valid_email|
        @user.email = valid_email
        @user.should be_valid
      end
    end
  end
end
