# frozen_string_literal: true

require '../lib/main.rb'

describe Position do
  subject(:square) { described_class.new(true) }

  describe '#intialize' do
    # requires no testing
  end

  describe '#occupy' do
    let(:knight) { double(Knight, symbol: '♘', black: false) }

    it 'updates the occupied boolean' do
      square.occupy(knight)
      expect(square.instance_variable_get(:@occupied)).to be(true)
    end

    it 'updates the occupier to the knight' do
      square.occupy(knight)
      expect(square.instance_variable_get(:@occupier)).to eq(knight)
    end

    it 'updates the symobl to knight.symbol' do
      square.occupy(knight)
      expect(square.instance_variable_get(:@symbol)).to eq(knight.symbol)
    end
  end

  describe '#desert' do
    subject(:occupied) { described_class.new(false) }
    let(:knight) { double(Knight, symbol: '♘', black: false) }
    before { occupied.occupy(knight) }

    it 'reverts the occupied attribute to an unoccupied state' do
      occupied.desert
      expect(occupied.instance_variable_get(:@occupied)).to be(false)
    end

    it 'removes the occupier' do
      occupied.desert
      expect(occupied.instance_variable_get(:@occupier)).to eq(nil)
    end

    it 'displays no symbol' do
      occupied.desert
      expect(occupied.instance_variable_get(:@symbol)).to eq(nil)
    end
  end
end
