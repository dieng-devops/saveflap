module Flap
end

# Load Flap Libs
required_lib_dirs = [
  Rails.root.join('lib', 'flap', '**', '*.rb'),
]

required_lib_dirs.each do |regex|
  Dir.glob(regex).each do |file|
    require file
  end
end
