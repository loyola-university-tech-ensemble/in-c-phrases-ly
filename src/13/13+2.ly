\version "2.19.80"


phrase = \relative c'''' {

  \clef "treble^8"
  \mark "13." 
  \cadenzaOn
  b16[ g8.] g16[ f g8] r8. g16~ g2.

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

