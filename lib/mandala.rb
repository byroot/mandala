require "mandala/version"

require 'v8'
require 'eco'

module Mandala

  def self.parse(source)
    js = Eco.compile(source)
    Template.new("var template = #{js}; template")
  end

  class Template

    def initialize(js_source)
      @js_source = js_source
    end

    def render(assigns)
      compiled_template.call(assigns)
    end

    def compiled_template
      @compiled_template = vm.eval(@js_source)
    end

    def vm
      Mandala.vm
    end

  end

  def self.vm
    @vm ||= V8::Context.new
  end

end
