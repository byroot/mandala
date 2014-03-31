require 'spec_helper'


describe Mandala do

  it 'works' do
    template = Mandala.parse %{Hello <%= @name %>}
    output = template.render(name: 'World!')
    expect(output).to be == 'Hello World!'
  end

end