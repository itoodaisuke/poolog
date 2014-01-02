module ApplicationHelper
  def full_title(page_title)
    base_title = "poolog"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def profile_img(user)
    if user.provider == 'facebook'
      img_url = "https://graph.facebook.com/#{user.uid}/picture?width=320&height=320"
    elsif user.provider == 'twitter'
      img_url = "http://furyu.nazo.cc/twicon/#{user.uid}"
    else
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      img_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    end
    image_tag(img_url, alt: user.name)
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
