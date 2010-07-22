# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cardtracker_session',
  :secret      => 'a2d73f732b9aa5691bda806494afeb1ff0b18daf10e3797cb4b4687bcbd47337fa93a3391572280788e1bdcee47f0d3d33f7151e48970e923e89569291d08ac6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
