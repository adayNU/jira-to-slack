class JiraToSlack
  def self.convert(string)
    # striketrhough
    string.gsub!(/(^| )-(\b.*?)-( |$)/) {|e| "#{$1}~#{$2}~#{$3}"}
    # bullets
    string.gsub!(/(^|\n)(\*+?)( [^\*]*?)(\n|$)/m) {|e| "#{$1}#{"\t" * ($2 ? ($2.length - 1) : 0)}\u2022#{$3}#{$4}"}
    # numbered lists
    number_count = 0
    string.gsub!(/^# /) {|e| number_count += 1; "#{number_count}. "}
    # inline code
    string.gsub!(/\{\{(.*?)\}\}/) {|e| "`#{$1}`"}
    # multiline code
    string.gsub!(/\{code\}/,"```")
    # link
    string.gsub!(/\[([^~|]*?)\]/) {|e| "#{$1}"}
    # link with alias
    string.gsub!(/\[(.*?)\|(.*?)\]/) {|e| "<#{$2}|#{$1}>"}
    # users
    string.gsub!(/\[\~(.*?)\]/) {|e| "<@#{$1}>"}
    # blockquote
    string.gsub!(/^bq\./, ">")
    # multiline quote
    string.gsub!(/\{quote\}(.*?)\{quote\}/m) {|e| "#{$1.split("\n").map{|f| "> #{f}"}.join("\n")}"}
    # headings
    string.gsub!(/^h[0-9]\. (.*$)/) {|e| "*#{$1}*"}

    string
  end
end
