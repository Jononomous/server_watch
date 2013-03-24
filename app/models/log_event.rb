class LogEvent < ActiveRecord::Base
  attr_accessible :alert_level, :occured_at, :server_log_id, :title, :error_type, :error_text

  belongs_to :server_log

  HIGHALERTS = '500 501 502 503 504 505 400 404 408'.split
  MEDIUMALERTS = '401 402 403 405 406 407 409 410 411 412 413 414 415'.split
  LOWALERTS = '300 301 302 303 304 305'.split


  def priority?
    case self.alert_level
    when 0
      'none'
    when 1
      'low'
    when 2
      'medium'
    when 3
      'high'
    end
  end

  def class_level
    case self.alert_level
    when 0
      ''
    when 1
      'success'
    when 2
      'warning'
    when 3
      'important'
    end
  end
end
