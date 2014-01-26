require 'spec_helper'

describe Game do
  it "is valid with a party association" do
    game = build(:game)
    expect(game).to be_valid
  end

  it "has two game_records" do
    game = create(:game)
    expect(game.game_records.count).to eq 2
  end

  describe 'joined_by?' do
    before :each do
      @game = create(:game)
    end

    context 'when user joined the game' do
      it "returns true" do
        user = @game.users.first
        expect(@game.joined_by?(user)).to be_true
      end
    end

    context 'when user not joined the game' do
      it "returns false" do
        user = create(:user)
        expect(@game.joined_by?(user)).to be_false
      end
    end
  end

  describe 'winner' do
    context 'when the game has a winner' do
      it "returns the user who won the game" do
        game = create(:game)
        user = game.game_records.where(winner: true).first.user
        expect(game.winner).to eq user
      end
    end

    context 'when the game has no winner' do
      it "returns nil" do
        game = create(:game_with_no_winner)
        expect(game.winner).to be_nil
      end
    end
  end

  describe 'opponent' do
    before :each do
      @game = create(:game)
    end

    context 'when the user not joined the game' do
      it "returns nil" do
        user = create(:user)
        expect(@game.opponent(user)).to be_nil
      end
    end

    context 'when the user joined the game' do
      it "returns the opponent user" do
        user = @game.users.first
        expect(@game.opponent(user)).to eq @game.users.second
      end
    end
  end
end
