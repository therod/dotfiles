require 'rake'
require 'csv'
require 'pry'

desc 'Install all the dependencies for the dotfiles using Homebrew'
task :install_brew do
  # Check if we have Homebrew installed:
  unless system('which brew 2>&1 > /dev/null')
    puts 'Homebrew is not Installed!'
    puts 'Install it first: https://github.com/mxcl/homebrew/wiki/installation'
    exit(1)
  end

  new = CSV.read('progs.csv')[1..-1].map(&:first)
  installed = `brew list -1`.split("\n")

  (new - installed).each do |prog|
    puts "Installing #{prog}..."
    system("brew install #{prog}")
  end
end
