require 'spec_helper'

describe "User's page" do

	subject {page}

	describe "profile pages" do
		let(:user) {FactoryGirl.create(:user)}
		before { visit user_path(user)}
		
		it {should have_content('User')}
	end

	describe "Signup Page" do
		before(:each) { visit signup_path}
		let(:submit) {"Create Account"}
	
		describe "Invalid signup" do
			it "not create user" do
				 expect { click_button 'Create Account' }.not_to change(User, :count)
			end
		end

		describe "Valid signup" do
			before do
				fill_in  "Email",					with: "user@example.com"
				fill_in  "Password",				with: "password"
				fill_in  "confirmation", 			with: "password"
			end
			it "create user" do
				expect { click_button 'Create Account' }.to change(User, :count).by(1)
			end
		end
	end
end