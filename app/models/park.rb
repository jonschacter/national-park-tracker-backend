class Park < ApplicationRecord
    has_many :addresses
    has_many :images

    def self.scrape(url)
        resp = RestClient.get(url)
        resp_hash = JSON.parse(resp.body, symbolize_names:true)
        array = resp_hash[:data]
        array.each do |park|
            name = park[:name]
            states = park[:states]
            description = park[:description]
            park_code = park[:parkCode]
            images = park[:images]
            addresses = park[:addresses]

            parkObj = Park.create(name: name, states: states, description: description, park_code: park_code)
            
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
