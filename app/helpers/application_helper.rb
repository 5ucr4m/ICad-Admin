# frozen_string_literal: true

require 'pagy/extras/bootstrap'

module ApplicationHelper
  include Pagy::Frontend

  def show?(form)
    form && action_name == 'show'
  end

  def active_action?(controller)
    return if controller_name == 'dashboards'

    'active font-weight-bold' if controller.remove('/') == controller_name
  end

  def asset_exist?(path)
    File.exist?(Rails.application
      .root.join('app', 'javascript', 'packs', "#{path}.js"))
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
    when 'alert', 'error'
      'fas fa-exclamation-triangle'
    when 'notice'
      'fas fa-check'
    when 'success'
      'fas fa-check'
    else
      'fas fa-exclamation-circle'
    end
  end

  def treatment_title(role_type)
    case role_type
    when 'mayor'
      'Vossa Excelência'
    else
      'Olá'
    end
  end

  def period_months
    current_year = (Time.current.month..Time.current.to_date.end_of_year.month)
    next_year = (Time.current.next_year.to_date.beginning_of_year.month..Time.current.next_year.to_date.end_of_year.month)

    current_year = current_year.to_a.map { |month| [month, Time.current.year] }
    next_year = next_year.to_a.map { |month| [month, Time.current.next_year.year] }
    (current_year + next_year).freeze
  end
end
