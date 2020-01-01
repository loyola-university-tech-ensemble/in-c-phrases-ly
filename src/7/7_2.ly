\version "2.19.80"


phrase = \relative c, {

  \clef "bass_8"
  \mark "7." 
  \cadenzaOn
  r4 r r r8
  c16[ c] c8
  r8 r4 r r r

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

