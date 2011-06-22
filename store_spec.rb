require 'rspec'
require './store'

describe Ring do
  it 'works like a ring' do
    Ring.get.should == nil

    Ring.set %w[one two three]
    Ring.get.should == 'one'
    Ring.get.should == 'two'
    Ring.get.should == 'three'
    Ring.get.should == 'one'
    Ring.get.should == 'two'
    Ring.get.should == 'three'
    Ring.get.should == 'one'
    Ring.get.should == 'two'
    Ring.get.should == 'three'

    Ring.set %w[one]
    Ring.get.should == 'one'
    Ring.get.should == 'one'
    Ring.get.should == 'one'
  end
end

describe Queue do
  it 'queues' do
    Queue.dequeue.should == nil

    Queue.enqueue :one
    Queue.dequeue.should == :one

    Queue.enqueue :one
    Queue.enqueue :two
    Queue.dequeue.should == :one
    Queue.dequeue.should == :two

    Queue.enqueue :one
    Queue.enqueue :two
    Queue.dequeue.should == :one
    Queue.enqueue :three
    Queue.dequeue.should == :two
    Queue.dequeue.should == :three

    Queue.dequeue.should == nil
    Queue.dequeue.should == nil
    Queue.enqueue :one
    Queue.dequeue.should == :one
  end
end
