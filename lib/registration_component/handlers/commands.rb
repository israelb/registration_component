# Handler user guide: http://docs.eventide-project.org/user-guide/handlers.html
# Message user guide: http://docs.eventide-project.org/user-guide/messages-and-message-data/

module RegistrationComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure
        Messaging::Postgres::Write.configure(self)
        Clock::UTC.configure(self)
        Store.configure(self)
      end

      category :registration

      handle Register do |register|
        registration_id = register.registration_id 

        registration, version = store.fetch(registration_id, include: :version)

        if registration.registered?
          logger.info(tag: :ignored) { "Command ignored (command: #{register.message_type})" }
          return
        end

        time = clock.iso8601

        stream_name = stream_name(registration_id)

        registered = Registered.follow(register)
        registered.processed_time = time

        write.(registered, stream_name, expected_version: version)
      end

      # TODO Implement command handler blocks"
      # eg:
      # handle DoSomething do |do_something|
      #   registration_id = do_something.registration_id

      #   registration, version = store.fetch(registration_id, include: :version)

      #   if registration.something_happened?
      #     logger.info(tag: :ignored) { "Command ignored (Command: #{do_something.message_type}, Registration ID: #{registration_id})" }
      #     return
      #   end

      #   something_happened = SomethingHappened.follow(do_something)

      #   something_happened.processed_time = clock.iso8601

      #   stream_name = stream_name(registration_id)

      #   write.(something_happened, stream_name, expected_version: version)
      # end
    end
  end
end
