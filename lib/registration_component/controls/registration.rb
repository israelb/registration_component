module RegistrationComponent
  module Controls
    module Registration
      def self.example
        registration = RegistrationComponent::Registration.build
        registration.id = id
        registration
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end

      def self.email_address
        "jane@example.com"
      end

      module New
        def self.example
          RegistrationComponent::Registration.build
        end
      end

      module Identified
        def self.example
          registration = New.example
          registration.id = Registration.id
          registration
        end
      end

      module Registered
        def self.example
          registration = Registration.example
          registration.registered_time = Time::Effective::Raw.example
          registration
        end
      end
    end
  end
end
