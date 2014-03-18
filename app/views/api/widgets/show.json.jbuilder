json.widget do |widget|
  widget.id               @widget.id
  widget.title            @widget.title
  json.user do |user|
    user.id             @widget.user.id
    user.name           @widget.user.name
  end
  json.features @widget.features do |feature|
    json.title       feature.title
  end
end
