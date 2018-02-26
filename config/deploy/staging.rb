# frozen_string_literal: true

server 'flap.fb.int', user: 'flap', roles: %w[app db web], port: 2230

## Nginx
set :nginx_vhosts, {
  back: { domain: 'flap.fb.int', ssl: false },
}
