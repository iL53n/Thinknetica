class PassengerCarriage < Carriage
  def initialize(capacity)
    super(capacity, :passenger)
  end

  def take_capacity
    super(1)
  end
end
