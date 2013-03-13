# LaCroix Design Co. Middleman Template

A template for [middleman](http://middlemanapp.com/).

## Installation

Install `middleman`

    gem install middleman

Clone this repo into your `~/.middleman` folder:

    git clone https://github.com/lacroixdesign/middleman-template ~/.middleman/lacroixdesign

## Usage

#### Create a new project

    middleman init PROJECT_NAME -T=lacroixdesign

Change to the project directory and run `bundle install`.

#### Run the development server

    rake server

#### Build + clean

    rake build

Builds the static version for production and removes files that are no longer needed.

#### Set a domain name for Github Pages

    rake domain:set

See [Setting up a custom domain with Pages](https://help.github.com/articles/setting-up-a-custom-domain-with-pages) for DNS instructions.

#### View the currently set domain name, if any. Prompts to set one if missing

    rake domain

#### Build & deploy to Github Pages

    rake deploy

Requires a Github repo to be set for `origin`. This will build + clean, then deploy to the `gh-pages` branch of the Github repo.
