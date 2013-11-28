#!/usr/bin/env ruby

build = <<-BASH
rm -rf build
cp -R public pre_build_public
cp -RL public build_public
rm -rf public
mv build_public public
echo 'Building...'
hem build
mv public build
mv pre_build_public public
BASH

timestamp = `date -u +%Y-%m-%d_%H-%M-%S`.chomp

compress = <<-BASH
echo 'Compressing...'
timestamp=#{ timestamp }

mv build/application.js "build/application-$timestamp.js"
mv build/application.css "build/application-$timestamp.css"
BASH

system build
system compress

index = File.read 'build/index.html'
index.gsub! 'application.js', "application-#{ timestamp }.js"
index.gsub! 'application.css', "application-#{ timestamp }.css"
File.open('build/index.html', 'w'){ |f| f.puts index }
