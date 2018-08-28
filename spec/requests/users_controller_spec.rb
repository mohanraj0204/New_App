require 'spec_helper'

describe "User's page" do

	subject {page}

	describe "profile pages" do
		before { visit user_path(user)}
		let(:user) {FactoryGirl.create(:user)}

		it {should have_content('User')}
	end

	describe "Signup Page" do
		before { visit signup_path}
		let(:submit) {"Create Account"}
		
		describe "Valid signup" do
			before do
				fill_in  "Email",					with: "user@gmail.com"
				fill_in  "Password",				with: "password"
				fill_in  "confirmation", 			with: "password"
			end
			it "create user" do
				expect {click_button submit}.to change(User,:count).by(1)
			end
		end
		describe "Invalid signup" do
			it "not create user" do
				 expect {click_button submit}.not_to change(User,:count)
			end
		end
	end
end