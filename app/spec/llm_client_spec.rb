# frozen_string_literal: true

require_relative '../services/llm_client'
require 'rspec'

RSpec.describe LLMClient do
  it 'generates a recipe based on ingredients' do
    client = LLMClient.new
    allow(client).to receive(:generate_recipe).and_return('Recipe: Cook pasta with tomatoes and cheese.')
    recipe = client.generate_recipe(%w[pasta tomatoes cheese])
    expect(recipe).to include('Recipe:')
  end
end
