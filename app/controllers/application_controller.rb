class ApplicationController < ActionController::Base
  # обязательный токен безопасности
  protect_from_forgery prepend: true
  add_flash_types :success, :danger, :info, :warning
end
