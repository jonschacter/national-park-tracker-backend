startArray = [0, 49, 99, 149, 199, 249, 299, 349, 399, 449]

startArray.each do |start|
    Park.scrape(start)
end
