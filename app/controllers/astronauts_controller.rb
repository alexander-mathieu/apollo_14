class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @missions = Mission.all
  end
end
