require 'liquid'
#Liquid::Template.error_mode = :strict

class LiquidRunner

  def initialize
    @templates = {}
  end

  def prepare
    Dir[File.dirname(__FILE__) + '/templates/*.liquid'].each do |file|
      @templates[file] = File.read(file)
    end
    context
  end

  def parse_and_run
    @templates.each do |file, dump|
      template = Liquid::Template.new
      template.parse(dump)
      context.each do |k, v|
        template.assigns[k.to_s] = v
      end
      template.render!(context)
    end
  end

  def context
    @context ||= {
      name: 'World',
      list: (1..1000).map { |i| "Product ##{i}" },
    }
  end

end