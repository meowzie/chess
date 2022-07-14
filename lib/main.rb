# frozen_string_literal: true

# the squares that hold the pieces
class Position
  def initialize
    @id = nil
    @occupied = false
    @occupier = nil
    @symbol = nil
    @black = true
  end

  def update(piece)
    @occupied = true
    @occupier = piece
    @symbol = piece.symbol
  end
end

class Knight; end
