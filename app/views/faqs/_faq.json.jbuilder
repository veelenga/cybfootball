json.extract! faq, :id, :question, :answer, :order, :created_at, :updated_at
json.url faq_url(faq, format: :json)