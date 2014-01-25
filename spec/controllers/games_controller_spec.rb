require 'spec_helper'

describe GamesController do
  shared_examples("public access to games") do
    describe 'GET #index' do
      it 'populates an array of games joined by the user' do
        game1 = create(:game)
        game2 = create(:game)
        get :index
        expect(assigns(:games)).to match_array([game1, game2])
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      it 'assings the requested game to @game' do
        game = create(:game)
        get :show, id: game
        expect(assigns(:game)).to eq game
      end

      it 'renders the :show template' do
        game = create(:game)
        get :show, id: game
        expect(response).to render_template :show
      end
    end
  end

  shared_examples('full access to games') do
    describe 'GET #new' do
      it 'assigns a new game to @game' do
        get :new
        expect(assigns(:game)).to be_a_new(Game)
      end

      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      before :each do
        @game = create(:game)
      end

      it 'assigns the requested game to @game' do
        get :edit, id: @game
        expect(assigns(:game)).to eq @game
      end

      it 'renders the :edit template' do
        get :edit, id: @game
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
      before :each do
        opponent = create(:user)

        @place = attributes_for(:place)
        @party = attributes_for(:party, user_id: @user.id, place: @place)
        @invalid_party = attributes_for(:party, user_id: nil, place: @place)
        @game_records =  {
          "0" => attributes_for(:game_record_for_controller, user_id: @user.id),
          "1" => attributes_for(:game_record_for_controller, user_id: opponent.id)
        }
      end

      context 'with valid attributes' do
        it 'saves the new game in the db' do
          expect{
            post :create, game: attributes_for(:game, party_attributes: @party, game_records_attributes: @game_records )
          }.to change(Game, :count).by(1)
        end

        it 'redirects to games#show' do
          post :create, game: attributes_for(:game, party_attributes: @party, game_records_attributes: @game_records )
          expect(response).to redirect_to game_path(assigns[:game])
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new game in db' do
          expect{
            post :create, game: attributes_for(:game, party_attributes: @invalid_party, game_records_attributes: @game_records )
          }.to_not change(Game, :count)
        end

        it 're-renders the :new template' do
          post :create, game: attributes_for(:game, party_attributes: @invalid_party, game_records_attributes: @game_records )
          expect(response).to render_template :new
        end
      end
    end

    describe 'PATCH #update' do
      before :each do
        opponent = create(:user)

        @place = attributes_for(:place)
        @party = attributes_for(:party, user_id: @user.id, place: @place)
        @invalid_party = attributes_for(:party, user_id: nil, place: @place)
        @game_records =  {
          "0" => attributes_for(:win_record_for_controller, user_id: @user.id),
          "1" => attributes_for(:game_record_for_controller, user_id: opponent.id)
        }
        @game = create(:game)
      end

      context 'with valid attributes' do
        it 'locates the requested @game' do
          patch :update, id: @game, game: attributes_for(:game, party_attributes: @party, game_records_attributes: @game_records )
          expect(assigns(:game)).to eq(@game)
        end

        it 'changes @games attributes' do
          patch :update, id: @game, game: attributes_for(:game, rule: 'Nine-ball', party_attributes: @party, game_records_attributes: @game_records )
          @game.reload
          expect(@game.rule).to eq('Nine-ball')
        end

        it 'redirects to the updated game' do
          patch :update, id: @game, game: attributes_for(:game, rule: 'Nine-ball', party_attributes: @party, game_records_attributes: @game_records )
          expect(response).to redirect_to @game
        end
      end

      context 'with invalid attributes' do
        it 'does not change the games attributes' do
          patch :update, id: @game, game: attributes_for(:game, rule: 'Nine-ball', party_attributes: @invalid_party, game_records_attributes: @game_records )
          @game.reload
          expect(@game.rule).to_not eq('Nine-ball')
          expect(@game.rule).to eq('Eight-ball')
        end

        it 're-renders the :edit template' do
          patch :update, id: @game, game: attributes_for(:game, rule: 'Nine-ball', party_attributes: @invalid_party, game_records_attributes: @game_records )
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @game = create(:game)
      end

      it 'deletes the game from db' do
        expect{
          delete :destroy, id: @game
        }.to change(Game, :count).by(-1)
      end

      it 'reirects to games#index' do
        delete :destroy, id: @game
        expect(response).to redirect_to games_path
      end
    end
  end

  shared_examples('require login') do
    describe 'GET #new' do
      it 'renders the :new template' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      before :each do
        @game = create(:game)
      end

      it 'renders the :new template' do
        get :edit, id: @game
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it 'renders the :new template' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      before :each do
        @game = create(:game)
      end

      it 'renders the :new template' do
        patch :update, id: @game
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @game = create(:game)
      end

      it 'renders the :new template' do
        delete :destroy, id: @game
        expect(response).to redirect_to new_user_session_path
      end
    end
  end


  describe 'logged-in user access' do
    before :each do
      @user = create(:user)
      sign_in @user
    end

    it_behaves_like 'public access to games'
    it_behaves_like 'full access to games'
  end

  describe 'guest user access' do
    it_behaves_like 'public access to games'
    it_behaves_like 'require login'
  end
end
