Gem::Specification.new do |spec|
    spec.name          = 'mdock'
    spec.version       = '0.0.1'
    spec.date          = '2019-09-08'
    spec.authors       = ["Patryk Niedźwiedziński"]
    spec.email         = 'pniedzwiedzinski19@gmail.com'

    spec.summary       = "macOs Dock configurator"
    spec.description   = "Configure your macOs dock with .yaml file"
    spec.license       = 'MIT'

    spec.files         = ["lib/mdock.rb", "lib/mdock/cli.rb", "lib/mdock/config.rb", "lib/mdock/run.rb"]
    spec.bindir        = "bin"
    spec.executables   = ["mdock"]
    spec.require_paths = ["lib"]

  end