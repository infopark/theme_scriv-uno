# ScrivUno - Scrivito sample app and theme

## Take this app for a test drive!

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Fill in your Scrivito CMS credentials (Log in or sign up at https://scrivito.com, get a fresh CMS, display full API keys)

Wait until Heroku has finished deployment.

Explore your new Scrivito app.

## Local Installation

Download/clone onto your machine and install used gems.

```batchfile
git clone git@github.com:Scrivito/theme_scriv-uno.git
cd theme_scriv-uno
bundle
```

Create an .env file in your app root directory for your API credentials.

Your .env file should look like this:

```yaml
SCRIVITO_TENANT = some_long_letters_n_numbers
SCRIVITO_API_KEY = get_them_for_a_trial_cms_on_scrivito
SCRIVITO_PW = demo
```

You get the first two of these keys from scrivito.com. `SCRIVITO_PW` is specific for this app and you can define it as you like.

```Batchfile
bundle exec rake scrivito:migrate
bundle exec rake scrivito:migrate:publish
rails s
```

Open `http://localhost:3000` in your browser.
