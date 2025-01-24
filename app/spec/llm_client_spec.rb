# frozen_string_literal: true

require_relative '../services/llm_client'
require 'rspec'

RSpec.describe LLMClient do
  before do
    @client = LLMClient.new
  end

  it 'generates a recipe based on ingredients' do
    allow(@client).to receive(:generate_recipe).and_return('Recipe: Cook pasta with tomatoes and cheese.')
    recipe = @client.generate_recipe(%w[pasta tomatoes cheese])
    expect(recipe).to include('Recipe:')
  end

  it 'validates a recipe' do
    allow(@client).to receive(:validate_recipe).and_return('yes')
    validation = @client.validate_recipe('Recipe: Cook pasta with tomatoes and cheese.')
    expect(validation).to eq('yes')
  end

  it 'validates a recipe with no' do
    allow(@client).to receive(:validate_recipe).and_return('no')
    validation = @client.validate_recipe('Recipe: Cook coctail.')
    expect(validation).to eq('no')
  end
end
