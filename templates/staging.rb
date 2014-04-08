require_relative 'production'

Mail.register_interceptor RecipientInterceptor.new(
  ENV['EMAIL_RECIPIENTS'] || ['marcelo.jacobus@gmail.com'],
  subject_prefix: '[staging]'
)
