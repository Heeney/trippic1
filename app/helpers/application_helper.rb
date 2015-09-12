module ApplicationHelper
    
    def gravatar_for(traveller, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(traveller.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: traveller.travellername, class: "gravatar")
    end
end
