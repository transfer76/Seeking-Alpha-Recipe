# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'dotenv/load'
require_relative '../services/llm_client'

set :public_folder, 'public'

post '/generate_recipe' do
  ingredients = params[:ingredients]
  halt 400, json({ error: 'Ingredients are required' }) if ingredients.nil? || ingredients.empty?

  llm_client = LLMClient.new
  recipe = llm_client.generate_recipe(ingredients)
  json({ recipe: })
end
