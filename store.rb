class Ring
  @@data = []
  @@counter = 0
  @@size = 0

  def self.get
    return if @@size.zero?
    item = @@data[@@counter]
    @@counter = (@@counter + 1) % @@size
    item
  end

  def self.set(data)
    @@data = data
    @@size = data.size
    @@counter = 0
  end
end

class Queue
  @@data = []
  def self.enqueue(item)
    @@data << item
  end

  def self.dequeue
    @@data.shift
  end
end
