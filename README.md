# ScrivUno - Scrivito sample app and theme

## Take this app for a Test Drive!

Deploy to heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Fill in your Scrivito CMS credentials (Log in or sign up at htts://scrivito.com, get a fresh CMS, display full API keys)

Wait until Heroku is finished deploying.

Explore your new Scrivito app.

## Local Installation

Download/clone onto your machine

Run 'bundle'

Create an .env file with your API credentials for a fresh Scrivito tenant and a password for your demo user. It should look something like this:

    SCRIVITO_TENANT = d078f_some_long_letters_n_numbers_68b
    SCRIVITO_API_KEY = 65e_get_them_for_a_trial_cms_on_scrivito.com_b660
    SCRIVITO_PW = demo

Run 'rake scrivito:migrate'

Run 'rails s'

Open in your browser: http://localhost:3000/?_scrivito_workspace_id=rtc

