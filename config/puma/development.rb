# frozen_string_literal: true

threads 4, 4
workers 2
preload_app!

before_fork do
  SeekingAlphaRecipe::DB.disconnect if defined?(SeekingAlphaRecipe::DB)
end
