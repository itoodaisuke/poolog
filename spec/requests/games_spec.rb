require 'spec_helper'

describe "Games" do
  shared_examples_for "all game pages" do
    it { should have_title(full_title(page_title)) }
  end

  describe "index page" do
    describe "when not logged in" do
      before { visit games_path }
      subject { page }
      let(:page_title) { 'Games' }

      it_should_behave_like "all game pages"
      it "should not show any records for guest user" do
        expect(page).to have_content('Log in first to see your game records.')
      end
    end

    describe "when logged in" do
      let(:user) { FactoryGirl.create(:user) }
      let(:opponent) { FactoryGirl.create(:user) }
      let(:party) { FactoryGirl.create(:party, user_id: user.id) }
      let(:game) { FactoryGirl.create(:game, party_id: party.id) }
      let(:game_record1) { FactoryGirl.create(:game_record, user_id: user.id, game_id: game.id) }
      let(:game_record2) { FactoryGirl.create(:game_record, user_id: opponent.id, game_id: game.id) }

      before {
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Sign in'
        visit games_path
      }
      subject { page }
      let(:page_title) { 'Games' }

      it "should have party show path" do
        expect(page).to have_content("Jan")
      end

      it "should have game show path" do
        pending("not deployed yet")
      end

      it "should show the game type" do
        pending("not deployed yet")
      end

      describe "for joined game" do
        it "should show the game result" do
          pending("not deployed yet")
        end
      end

      describe "for not-joined game" do
        it "should not show the result" do
          pending("not deployed yet")
        end

        it "should show the both users profile img" do
          pending("not deployed yet")
        end
      end
    end
  end

  describe "new page" do
    describe "when not logged in" do
      before { visit new_game_path }
      subject { page }
      it { should have_content('Sign in')}
    end

    describe "when logged in" do
      let(:user) { FactoryGirl.create(:user) }
      before {
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Sign in'
        visit new_game_path
      }
      subject { page }
      let(:page_title) { 'New Game' }

      it_should_behave_like "all game pages"

      describe "member select" do
        it "should select the current user as default" do
          expect(page).to have_content(user.name)
        end

        describe "game with non-registered user" do
          it "should create a new user" do
            pending("not deployed yet")
          end
        end

        describe "game with registered user" do
          it "should select the existing user" do
            pending("not deployed yet")
          end
        end
      end

      describe "place select" do
        describe "game with non-registered place" do
          it "should create a new place" do
            pending("not deployed yet")
          end
        end

        describe "game with registered place" do
          it "should select the existing user" do
            pending("not deployed yet")
          end
        end
      end
    end
  end

  describe "edit page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      # create a new game record
    end

    describe "when not logged in" do
      before { visit edit_game_path(1) }
      subject { page }
      it { should have_content('Sign in')}
    end

    describe "when logged in" do
      before {
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Sign in'
        # visit edit_game_path(1)
      }
      subject { page }
      let(:page_title) { 'Edit Game' }

      describe "change member to not-registered user" do
        it "should create a new user" do
          pending("not deployed yet")
        end
      end

      describe "change place to not-registered place" do
        it "should create a new place" do
          pending("not deployed yet")
        end
      end
    end
  end
end
