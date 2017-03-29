class Vehicle
    @@vehicles = []
    attr_reader(:make, :model, :year, :color, :id)
    define_method(:initialize) do |vehicle|
        @make = vehicle.fetch(:make)
        @model = vehicle.fetch(:model)
        @year = vehicle.fetch(:year)
        @color = vehicle.fetch(:color)
        @id = @@vehicles.length().+(1)
    end

    define_singleton_method(:all) do
        @@vehicles
    end

    define_method(:save) do
        @@vehicles.push(self)
    end

    define_singleton_method(:clear) do
        @@vehicles = []
    end

    define_singleton_method(:find) do |id|
        found_vehicle = nil
        @@vehicles.each() do |vehicle|
            if vehicle.id().eql?(id.to_i())
                found_vehicle = vehicle
            end
        end
        found_vehicle
    end
end

class Dealership
    @@dealerships = []
    attr_reader(:name, :id, :cars)
    define_method(:initialize) do |dealer|
        @name = dealer
        @id = @@dealerships.length().+(1)
        @cars = []
    end

    define_singleton_method(:all) do
        @@dealerships
    end

    define_method(:save) do
        @@dealerships.push(self)
    end

    define_singleton_method(:clear) do
        @@dealerships = []
    end

    define_singleton_method(:find) do |id|
        found_dealership = nil
        @@dealerships.each() do |dealership|
            if dealership.id().eql?(id)
                found_dealership = dealership
            end
        end
        found_dealership
    end

    define_method(:add_vehicle) do |vehicle|
        @cars.push(vehicle)
    end

end
