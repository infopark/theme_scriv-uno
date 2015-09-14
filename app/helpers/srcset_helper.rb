module SrcsetHelper
  def srcset_for(obj)
    image = obj.try(:binary)
    return unless image

    width = obj[:meta_width].to_i
    return if width.zero?

    widths = [width, 160, 320, 640, 1024, 1280, 2560].uniq.reject { |w| w > width }

    widths.map do |width|
      transformed_image = image.transform(width: width)
      url = scrivito_url(transformed_image)

      "#{url} #{width}w"
    end.join(", ")
  end
end