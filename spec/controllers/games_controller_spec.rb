require 'spec_helper'

describe GamesController do
  describe 'GET #index' do
    it 'populates an array of games joined by the user'
    it 'groups the games by its party date'
    it 'renders the :index template'
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

  describe 'GET #new' do
    it 'assigns a new game to @game'
    it 'renders the :new template'
  end

  describe 'GET #edit' do
    it 'assigns the requested game to @game'
    it 'renders the :edit template'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new game in the db'
      it 'redirects to games#show'
    end

    context 'with invalid attributes' do
      it 'does not save the new game in db'
      it 're-renders the :new template'
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the game in the db'
      it 'redirects to the game'
    end

    context 'with invalid attributes' do
      it 'does not update the new game in db'
      it 're-renders the :edit template'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the game from db'
    it 'reirects to games#index'
  end
end
