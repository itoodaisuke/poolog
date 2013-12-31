require 'spec_helper'

describe "Games" do
  describe "GET /games" do
    before { visit games_path }
    subject { page }

    it { should have_content('Games Index') }
  end
end
