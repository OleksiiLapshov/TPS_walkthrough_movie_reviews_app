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
end
