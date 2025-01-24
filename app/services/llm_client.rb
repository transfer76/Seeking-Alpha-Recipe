# frozen_string_literal: true

require 'httparty'

# Class LLMClient provides http requests to client
class LLMClient
  API_URL = ENV.fetch('GROQ_API_URL', nil)
  API_KEY = ENV.fetch('GROQ_API_KEY', nil)

  def generate_recipe(ingredients)
    prompt = "Create a step-by-step recipe using these ingredients: #{ingredients.join(', ')}."
    response = HTTParty.post(
      API_URL,
      headers: { 'Authorization' => "Bearer #{API_KEY}", 'Content-Type' => 'application/json' },
      body: {
        input: prompt,
        max_tokens: 500
      }.to_json
    )
    response.code == 200 ? response.parsed_response['output'] : 'Somthing went wrong'
  end

  def validate_recipe(recipe)
    prompt = "Does this text describe a valid recipe? Respond with 'yes' or 'no': #{recipe}"
    response = HTTParty.post(
      API_URL,
      headers: {
        'Authorization' => "Bearer #{API_KEY}",
        'Content-Type' => 'application/json'
      },
      body: {
        input: prompt,
        max_tokens: 50
      }.to_json
    )
    response.code == 200 ? response.parsed_response['output'] : 'Somthing went wrong'
  end
end
