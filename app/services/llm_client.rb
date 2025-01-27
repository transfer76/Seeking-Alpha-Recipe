# frozen_string_literal: true

require 'httparty'

# Class LLMClient provides http requests to client
class LLMClient
  API_URL = ENV.fetch('GROQ_API_URL', nil)
  API_KEY = ENV.fetch('GROQ_API_KEY', nil)
  MODEL = 'llama3-70b-8192'

  def generate_recipe(ingredients)
    prompt = "Create a step-by-step recipe using the following ingredients: #{ingredients}."

    response = HTTParty.post(
      API_URL,
      headers: { 'Authorization' => "Bearer #{API_KEY}", 'Content-Type' => 'application/json' },
      body: {
        messages: [
          {
            role: 'user',
            content: prompt
          }
        ],
        model: MODEL
      }.to_json
    )

    response.code == 200 ? response['choices'][0]['message']['content'] : response['error']['message']
  end

  def validate_recipe(recipe)
    prompt = "Does this text describe a valid recipe? Respond with 'yes' or 'no': #{recipe}"

    response = HTTParty.post(
      API_URL,
      headers: { 'Authorization' => "Bearer #{API_KEY}", 'Content-Type' => 'application/json' },
      body: {
        messages: [
          {
            role: 'user',
            content: prompt
          }
        ],
        model: MODEL
      }.to_json
    )

    response.code == 200 ? response['choices'][0]['message']['content'] : response['error']['message']
  end
end
