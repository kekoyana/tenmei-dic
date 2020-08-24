# frozen_string_literal: true

module Article::KanaIndex
  def index_by_kana(kana) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    case kana[0]
    when 'あ'..'お' then 'あ'
    when 'か'..'ご' then 'か'
    when 'さ'..'ぞ' then 'さ'
    when 'た'..'ど' then 'た'
    when 'な'..'の' then 'な'
    when 'は'..'ぽ' then 'は'
    when 'ま'..'も' then 'ま'
    when 'や'..'よ' then 'や'
    when 'ら'..'ろ' then 'た'
    when 'わ'..'ん' then 'わ'
    when '0'..'9' then '数'
    else '他'
    end
  end
end
