json.array! @widgets do |widget|
  json.id                      widget.id
  json.title                   widget.title
  json.developer               widget.user.name
  json.num_features            widget.features.length
end
