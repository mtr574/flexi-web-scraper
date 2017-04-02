$ ->
  $('input[name="filter_reviews"]').keyup ->
    self = $(this)
    reviews = $('.review')
    reviews.hide()
    reviews.find('.body:contains(' + self.val() + ')').parent().show()
    return
  return
