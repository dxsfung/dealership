require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/dealership")
require("pry")

get("/") do
    erb(:index)
end

get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

get('/dealerships/new') do
   erb(:dealerships_form)
end

post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @dealerships = Dealership.all()
  erb(:success)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/dealerships/:id/vehicles/new') do
    @dealership = Dealership.find(params.fetch('id').to_i())
    erb(:dealership_vehicles_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  color = params.fetch('color')
  @vehicle = Vehicle.new({:make => make, :model => model, :year => year, :color => color})
  @vehicle.save()
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:success)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id').to_i())
  erb(:vehicle)
end

get('/vehicles') do
    @vehicles = Vehicle.all()
  erb(:vehicles)
end
