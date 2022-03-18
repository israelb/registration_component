# Entity user guide: http://docs.eventide-project.org/user-guide/entities.html
# Entity snapshotting user guide: http://docs.eventide-project.org/user-guide/entity-store/snapshotting.html

module RegistrationComponent
  class Registration
    include Schema::DataStructure

    attribute :id, String
    attribute :user_id, String
    attribute :email_address, String
    attribute :registered_time, Time

    # TODO Implement attributes
    # TODO Implement entity logic, predicates, mutations, calculations, etc
    # Note: This class's methods should pertain only to its attributes
    def registered?
      !registered_time.nil?
    end
  end
end
