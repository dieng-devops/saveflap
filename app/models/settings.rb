require 'settingslogic'

class Settings < Settingslogic
  source Rails.root.join('config', 'settings.yml')
  extend ActiveModel::Translation
  include ActiveModel::Conversion


  def grouped(nb = 4)
    grouped = []
    APPLICATION_CONFIG.keys.in_groups_of(nb).each do |keys|
      group = {}
      keys.each do |key|
        next if key.blank?
        group[key] = {}
        if key == :rails_config
          group[key]['RUBY_VERSION']  = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
          group[key]['RAILS_VERSION'] = Rails::VERSION::STRING
        end
        APPLICATION_CONFIG[key].each do |value|
          group[key][value] = ENV[value]
        end
      end
      grouped << group
    end
    grouped << sidekiq_config
    grouped
  end


  def sidekiq_config
    return @sidekiq_config if @sidekiq_config
    @sidekiq_config = {}
    files = Rails.root.join('config', 'sidekiq', '*.yml')
    Dir.glob(files).each do |file|
      name = File.basename(file, File.extname(file))
      @sidekiq_config[name.to_sym] = YAML.load(ERB.new(IO.read(file)).result)
    end
    @sidekiq_config
  end


  def sidekiq_workers
    @sidekiq_workers ||= sidekiq_config.map { |k, v| SidekiqWorker.new(k ,v) }
  end


  def sidekiq_running_workers
    Sidekiq::ProcessSet.new.to_a.map { |p| SidekiqWorker.new(p['identity'], queues: p['queues']) }
  end

end
