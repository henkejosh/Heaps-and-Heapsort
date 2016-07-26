class BinaryMinHeap
  def initialize(&prc)
    @prc = prc
    @store = []
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    children = []
    idx1 = (2 * parent_index) + 1
    idx2 = (2 * parent_index) + 2

    children << idx1 if idx1 < len
    children << idx2 if idx2 < len
    children
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    left_child_idx, right_child_idx = self.child_indices(len, parent_idx)

    parent = array[parent_idx]

    until children.all? { |idx| @store[idx] > @store[parent_idx] }
      children.each do |child_idx|

        if @store[child_idx] < @store[parent_idx]
          @store[child_idx], @store[parent_idx] = @store[parent_idx],
            @store[child_idx]

            parent_idx = self.parent_index(child_idx)
            children = self.child_indices(@store.length, parent_idx)
            break
        end

        p @store[children.first]
        p @store[children.last]
        p @store[parent_idx]
      end

    end
    @store
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
