# frozen_string_literal: true

require '../lib/main.rb'

describe Position do
  subject(:square) { described_class.new }

  describe '#intialize' do
    # requires no testing 
  end

  describe '#update' do
    let(:knight) { double(Knight, symbol: '♘', black: false) }

    it 'updates the occupied boolean' do
      square.update(knight)
      expect(square.instance_variable_get(:@occupied)).to be(true)
    end

    it 'updates the occupier to the knight' do
      square.update(knight)
      expect(square.instance_variable_get(:@occupier)).to eql(knight)
    end

    it 'updates the symobl to knight.symbol' do
      square.update(knight)
      expect(square.instance_variable_get(:@symbol)).to eql(knight.symbol)
    end
  end
end
