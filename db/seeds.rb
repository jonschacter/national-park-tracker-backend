
# jon = User.create(username: "jschacter", password: "password")

# jon = User.first
# jon.visits.create(start_date: "2020-05-30", end_date: "2020-05-31", park_code: "brca")
# jon.visits.create(start_date: "2020-06-15", end_date: "2020-06-20", park_code: "saan")

# URL = "https://developer.nps.gov/api/v1/parks?&limit=5&api_key=OwNvFO9PgnzaBuEJMEol0fpU5JwIUYO1WJbxGbL9"

Park.scrape("https://developer.nps.gov/api/v1/parks?&start=449&api_key=OwNvFO9PgnzaBuEJMEol0fpU5JwIUYO1WJbxGbL9")