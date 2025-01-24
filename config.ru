# frozen_string_literal: true

require File.expand_path('config/boot.rb', __dir__)
require "#{Sinator::ROOT}/seeking_alpha_recipe"
require "#{Sinator::ROOT}/config/application"

run SeekingAlphaRecipe
