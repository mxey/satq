require "nokogiri"

doc = Nokogiri::HTML($stdin)
doc.css('#content p').each do |p|
  begin
    quote = Quote.from_raw_quote(p.content)
    quote.save!
  rescue Exception => e
    puts p.content
    puts e
  end
end