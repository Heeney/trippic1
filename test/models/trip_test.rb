require 'test_helper'
#TDD
class TripTest < ActiveSupport::TestCase
    
    def setup
       @traveller = Traveller.create(travellername: "bob", email: "bob@example.com")    
       @trip = @traveller.trips.build(name: "MoscowWinter", summary: "Great Trip", 
                description: "Make sure to get the train to St Pertersburg while there")  
    end
    
    test "trip should be valid" do
       assert @trip.valid? 
    end
    
    test "traveller_id should be present" do 
        @trip.traveller_id = nil
        assert_not @trip.valid?
    end
    
    test "name should be present" do
       @trip.name = " "
       assert_not @trip.valid?
    end
    
    test "name length should not be too long" do
        @trip.name = "a" * 101
        assert_not @trip.valid?
    end
    
    test "name length should not be too short" do
        @trip.name = "aaa"
        assert_not @trip.valid?
    end
    
    test "summary should be present" do
        @trip.summary = " "
        assert_not @trip.valid?
    end
    
    test "summary length should not be too long" do 
        @trip.summary = "a" * 160
        assert_not @trip.valid?
    end
    
    test "summary length should not be too short" do 
        @trip.summary = "a" * 9
        assert_not @trip.valid?
    end
    
    test "description should be present" do
        @trip.description = " "
        assert_not @trip.valid?        
    end
    
    test "description should not be too long" do 
        @trip.description =  "a" * 501
        assert_not @trip.valid?
    end
    
    test "description should not be too short" do
        @trip.description = "a" * 19
        assert_not @trip.valid?
    end
    
    
end