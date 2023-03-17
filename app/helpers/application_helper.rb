module ApplicationHelper
  def base_bucket_url
    "https://storage.googleapis.com/gcsbrowsertest/"
  end

  def relative_directory(path)
    path.relative_path_from(Pathname.new(base_bucket_url))
  end
end
