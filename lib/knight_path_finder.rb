require_relative '00_tree_node'

class KnightPathFinder
  attr_reader :visited_positions

  DELTAS = [
    [ -1, -2],
    [ -1, 2 ],
    [ 1, -2 ],
    [ 1, 2 ],
    [ 2,  1 ],
    [ 2, -1 ],
    [ -2, 1 ],
    [ -2, -1]
  ]

  def initialize(start)
    @start = PolyTreeNode.new(start)
    @visited_positions = [start]
    build_move_tree
  end

  def build_move_tree
  end

  def new_move_positions(pos)
    new_moves = valid_moves(pos)
    @visited_positions += new_moves
    new_moves
  end

  def valid_moves(pos)
    x, y = pos
    DELTAS.map do |delta|
      [x + delta[0], y + delta[1]]
    end.select do |position|
      !(@visited_positions.include?(position)) &&
      on_board?(position)
    end

  end

  def on_board?(pos)
    pos.all? { |val| val >= 0 && val < 8 }

  end

end

kpf = KnightPathFinder.new([0,0])

# p kpf.visited_positions
# p kpf.new_move_positions([4,4])
# p kpf.visited_positions
