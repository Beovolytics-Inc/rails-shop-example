module ApplicationHelper

  def formatted_price(price, currency = nil)
    currency = (currency || current_currency)

    if CoingateService::CRYPTO_CURRENCIES.include? currency
      "#{price} #{currency}"
    else
      number_with_precision(price, precision: 2).to_s + ' ' + currency
    end
  end

  def currency_icon(currency_iso)
     content_tag(:i, '', class: "currency-icon-#{currency_iso}")
  end

  def currency_rate_info
    "1 USD = #{session[:currency_rate]} #{current_currency}" if current_currency != 'USD'
  end

  def label_class_by_order_status(status)
    case status
      when 'paid'           then 'label-success'
      when 'canceled'       then 'label-danger'
      when 'pending'        then 'label-warning'
      when 'invalid'        then 'label-danger'
      else 'label-default'
    end
  end

  def title(page_title)
    content_for(:title) { "#{page_title} - " if page_title.present? }
  end
end
