# Terry Riley's _In C_ (Lilypond)

Loyola University Technology Ensemble performs Terry Riley's minimalist
masterpiece _In C_ frequently, and we have a lot of software that needs to
visualize the phrases of it. We re-typeset the phrases in [Lilypond][] so we
can generate clean SVGs of individual phrases and reuse them across multiple
applications. Each phrase has six transposed variants transposed above and
below the original notation, so in total there are 571 Lilypond files.

[Lilypond]: http://lilypond.org/

## Installation

Using the generated SVGs in your own Javascript projects is as simple as adding
the following line to an `.npmrc` file at the root of your project:

```npmrc
@loyola-university-tech-ensemble:registry=https://npm.pkg.github.com
```

This will add the GitHub registry to your project for our packages, then you can
install this package normally:

```console
$ npm install @loyola-university-tech-ensemble/in-c-phrases-ly
```

The package currently only exports the static path of the package, which is subject
to change depending on how it will be used in dependent projects. If you are using
Webpack you should be able to alias the package for easy access to SVG paths in JS.

```js
const phrasesPath = require('@loyola-university-tech-ensemble/in-c-phrases-ly').default;
// or in ES6
import phrasesPath from '@loyola-university-tech-ensemble/in-c-phrases-ly';
```

## File Structure

Each of the 53 phrases are contained in their own directory (`1-53`) inside the
`src/` directory with transposed variants three octaves above and below the
original. For example, the following is a breakdown of the contents of the
first phrase's directory:

* `1_3.ly` – First phrase transposed down three octaves
* `1_2.ly` – First phrase transposed down two octaves
* `1_1.ly` – First phrase transposed down an octave
* `1.ly` – First phrase transposed three octaves
* `1+1.ly` – First phrase transposed up an octave
* `1+2.ly` – First phrase transposed up two octaves
* `1+3.ly` – First phrase transposed up three octaves

## Locally Generating SVGs

These Lilypond files require some features that are not available in the
current stable version (2.18.2), so to generate assets you will need to use at
least version 2.19.80. You also need to be running a UNIX-like operating system
such as macOS, Linux, FreeBSD, etc.

Running the build script at the root of the repo will generate all of the SVGs
and put them in a `build/` directory.

```console
$ ./build.sh
```

Lilypond can also generate PDFs and PNGs of the phrases, just modify the build
script to suit your needs.
