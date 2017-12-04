if Rails.env.development?
  RDoc::Task.new do |rdoc|
    rdoc.rdoc_dir  = 'doc/flap'
    rdoc.generator = 'sdoc'
    rdoc.template  = 'rails'
    rdoc.main      = 'README.md'
    rdoc.rdoc_files.include('README.md', 'app/', 'lib/')
  end
end
