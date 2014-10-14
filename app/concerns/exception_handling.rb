module ExceptionHandling
  extend ActiveSupport::Concern

  included do
    unless config.consider_all_requests_local
      rescue_from(Scrivito::ResourceNotFound, with: :not_found)
    end
  end

  def not_found
    respond_to do |type|
      type.html do
        @obj = Homepage.default.try(:error_not_found_page)

        if @obj.present?
          template = "#{@obj.controller_name.underscore}/#{@obj.controller_action_name}"
          render(template: template, status: 404)
        else
          render(file: 'public/404', layout: false, status: 404)
        end
      end
      type.all do
        render(nothing: true, status: 404)
      end
    end
  end
end
