require_relative '../automated_init'

context "Registration" do
  context "Has Registered Time" do
    test "Is registered" do
      registration = Controls::Registration::Registered.example
      pp registration.inspect
      assert(registration.registered?)
    end
  end
  
  context "Does not Have Registered Time" do
    registration = Controls::Registration.example

    test "Is not registered" do
      refute(registration.registered?)  
    end
  end
end
