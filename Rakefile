require_relative 'config/boot'
require_relative 'seeking_alpha_recipe'

namespace :assets do
  desc "Precompile assets"
  task :precompile do
    manifest = ::Sprockets::Manifest.new(SeekingAlphaRecipe.assets.index, "#{SeekingAlphaRecipe.public_folder}/assets")
    manifest.compile(SeekingAlphaRecipe.assets_manifest)
  end

  desc "Clean assets"
  task :clean do
    FileUtils.rm_rf("#{SeekingAlphaRecipe.public_folder}/assets")
  end
end
