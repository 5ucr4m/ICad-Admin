require 'pagy/extras/bootstrap'

module ApplicationHelper
  include Pagy::Frontend

  def show?(form)
    form && action_name == 'show'
  end

  def active_action?(controller)
    'active font-weight-bold' if controller.remove('/') == controller_name
  end

  def asset_exist?(path)
    if Rails.configuration.assets.compile
      Rails.application.precompiled_assets.include? path
    else
      Rails.application.assets_manifest.assets[path].present?
    end
  end

  def flashes
    flash.to_hash.slice('alert', 'error', 'notice', 'success')
  end

  def alert_type(flash_type)
    case flash_type
    when 'alert'
      'warning'
    when 'error'
      'danger'
    when 'notice'
      'success'
    when 'success'
      'success'
    else
      'success'
    end
  end

  def alert_icon(flash_type)
    case flash_type
    when 'alert' || 'error'
      'fas fa-exclamation-triangle'
    when 'notice'
      'fas fa-check'
    when 'success'
      'fas fa-check'
    else
      'fas fa-exclamation-circle'
    end
  end
end
