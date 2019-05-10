require 'rails_helper'

describe "as a user" do
  describe "when I visit /astronauts" do
    before :each do
      @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create!(name: "Buzz Aldrin", age: 34, job: "Lieutenant")
      @astronaut_3 = Astronaut.create!(name: "Alan Shepard", age: 45, job: "Lt. Commander")

      @mission_1 = Mission.create!(title: "Apollo 13", time_in_space: 1543)
      @mission_2 = Mission.create!(title: "Capricorn 4", time_in_space: 1119)
      @mission_3 = Mission.create!(title: "Gemini 7", time_in_space: 567)
      @mission_4 = Mission.create!(title: "Apollo 14", time_in_space: 1244)
      @mission_5 = Mission.create!(title: "Gemini 8", time_in_space: 765)

      # @astronaut_1.missions << @mission_1
      # @astronaut_1.missions << @mission_4
      # @astronaut_2.missions << @mission_1
      # @astronaut_2.missions << @mission_2
      # @astronaut_3.missions << @mission_1
      # @astronaut_3.missions << @mission_3
    end

    it "it displays a list of astronauts with information" do
      visit astronauts_path

      within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_1.age)
        expect(page).to have_content(@astronaut_1.job)
      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_2.age)
        expect(page).to have_content(@astronaut_2.job)
      end

      within "#astronaut-#{@astronaut_3.id}" do
        expect(page).to have_content(@astronaut_3.name)
        expect(page).to have_content(@astronaut_3.age)
        expect(page).to have_content(@astronaut_3.job)
      end
    end

    it "it displays the average age of all astronauts" do
      visit astronauts_path

      average_age = Astronaut.average(:age).to_i

      within "#statistics" do
        expect(page).to have_content("Average Age of Astronauts: #{average_age}")
      end
    end

    it "it displays a list of space missions in alphabetical order" do
      visit astronauts_path

      within "#space-missions" do
        expect(page).to have_content(@mission_1.title)
        expect(page).to have_content(@mission_2.title)
        expect(page).to have_content(@mission_3.title)
        expect(page).to have_content(@mission_4.title)
        expect(page).to have_content(@mission_5.title)
      end
    end

    # it "it displays the total time in space for each astronaut" do
    #   within "#astronaut-#{@astronaut_1.id}" do
    #     expect(page).to have_content(@astronaut_1.total_time_in_space)
    #   end
    #
    #   within "#astronaut-#{@astronaut_2.id}" do
    #     expect(page).to have_content(@astronaut_2.total_time_in_space)
    #   end
    #
    #   within "#astronaut-#{@astronaut_3.id}" do
    #     expect(page).to have_content(@astronaut_3.total_time_in_space)
    #   end
    # end
  end
end
