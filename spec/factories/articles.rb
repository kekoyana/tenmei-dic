# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    name { '梁山泊' }
    kana { 'りょうざんぱく' }
    category { 1 }
    text { '108星の英傑たちが集まる水に囲まれた山塞' }
  end
end
