require 'hoe'
require './lib/tagutils/version.rb'

Hoe.spec 'tagutils' do

  self.version = TagUtils::VERSION

  self.summary = 'tagutils - tag utilities (tag, taggings, tag list, etc.)'
  self.description = summary

  self.urls    = ['https://github.com/rubylibs/tagutils']

  self.author  = 'Gerald Bauer'
  self.email   = 'webslideshow@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ['logutils', '>= 0.5']
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
   :required_ruby_version => '>= 1.9.2'
  }


end