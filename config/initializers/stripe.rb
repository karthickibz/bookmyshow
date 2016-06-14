Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_bMfzQI91zPYNhTLrTidFN4uY'],
  :secret_key      => ENV['sk_test_ut5WcKHyz97nbvkYGU8HdhBY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


# Stripe.api_key = "sk_test_5LDojpNGVfWNrOMpwsvsMnOO"
# STRIPE_PUBLIC_KEY = "pk_test_SP9Ar9gLUACkNAFkYAURlebI"

# Stripe.api_key = Rails.application.secrets.stripe_secret_key