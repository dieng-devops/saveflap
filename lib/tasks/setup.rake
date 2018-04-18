namespace :app do

  desc 'Setup first installation'
  task first_install: %w(setup:create_admin_user)

  namespace :setup do
    desc 'Create Admin User'
    task create_admin_user: [:environment] do
      options = {
        first_name:     'Admin',
        last_name:      'Admin',
        email:          'admin@example.net',
        admin:          true,
        password:       'admin123',
        language:       'fr',
        time_zone:      'Paris',
        create_options: 'manual',
      }

      if User.find_by_email('admin@example.net').nil?
        puts 'Create Admin user ...'
        result = Admin::Users::Create.(params: {user: options})
        if result.success?
          puts 'Done!'
          puts
          puts 'email    : admin@example.net'
          puts 'password : admin123'
        else
          puts result['contract.default'].errors.full_messages
        end
      else
        puts 'User admin already exists, skip ...'
      end
    end
  end
end
