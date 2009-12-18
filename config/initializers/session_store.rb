# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_administraciondecondominios_session',
  :secret      => 'aede4964a3761a11b41c2bba2067bd16a6d1645fbab16b3dc4803992bd9b6b9e944f0cbcfa4a02d6f8fa51a2f01fc3d7e61040652498ff5b146b1d094212902f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
