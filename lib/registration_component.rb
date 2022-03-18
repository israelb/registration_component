require "eventide/postgres"

# TODO Load command and event message files"
# require "registration_component/messages/commands/..."
require "registration_component/messages/events/registered"

require "registration_component/registration"
require "registration_component/projection"
require "registration_component/store"

require "registration_component/handlers/commands"
require "registration_component/handlers/events"

require "registration_component/consumers/commands"
require "registration_component/consumers/events"

require "registration_component/start"
