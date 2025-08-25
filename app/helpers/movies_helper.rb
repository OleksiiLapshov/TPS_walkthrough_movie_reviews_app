module MoviesHelper
  def shortener(movie)
    truncate(movie.description, length: 35, separator: " ")
  end

  def total_gross(movie)
    movie.flop? ? "Flop" : number_to_currency(movie.total_gross, precision: 0)
  end

  def formated_date(movie)
    movie.released_on.strftime("%B %Y")
  end

  def average_stars(movie)
    if movie.average_stars.zero?
      content_tag(:strong, "No reviews")
    else
          pluralize(number_with_precision(movie.average_stars, precision: 1), "star")
    end
  end

end
