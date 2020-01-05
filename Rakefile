require 'rake'
require 'csv'

# TODO: Move this script to simple bash
desc 'Install all the dependencies for the dotfiles using Homebrew'
task :install_software do
  # Check if we have Homebrew installed:
  unless system('which brew 2>&1 > /dev/null')
    puts 'Homebrew is not Installed!'
    puts 'Install it first: https://github.com/mxcl/homebrew/wiki/installation'
    exit(1)
  end

  progs = CSV.read('progs.csv', headers: true)[1..-1]

  def brew_install(program)
    return puts "#{program['name']} already installed, skipping..." if system("brew #{program['flag']} ls --versions #{program['name']} &> /dev/null;")

    puts "installing #{program['name']} from Homebrew..."
    system("brew #{program['flag']} install #{program['name']}")
  end

  def mas_install(program)
    installed = `mas list | awk '{print $1}'`.split("\n")
    return puts "#{program['description']} alread installed, skipping..." if installed.include?(program['name'])

    puts "Installing #{program['description']} from App Store..."
    system("mas install #{program['name']}")
  end

  progs.each do |program|
    if program['flag'] == 'mas'
      mas_install(program)
    else
      brew_install(program)
    end
  end
end
