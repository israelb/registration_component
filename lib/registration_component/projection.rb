# Projection user guide: http://docs.eventide-project.org/user-guide/projection.html
# Message user guide: http://docs.eventide-project.org/user-guide/messages-and-message-data/

module RegistrationComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :registration

    apply Registered do |registered|
      registration.id = registered.registration_id
      registration.user_id = registered.user_id
      registration.email_address = registered.email_address
      registration.registered_time = Clock.parse(registered.time)
    end
  end
end
