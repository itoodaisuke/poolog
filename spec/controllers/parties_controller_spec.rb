require 'spec_helper'

describe PartiesController do
  shared_examples("public access to parties") do
    describe 'GET #show' do
      it 'assigns the requested party to @party' do
        party = create(:party)
        get :show, id: party
        expect(assigns(:party)).to eq party
      end

      it 'assigns the ranking of the requested party' do
        party = create(:party)
        game = create(:game, party: party)
        rankings = [
          {wins: 1, user: game.winner},
          {wins: 0, user: game.opponent(game.winner)}
        ]

        get :show, id: party
        expect(assigns(:rankings)).to match_array(rankings)
      end

      it 'renders the :show template' do
        party = create(:party)
        get :show, id: party
        expect(response).to render_template :show
      end
    end
  end


  describe 'logged-in user access' do
    before :each do
      @user = create(:user)
      sign_in @user
    end

    it_behaves_like 'public access to parties'
  end

  describe 'guest user access' do
    it_behaves_like 'public access to parties'
  end
end
