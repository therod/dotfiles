require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

# TODO: Fix recursive symlink in the directories if Skip is selected
    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        # when 'S' then skip_all = true
        # when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do
  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end

  end
end

# TODO: Add Support for MacPorts
desc "Install all the dependencies for these dotfiles using Homebrew"
task :dependencies do
  # Check if we have Homebrew installed:
  unless system("which brew 2>&1 > /dev/null")
    puts "Homebrew is not Installed!"
    puts "Install it first: https://github.com/mxcl/homebrew/wiki/installation"
    exit(1)
  end

  brew_recipes = [
    "https://raw.github.com/Homebrew/homebrew-dupes/master/vim.rb",
    "git",
    "hub",
    "bash-completion",
    "coreutils",
    "wget",
    "tmux",
    "reattach-to-user-namespace",
  ]

  brew_recipes.each do |recipe|
    puts "Installing #{recipe}..."
    `brew install #{recipe}`
  end
end

namespace :vim do
  namespace :plugins do
    desc "Update the installed plugin "
    task :update do
      system("git submodule update")
    end
    desc "Install the configured VIM plugins"
    task :install do
      system("git submodule init")
    end
  end
end
