require 'mandala'

class Runner

  def initialize
    @templates = {}
  end

  def prepare
    Dir[File.dirname(__FILE__) + '/templates/*.eco'].each do |file|
      @templates[file] = Mandala.parse(File.read(file)).dump
    end
    context
  end

  def run
    @templates.each do |file, dump|
      template = Mandala::Template.new(dump)
      template.render(context)
    end
  end

  def context
    @context ||= {
      name: 'World',
      list: (1..1000).map { |i| "Product ##{i}" },
    }
  end

end