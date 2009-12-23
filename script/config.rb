# Constants and common code for generator and uploader.

UPLOAD_TO = 'ai@sitnik.ru:/home/ai/sitnik.ru/'

require 'pathname'
require 'rubygems'

gem 'haml'
require 'haml'

ROOT    = Pathname.new(__FILE__).dirname.parent.realpath
PUBLIC  = ROOT.join('public')
CONTENT = ROOT.join('content')

def build
  load Pathname.new(__FILE__).dirname.join('build')
end

class Translation
  def initialize(hash)
    @data = hash
  end
  def method_missing(name)
    value = @data[name.to_s]
    if value.is_a? Hash
      Translation.new(value) 
    else
      value
    end
  end
end