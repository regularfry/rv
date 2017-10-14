#!/usr/bin/env ruby

repos = %w{ 
  https://github.com/regularfry/rv
  https://github.com/regularfry/gemsh
  https://github.com/postmodern/chruby
  https://github.com/postmodern/ruby-install
}

Dir.chdir "/tmp"
Dir.mkdir "get-repos"
Dir.chdir "get-repos"

at_exit { system "rm -rf /tmp/get-repos" }

def xdo(*cmds)
  cmds.each do |cmd|
    puts cmd
    system cmd
    fail "`#{cmd}` failed" unless $?.success?
  end
end

repos.each do |repo|
  name = repo.split('/').last
  xdo "git clone #{repo} #{name}",
      "cd #{name} && make install"
end
