# _plugins/gnuplot_lexer.rb
require 'rouge'

module Rouge
  module Lexers
    class Gnuplot < RegexLexer
      title "Gnuplot"
      desc "Gnuplot scripts"
      tag 'gnuplot'
      filenames '*.gp', '*.gnuplot'
      mimetypes 'text/x-gnuplot'

      state :root do
        rule %r/#.*$/, Comment
        rule %r/\b(?:plot|splot)\b/i, Keyword
        rule %r/\b(?:with|lines|points|linespoints)\b/i, Keyword
        rule %r/\b(?:set|unset)\b/i, Keyword
        rule %r/\b(?:xlabel|ylabel|zlabel)\b/i, Keyword
        rule %r/\b(?:using|matrix)\b/i, Keyword
        rule %r/\b(?:pause)\b/i, Keyword
        rule %r/\b(?:font)\b/i, Keyword
        rule %r/\b(?:term)\b/i, Keyword
        rule %r/\b(?:linetype)\b/i, Keyword
        rule %r/\b(?:title)\b/i, Keyword
        rule %r/\b(?:font)\b/i, Keyword
        rule %r/\b\d+\.\d+\b/i, Num::Float
        rule %r/\b\d+\b/i, Num::Integer
        rule %r/\b(?:true|false)\b/i, Keyword::Constant
        rule %r/["].*["]/, Str
        rule %r/\w+/, Name
        rule %r/\$[A-Za-z_][A-Za-z_0-9]*/, Name::Variable
      end
    end
  end
end
