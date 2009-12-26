# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_poetry_session',
  :secret      => '8ed5ae89fed71fe6aa3b96cf0dbcaa5dabad19f11cbd634c25c7d0fee7827f7e1d074ebfc5f5d9eb6bb730a5a2952fe321a6852fb5dc6cd424c9cc00d0087976'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
