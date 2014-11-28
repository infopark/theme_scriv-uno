# ScrivUno - a sample app with theme for Scrivito

# Take this app for a Test Drive!

Deploy to heroku:

- [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
- open your app's config variables settings on the Heroku Platform API (https://dashboard-next.heroku.com/apps)
- fill in your Scrivito CMS credentials (Log in or sign up at htts://scrivito.com, display full API keys of your CMS)

# Local Installation

- download onto your machine
- run 'bundle'
You may need to install gems locally (see Gemfile for details)
- create an .env file with your API credentials for a fresh Scrivito tenant
- run 'rake scrivito:migrate'
- run 'rails s'
- open in your browser: http://localhost:3000/?_scrivito_workspace_id=rtc

