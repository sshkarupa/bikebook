require 'bcrypt'
require 'net/http'

class PhonesController < ApplicationController
  before_action :authenticate_user!, except: :show_user_phone

  def show_user_phone
    @phone = Phone.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @phone }
    end
  end

  def update
    @phone = Phone.find(params[:id])
    @send_key = params[:sms_key].to_i
    @sms_key = BCrypt::Password.new(current_user.phone.sms_key)

    if @sms_key == @send_key
      @phone.update(activated: true)
      render json: { message: {success: 'Телефон активирован'}}
    else
      render json: { message: {alert: 'Неверный код'}}, status: 400
    end
  end

  def generate_key
    rand(1111..9999)
  end

  def send_sms
    @key = generate_key
    response = MainsmsApi::Message.new(sender: 'bikebook', message: "Код подтверждения: #{@key}", recipients: [current_user.phone.number], test: 1)
    sms_status = response.deliver.status
    hashed_key = BCrypt::Password.create(@key)
    update_sms_key hashed_key

    if sms_status == 'success'
      render json: { message: {success: 'Сообщение отправлено'}}
    else
      render json: { message: {alert: 'Сообщение не отправлено, попробуйте еще раз'}}, status: 400
    end
  end

  def update_sms_key hashed_key
    @phone = current_user.phone
    @phone.update(sms_key: hashed_key)
  end

end
