# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Stats_session',
  :secret      => 'b4e8d86a9ecbac4a392337f789ae29068532573723fcf0bb4dee5458d5b9085bf9689f82403fbbd779750977311155808443426c13fc6280fff6ea5e842b6a33'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
