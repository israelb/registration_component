module RegistrationComponent
  module Controls
    module User
      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        200
      end
    end
  end
end
