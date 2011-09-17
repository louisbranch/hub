module ApplicationHelper

  def array_chars
    char_array = CharClass.all.map { |char| [char.name, char.id] }
    
  end
  
  def array_skill_type_by_char
    skill_type_array = SkillType.all.map { |skill_type| ["#{skill_type.char_class.name} - #{skill_type.main} - #{skill_type.sub}", skill_type.id] }
  end
  
end
