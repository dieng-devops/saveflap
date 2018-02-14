server 'flap.fraudbuster.mobi', user: 'flap', roles: %w{app db web}, port: 2230

## Nginx
set :nginx_vhosts, {
  back: { domain: 'flap.fraudbuster.mobi', ssl: false }
}
