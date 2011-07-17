module ApplicationHelper
  def full_title
    titler = title
    first = titler.shift
    "<span>#{first}</span> #{titler.join(' ')}"
  end

  def page_title
    'VPG ' + title.join(' ')
  end
end
