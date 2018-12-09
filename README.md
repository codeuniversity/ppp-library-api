# README
This is a simple REST-Api to host configs, including scripts for the [profiler](https://github.com/codeuniversity/ppp-profiler).
Includes authentication with omniauth (for now just with google) and voting for configs. 

## setup

Install dependencies with [bundler](https://bundler.io/): `bundle`

You need a locally runnning [postgres](https://www.postgresql.org/) instance.

Create a `.env` file with credentials for a google project with the peoples api enabled and the `Authorised redirect URIs` including `http://localhost:3000/omniauth/google_oauth2/callback` for development:
```
GOOGLE_CLIENT_ID="..."
GOOGLE_CLIENT_SECRET="..."
```


Create a new database: `bundle exec rails db:create`.
Migrate the database with `bundle exec rails db:migrate`.
Run the server with `bundle exec rails s`.

