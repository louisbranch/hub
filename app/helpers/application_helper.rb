module ApplicationHelper

  def title
    base_title = "diablohub"
    if @title.nil?
      base_title
    else
      "#{base_title} :: #{@title}"
    end
  end
  
  def description
    if !@description.nil?
      @description
    end
  end

  def array_chars
    char_array = CharClass.all.map { |char| [char.name, char.id] }
  end

  def array_skills
    skill_array = Skill.all.map { |skill| ["#{skill.char_class.name} - #{skill.name}", skill.id] }
  end

  def array_skill_types
    skill_type_array = SkillType.all.map { |skill_type| [skill_type.name, skill_type.id] }
  end

  def array_runes
    rune_array = Rune.all.map { |rune| [rune.name, rune.id] }
  end
  
  def highlight_digits(text)
  # Based on ActionView::Helpers::TextHelper#highlight
    highlighter = '<mark>\1</mark>'
    matcher = /(\d+%?)(?!(?:[^<]*?)(?:["'])[^<>]*>)/
    text.gsub(matcher, highlighter).html_safe
  end
  
  def markdown(text)
  options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis]
    Redcarpet.new(text, *options).to_html.html_safe
  end

  class MenuTabBuilder < TabsOnRails::Tabs::Builder
    def tab_for(tab, name, options)
      content = @context.link_to(name, options)
      if current_tab?(tab)
        @context.content_tag(:li, content, :class => 'active')
      else
        @context.content_tag(:li, content)
      end
    end
  end
end
