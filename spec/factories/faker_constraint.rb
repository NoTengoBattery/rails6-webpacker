def _length_tester(text, arg = {})
  min = arg[:min_l].nil? || text.length >= arg[:min_l]
  max = arg[:max_l].nil? || text.length <= arg[:max_l]
  min && max
end

def sentence_with_length(arg = {})
  arg[:supplemental] ||= true
  loop do
    lorem = Faker::Lorem.sentence(word_count: arg[:w_cnt], random_words_to_add: arg[:w_add], supplemental: true)
    return lorem if _length_tester(lorem, arg)
  end
end

def paragraphs_with_length(arg = {})
  arg[:supplemental] ||= true
  lorem = ""
  loop do
    lorem += Faker::Lorem.paragraph(sentence_count: arg[:s_cnt],
      random_sentences_to_add: arg[:s_add],
      supplemental: true)
    return lorem if _length_tester(lorem, arg)

    lorem += "\n\n"
  end
end
