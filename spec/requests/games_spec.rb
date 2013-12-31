require 'spec_helper'

describe "Games" do
  shared_examples_for "all game pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "index page" do
    before { visit games_path }
    subject { page }
    let(:heading) { 'Games' }
    let(:page_title) { 'Games' }

    it_should_behave_like "all game pages"
  end

  describe "new page" do
    before { visit new_game_path }
    subject { page }
    let(:heading) { 'New Game' }
    let(:page_title) { 'New Game' }

    it_should_behave_like "all game pages"
  end
end
