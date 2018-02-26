# frozen_string_literal: true

Rails.application.config.session_store :redis_store, servers: {
                                                                host:      Settings.redis_host,
                                                                port:      Settings.redis_port,
                                                                db:        REDIS_DB_MAP.index('session'),
                                                                driver:    :hiredis
                                                              }, expires_in: Settings.session_timeout.minutes
