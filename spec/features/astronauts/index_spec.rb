require 'rails_helper'

describe "as a user" do
  describe "when I visit /astronauts" do
    before :each do
      @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create!(name: "Buzz Aldrin", age: 34, job: "Lieutenant")
      @astronaut_3 = Astronaut.create!(name: "Alan Shepard", age: 45, job: "Lt. Commander")
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
      "Apollo 13"
           "Capricorn 4"
           "Gemini 7")
    end
  end
end
