require('rspec')
require('dealership')

describe('Vehicle') do
    before() do
        Vehicle.clear()
    end

    describe("#make") do
        it ("returns the make of the vehicle") do
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "red"})
            expect(test_vehicle.make).to(eq("Toyota"))
        end
    end
    describe("#model") do
        it ("returns the model of the vehicle") do
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "green"})
            expect(test_vehicle.model).to(eq("Prius"))
        end
    end
    describe("#year") do
        it ("returns the year of the vehicle") do
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "blue"})
            expect(test_vehicle.year).to(eq(2013))
        end

    end
    describe("#id") do
        it ("returns the id of the vehicle") do
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "yellow"})
            expect(test_vehicle.id).to(eq(1))
        end
        it ("returns the id of the vehicle") do
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "yellow"})
            test_vehicle.save
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Noah", :year => 2014, :color => "yellow"})
            expect(test_vehicle.id).to(eq(2))
        end

    end

    describe(".find") do
        it("returns a vehicle by its id number") do
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "yellow"})
            test_vehicle.save
            test_vehicle2 = Vehicle.new({:make => "Toyota", :model => "Noah", :year => 2014, :color => "yellow"})
            test_vehicle2.save
            expect(Vehicle.find(test_vehicle.id())).to(eq(test_vehicle))
        end
    end

    describe(".delete") do
        it("deletes a vehicle (put to nil) by its id number") do
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "yellow"})
            test_vehicle.save
            test_vehicle2 = Vehicle.new({:make => "Toyota", :model => "Noah", :year => 2014, :color => "yellow"})
            test_vehicle2.save
            expect(Vehicle.delete(test_vehicle.id())).to(eq(nil))
        end
    end

end # Vehicle class

describe(Dealership) do
    before() do
        Dealership.clear()
    end

    describe('#name') do
        it("returns the name of the dealership") do
            test_dealership = Dealership.new("David's Toyota")
            expect(test_dealership.name()).to(eq("David's Toyota"))
        end
    end

    describe('#id') do
        it("returns the id of the dealership") do
            test_dealership = Dealership.new("Bob's Used Cars")
            expect(test_dealership.id()).to(eq(1))
        end
    end

    describe('#cars') do
        it("initially returns an empty array of cars for the dealership") do
            test_dealership = Dealership.new("David's Toyota")
            expect(test_dealership.cars()).to(eq([]))
        end
    end

    describe("#save") do
        it("adds a dealership to the array of saved dealerships") do
            test_dealership = Dealership.new("David's Toyota")
            test_dealership.save()
            expect(Dealership.all()).to(eq([test_dealership]))
        end
    end

    describe(".all") do
        it("is empty at first") do
            expect(Dealership.all()).to(eq([]))
        end
    end

    describe(".clear") do
        it("empties out all of the saved dealerships") do
            Dealership.new("David's Toyota").save()
            Dealership.clear()
            expect(Dealership.all()).to(eq([]))
        end
    end

    describe(".find") do
        it("returns a dealership by its id number") do
            test_dealership = Dealership.new("David's Toyota")
            test_dealership.save()
            test_dealership2 = Dealership.new("Steve's Cars")
            test_dealership2.save()
            expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
        end
    end

    describe('#add_vehicle') do
        it("adds a new vehicle to a dealership") do
            test_dealership = Dealership.new("Bob's Used Cars")
            test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2013, :color => "red"})
            test_dealership.add_vehicle(test_vehicle)
            expect(test_dealership.cars()).to(eq([test_vehicle]))
        end
    end
end
