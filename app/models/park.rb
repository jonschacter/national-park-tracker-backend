class Park < ApplicationRecord
    has_many :addresses
    has_many :images
    has_many :visits
    has_many :reviews, through: :visits

    # NPS API was too slow and unresponsive to be used directly through my frontend. This is scrape class method that I can run weekly to scrape and create/update relevant park data in my API 
    def self.scrape(startInt)
        url = "https://developer.nps.gov/api/v1/parks?&start=#{startInt}&api_key=#{ENV['NPS_API_KEY']}"
        resp = RestClient.get(url)
        resp_hash = JSON.parse(resp.body, symbolize_names:true)
        array = resp_hash[:data]
        array.each do |park|
            name = park[:name]
            states = park[:states]
            description = park[:description]
            images = park[:images]
            addresses = park[:addresses]
            code = park[:parkCode]

            parkObj = Park.find_or_create_by(code: code)
            parkObj.update(name: name, states: states, description: description, images:[], addresses:[])
            images.each do |image|
                url = image[:url]
                caption = image[:caption]
                alt = image[:altText]
                
                imageObj = parkObj.images.create(url: url, caption: caption, alt: alt)
            end

            addresses.each do |address|
                if address[:type] == "Physical"
                    line1 = address[:line1]
                    line2 = address[:line2]
                    line3 = address[:line3]
                    city = address[:city]
                    state = address[:stateCode]
                    postal = address[:postalCode]

                    addressObj = parkObj.addresses.create(line1: line1, line2: line2, line3: line3, city: city, state: state, postal: postal)
                end
            end
        end
    end
end

