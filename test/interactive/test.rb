require_relative './interactive_init'

class Register
  include Messaging::Message

  attribute :registration_id, String
  attribute :user_id, String
  attribute :email_address, String
  attribute :time, String
end

registration_id = SecureRandom.uuid
user_id = SecureRandom.uuid
email_address = "israel@example.com"
time = "2021-01-01T00:00:00.000Z"

register = Register.build

register.registration_id = registration_id
register.user_id = user_id
register.email_address = email_address
register.time = time

stream_name = Messaging::StreamName.command_stream_name(registration_id, "registration")

Messaging::Postgres::Write.(register, stream_name)
