module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def message
    puts "hi"
  end
  def get_collection_by_date(year, month)
    articles = get_articles_by_year(year)
    articles = get_articles_by_month(articles, month)
  end

  def get_articles_by_year(year)
    Article.all.filter {|a| a.created_at.year == year}
  end

  def get_articles_by_month(articles=Article.all, month)
    month_number = convert_month_name_to_number(month)
    
    articles = articles.filter do |article| 
      article.created_at.mon == month_number
    end
  end

  def generate_month_list(year)
    articles = get_articles_by_year(year)
    articles.map {|a| a.created_at.mon}.uniq
  end

  def convert_month_name_to_number(month_name)
    case month_name
    when "January"
      1
    when "February"
      2
    when "March"
      3
    when "April"
      4
    when "May"
      5
    when "June"
      6
    when "July"
      7
    when "August"
      8
    when "September"
      9
    when "October"
      10
    when "November"
      11
    when "December"
      12
    else
      0
    end
  end

  def convert_month_number_to_name(month_number)
    case month_number
    when 1
      "January"
    when 2
      "February"
    when 3
      "March"
    when 4
      "April"
    when 5
      "May"
    when 6
      "June"
    when 7
      "July"
    when 8
      "August"
    when 9
      "September"
    when 10
      "October"
    when 11
      "November"
    when 12
      "December"
    else
      "Nada"
    end
  end

  
end
