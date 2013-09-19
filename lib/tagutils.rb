

require 'tagutils/version'  # let it always go first


module TagUtils

  def self.banner
    "tagutils #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

=begin
  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end
=end

end  # module TagUtils


puts TagUtils.banner    # say hello

