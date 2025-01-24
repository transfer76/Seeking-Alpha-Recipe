# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'dotenv/load'
require_relative '../services/llm_client'

set :public_folder, 'public'

LLM_CLIENT = LLMClient.new

post '/generate_recipe' do
  ingredients = params[:ingredients]
  halt 400, json({ error: 'Ingredients are required' }) if ingredients.nil? || ingredients.empty?

  recipe = LLM_CLIENT.generate_recipe(ingredients)

  if recipe
    json({ recipe: })
  else
    halt 500, json({ error: 'Failed to generate recipe' })
  end
end

post '/validate_recipe' do
  recipe = params[:recipe]
  halt 400, json({ error: 'Recipe is required' }) if recipe.nil? || recipe.empty?

  validation = LLM_CLIENT.validate_recipe(recipe)
  if validation
    json({ validation: })
  else
    halt 500, json({ error: 'Failed to validate recipe' })
  end
end
