Gem::Specification.new do |s|
  s.name        = "tiny_bar"
  s.version     = "1.0.0"
  s.description = "like a progress bar, but can also be used to measure used capacity of something"
  s.summary     = "like a progress bar, but can also be used to measure used capacity of something"
  s.authors     = ["Jeff Lunt"]
  s.email       = "jefflunt@gmail.com"
  s.files       = ["lib/tiny_bar.rb"]
  s.homepage    = "https://github.com/jefflunt/tiny_bar"
  s.license     = "MIT"
  s.add_runtime_dependency "tiny_color", [">= 1.3"]
end
