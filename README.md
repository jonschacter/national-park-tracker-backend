# README

This backend for the National Park Tracker app allows you to maintain and host the required data for users, visits and parks. 

Note: The NPS.gov API response time was too slow to build a helpful application around. I have included a script in the seed file to save and update their data into this database for quicker information retrieval. Be sure to use seed file when first setting up the application and any time you would like to update the park data. This may take several minutes.

## Installation

execute:

    $ bundle install
    $ rails db:migrate

download or update the NPS park data:

    $ rails db:seed

and launch the local host server with

    $ rails s

## Related repositories

[National Park Tracker Frontend](https://github.com/jonschacter/national-park-tracker-frontend)

## Video Walkthrough

https://youtu.be/Gpk5dYMYY2E

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jonschacter/national-park-tracker-backend

## License

The application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).