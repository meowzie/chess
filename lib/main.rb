# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'

class Game
end

class Board
  def initialize
    create_grid
    create_squares
    spawn_white
    spawn_black
    binding.pry
  end

  def create_grid
    @grid = {}
    ('a'..'h').each { |file| @grid[file.to_sym] = [] }
  end

  def create_squares
    ('a'..'h').each { |file| 8.times { |_rank| @grid[file.to_sym] << Square.new } }
  end

  def spawn_white
    ('a'..'h').each { |file| @grid[file.to_sym][1].occupy(Pawn.new(true)) }
    # can use case switch statement here
    %i[a h].each { |file| @grid[file][0].occupy(Rook.new(true)) }
    %i[b g].each { |file| @grid[file][0].occupy(Knight.new(true)) }
    %i[c f].each { |file| @grid[file][0].occupy(Bishop.new(true)) }
    @grid[:d][0].occupy(Queen.new(true))
    @grid[:e][0].occupy(King.new(true))
  end

  def spawn_black
    ('a'..'h').each { |file| @grid[file.to_sym][6].occupy(Pawn.new(true)) }
    # can use case switch statement here
    %i[a h].each { |file| @grid[file][7].occupy(Rook.new(true)) }
    %i[b g].each { |file| @grid[file][7].occupy(Knight.new(true)) }
    %i[c f].each { |file| @grid[file][7].occupy(Bishop.new(true)) }
    @grid[:d][7].occupy(Queen.new(true))
    @grid[:e][7].occupy(King.new(true))
  end
end

class Square
  attr_reader :occupied, :occupier

  def initialize
    @occupied = false
    @occupier = nil
  end

  def occupy(piece)
    @occupied = true
    @occupier = piece
  end
end

class Piece
  def initialize(white)
    @white = white
  end
end

class Pawn < Piece
end

class Rook < Piece
end

class Knight < Piece
end

class Bishop < Piece
end

class Queen < Piece
end

class King < Piece
end

Board.new
