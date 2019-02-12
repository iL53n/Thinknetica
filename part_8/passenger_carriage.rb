class PassengerCarriage < Carriage

  EMPTY_QUANTITY_ERROR = 'ERROR! Укажите количество мест!' 
  NO_FREE_PLACE = 'ВНИМАНИЕ! Нет свободных мест!'

  attr_reader :places, :quantity_places

  def initialize(quantity_places)
    @type = 'passenger'
    @quantity_places = quantity_places
    @places = {}
    create_places
    validate!
  end

  def take_place
    #1. определить первый свободный элемент
    free = @places.find { |place, status| status == 'free'}
    #2. занять элемент(если есть свободные)
    raise NO_FREE_PLACE if free.nil?
    @places[free.first] = 'occupied'
  end

  def free_quantity
    quantity('free')
  end

  def occupied_quantity
    quantity('occupied')
  end

  protected

  def validate!
    raise EMPTY_QUANTITY_ERROR if quantity_places.nil?
  end

  def create_places
    1.upto(@quantity_places) { |place| @places[place] = 'free'}
  end

  def quantity(status_place)
    arr = @places.select { |place, status| status == status_place }
    arr.length
  end
end
