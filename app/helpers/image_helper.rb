module ImageHelper
  def formatted_url(url)
    (Pathname.new(url[0]) + Pathname.new(url[1])).to_s
  end
end
