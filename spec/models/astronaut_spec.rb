require 'rails_helper'

describe Astronaut, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe "class methods" do
    before :each do
      @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create!(name: "Buzz Aldrin", age: 34, job: "Lieutenant")
      @astronaut_3 = Astronaut.create!(name: "Alan Shepard", age: 45, job: "Lt. Commander")
    end

    it ".average_age" do
      expect(Astronaut.average_age.to_i).to eq(38)
    end
  end
end
