# frozen_string_literal: true

require 'httparty'

# Class LLMClient provides http requests to client
class LLMClient
  API_URL = ENV['GROQ_API_URL']
  API_KEY = ENV['GROQ_API_KEY']

  def generate_recipe(ingredients)
    prompt = "Create a step-by-step recipe using these ingredients: #{ingredients.join(', ')}."
    response = HTTParty.post(
      API_URL,
      headers: { 'Authorization' => "Bearer #{API_KEY}", 'Content-Type' => 'application/json' },
      body: {
        model: 'claude-1',
        prompt:,
        max_tokens: 500
      }.to_json
    )
    response.parsed_response['completion']
  end
end
