##Boilerplate User authentication

<br>
All interesting code is in:

* [User model](app/models/user.rb)
* [User controller](app/controllers/users_controller.rb)
* [Session controller](app/controllers/sessions_controller.rb)
* [Session Helper (important)](app/helpers/sessions_helper.rb)
* [Routes](config/routes.rb)
* [Session Views](app/views/sessions)
* [User Views](app/views/users)

The database used in development is SQLite3 right now, but if you plan to deploy this to the web, and don't
want to run into issues while developing that you would in production (SQLite3 is very lenient), then 
in Gemfile, change `gem 'sqlite3'` to `gem 'pg'`.

Furthermore, you'll need to update the [database.yml](config/database.yml) file.
Empty the file and copy the following:

    development:
      adapter: postgresql
      database: boilerplate_dev
      host: localhost
      pool: 5
      timeout: 5000
      
If you run into errors, attempt to run `rake db:create`.
Furthermore, don't forget to `rake db:migrate` into your database.
