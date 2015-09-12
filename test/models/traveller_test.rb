require 'test_helper'

class TravellerTest < ActiveSupport::TestCase
   
   def setup
      @traveller = Traveller.new(travellername: "john", email: "john@example.com") 
   end
   
   test "traveller should be valid" do
       assert @traveller.valid?
   end
   
   test "traveller should be present" do 
       @traveller.travellername = ""
       assert_not @traveller.valid?
   end
   
   test "travellername should not be too long" do 
       @traveller.travellername = "a" * 41
       assert_not @traveller.valid?
   end
   
   
   test "travellername should not be too short" do
        @traveller.travellername = "aa"
        assert_not @traveller.valid?
   end
   
   test "email must be present" do
       @traveller.email = " "
       assert_not @traveller.valid?
   end
   
   test "email length should be within quota" do
       @traveller.email = "a" * 101 + "@example.com"
       assert_not @traveller.valid?
   end
   
   test "email address should be unique" do 
      dup_traveller = @traveller.dup 
      dup_traveller.email = @traveller.email.upcase
      @traveller.save
      assert_not dup_traveller.valid?
   end
   
   test "email validation should accept correct addresses" do
       valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com]
       valid_addresses.each do |va|
           @traveller.email = va
           assert @traveller.valid?, '#{va.inspect} should be valid'
       end
   end
   
   test "email validation should reject invalid addresses" do
       invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com]
       invalid_addresses.each do |ia|
           @traveller.email = ia
           assert_not @traveller.valid?, '#{ia.inspect} should be invalid'
       end
   end
   
    
end