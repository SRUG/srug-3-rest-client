# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twitter-clone-client}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Szymon Nowak"]
  s.date = %q{2009-04-11}
  s.email = %q{szimek@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/twitter_clone_client.rb",
    "test/test_helper.rb",
    "test/twitter_clone_client_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/szimek/twitter-clone-client}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/test_helper.rb",
    "test/twitter_clone_client_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
