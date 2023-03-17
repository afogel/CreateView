require 'google/cloud/storage'

class FolderController < ApplicationController
  before_action :set_current_directory

  def index
    storage = Google::Cloud::Storage.new
    bucket = storage.bucket "gcsbrowsertest"
    # grab all files
    @files = bucket.files(prefix: params[:folder]).map do |file|
      dir, filename = Pathname.new(file.public_url).split
      [dir, filename] if filename.extname == ".jpg" || filename.extname == ".png"
    end.compact

    @folders = @files.map(&:first).uniq
    @image_files = @files.map do |file|
      file if file.first.relative_path_from(@current_directory).to_s == "."
    end.compact
  end

  def set_current_directory
    @current_directory = params[:folder].nil? ? base_directory : base_directory + Pathname.new(params[:folder])
  end

  def base_directory
    Pathname.new("https://storage.googleapis.com/gcsbrowsertest/")
  end
end
