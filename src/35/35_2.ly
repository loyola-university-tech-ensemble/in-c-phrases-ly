\version "2.19.80"


phrase = \relative c, {

  \clef "bass"
  \mark "35." 
  \cadenzaOn
  f16[ g b g] b[ g b g] b[ g] r8 r4 r r
  bes4 g'2. a8[ g~] g[ b!] a4. g8 e2. g8[ fis~] fis2.
  r4 r r8 e8~ e2 f1.

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

