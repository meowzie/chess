# frozen_string_literal: true

# the squares that hold the pieces
class Position
  def initialize(black)
    @id = nil
    @occupied = false
    @occupier = nil
    @symbol = nil
    @black = black
  end

  def occupy(piece)
    @occupied = true
    @occupier = piece
    @symbol = piece.symbol
  end

  def desert
    @occupied = false
    @occupier = nil
    @symbol = nil
  end
end

class Knight; end
