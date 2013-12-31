require 'spec_helper'

describe "Games" do
  shared_examples_for "all game pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "index page" do
    describe "when not logged in" do
      before { visit games_path }
      subject { page }
      let(:heading) { 'Games' }
      let(:page_title) { 'Games' }

      it_should_behave_like "all game pages"
      it "should not have edit path" do
        pending("not deployed yet")
      end
    end

    describe "when lgged in" do
      it "should have right navigation" do
        pending("not deployed yet")
      end

      it "should have edit path for its records" do
        pending("not deployed yet")
      end

      it "should not have edit path for others records" do
        pending("not deployed yet")
      end
    end
  end

  describe "new page" do
    describe "without login" do
      before { visit new_game_path }
      subject { page }
      it { should have_content('Sign in')}
    end

    describe "with valid user" do
      let(:user) { FactoryGirl.create(:user) }
      before {
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Sign in'
        visit new_game_path
      }
      subject { page }
      let(:heading) { 'New Game' }
      let(:page_title) { 'New Game' }

      it_should_behave_like "all game pages"
    end
  end
end
