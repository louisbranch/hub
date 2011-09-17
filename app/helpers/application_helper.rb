module ApplicationHelper

  def array_chars
    char_array = CharClass.all.map { |char| [char.name, char.id] }
  end
  
  def array_skills
    skill_array = Skill.all.map { |skill| ["#{skill.skill_type.char_class.name} - #{skill.name}", skill.id] }
  end
  
  def array_skill_type_by_char
    skill_type_array = SkillType.all.map { |skill_type| ["#{skill_type.char_class.name} - #{skill_type.main} - #{skill_type.sub}", skill_type.id] }
  end
  
  def array_runes
    rune_array = Rune.all.map { |rune| [rune.name, rune.id] }
  end
  
end
