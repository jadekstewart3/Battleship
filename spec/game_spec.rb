# frozen_string_literal: true

require './lib/game'

RSpec.describe Game do
  let(:game) { Game.new }

  it 'exists' do
    expect(game).to be_a(Game)
  end

  it 'has a player cruiser' do
    expect(game.player_cruiser).to be_a(Ship)
  end

  it 'has a player submarine' do
    expect(game.player_sub).to be_a(Ship)
  end

  it 'has a computer cruiser' do
    expect(game.comp_cruiser).to be_a(Ship)
  end

  it 'has a computer submarine' do
    expect(game.comp_sub).to be_a(Ship)
  end

  it 'valid_comp_coordinates' do
    comp_cruiser = game.comp_cruiser
    comp_sub = game.comp_sub
    expect(game.valid_comp_coordinates(comp_cruiser).length).to eq(comp_cruiser.length)
    expect(game.valid_comp_coordinates(comp_sub).length).to eq(comp_sub.length)
  end

  it 'place_comp_ships' do
    game.place_comp_ships
    expect(game.comp_board.cells.values.map(&:ship).compact.empty?).to eq(false)
  end
end
