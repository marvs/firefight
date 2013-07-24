# http://jasonseifer.com/2010/03/10/rails-date-formats

custom_formats = {
  :normal_datetime  => "%d %B %Y %l:%M%P %Z",
  :normal_date      => "%d %b %Y"
}

Time::DATE_FORMATS.merge!(custom_formats)
