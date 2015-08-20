require 'bcrypt'
require 'net/http'

class PhonesController < ApplicationController
  before_action :authenticate_user!

  def update
    @phone = Phone.find(params[:id])
    @send_key = params[:sms_key].to_i
    @sms_key = BCrypt::Password.new(current_user.phone.sms_key)


    if @sms_key == @send_key
      @phone.update(activated: true)
      render json: { success: "Телефон активирован" }
    else
      render json: { error: "Неверный код" }
    end

  end

  def generate_key
    rand(1111..9999)
  end

  def send_sms
    @key = generate_key

    message = MainsmsApi::Message.new(sender: 'bikebook', message: "Код водтверждения: #{@key}", recipients: ['89150300200'])

    hashed_key = BCrypt::Password.create(@key)
    update_sms_key hashed_key

    render json: { res: message.deliver }
  end

  def update_sms_key hashed_key
    @phone = current_user.phone
    @phone.update(sms_key: hashed_key)
  end


end
