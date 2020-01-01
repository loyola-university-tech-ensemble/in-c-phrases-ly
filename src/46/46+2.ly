\version "2.19.80"


phrase = \relative c'''' {

  \clef "treble^8"
  \mark "46." 
  \cadenzaOn
  g16[ d' e d] r8 g, r g r g g16[ d' e d]
}

\score {
  \defineBarLine ":" #'("" ":" "")
  \new Staff = "phrase" {
    \bar ":"
    \phrase
    \set Score.repeatCommands = #'(end-repeat)
  }
  \layout {
    \context { \Staff
      \remove Time_signature_engraver
      \override BarLine.hair-thickness = #-1
      \override BarLine.thick-thickness = #-1
    }
  }
}
\header { tagline = "" }
\paper {
  top-margin = 1
  bottom-margin = 1
  left-margin = 1
  right-margin = 1
  indent = 0
}

