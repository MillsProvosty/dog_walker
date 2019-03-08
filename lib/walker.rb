class Walker
  attr_reader :name,
              :poop_bags,
              :clients
  def initialize(name, poop_bags)
    @name = name
    @poop_bags = poop_bags
    @clients = []
  end

  def add_client(dogs)
      @clients << dogs unless @clients.include?(dogs)
  end

  def walk_that_dog(dog_object)
    @poop_bags -= 1
    dog_object.walk
  end

  def client_number
    @clients.length
  end

  def client_elderly?(dog_object)
    if dog_object.age > 10
      true
    else
      false
    end
  end

  def list_clients
    @clients.map do |client|
      client.name
    end
  end

  def client_name_ending
    @clients.map do |client|
      if client.name[-1] == "e" ||
        client.name[-2..-1] == "ie"
        return client.name
      else
        return "Sorry, no cute names."
      end
    end
  end

  def check_breed(breed)
    @clients.find_all do |client|
      if client.breed == breed
        return client
      end
    end
  end

  def clients_by_breed
    @clients.group_by do |client|
      client.breed
    end
  end


end
