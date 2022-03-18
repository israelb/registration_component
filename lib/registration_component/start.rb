# Component initiator user guide: http://docs.eventide-project.org/user-guide/component-host.html#component-initiator

module RegistrationComponent
  module Start
    def self.call
      Consumers::Commands.start("registration:command")
      Consumers::Events.start("registration")
    end
  end
end
