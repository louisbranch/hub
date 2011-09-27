window.onload = function(){
    quotes();
    skillFilter();
    runesHover();
    buildClassSelector();
    //buildSkillTab()
}

function quotes(){
  if(document.getElementById("img_classes")){
    var img_classes = document.getElementById("img_classes");
    var img_links = img_classes.getElementsByTagName("a");
    img_links[0].className = "";
    var random_number = Math.floor(Math.random()*5)
    var random_class = img_links[random_number];
    setQuote(random_class);
    for(var i=0;i<img_links.length;i++){
      img_links[i].onmouseover = function(){
        for(var i=0;i<img_links.length;i++){img_links[i].className = "";}
        setQuote(this)
      }
    }
  }
}

function setQuote(a){
  var div_quote = document.getElementById("quotes");
  var quote_title = div_quote.getElementsByTagName("h3")[0];
  var quote_block = div_quote.getElementsByTagName("blockquote")[0];
  a.className ="img_active";
  quote_title.innerHTML = a.getAttribute("data-title");
  quote_block.innerHTML = a.getAttribute("data-quote");
}

function skillFilter(){
  if(document.getElementById("skill_filters")){
  var filter_block = document.getElementById("skill_filters");
  var filter_links = filter_block.getElementsByTagName("a");
      for(var i=0;i<filter_links.length;i++){
        filter_links[i].onclick = function(){
          for(var i=0;i<filter_links.length;i++){filter_links[i].className = "";}
          filterSkillByType(this)
        return false
      }
    }
  }
}

function filterSkillByType(a){
  a.className = "filter_active";
  var filter_type = a.getAttribute("data-filter")
  var skill_block = document.getElementById("class_skills");
  var skills = skill_block.getElementsByTagName("article");
  for(var i=0;i<skills.length;i++){
    var all_skills = "all"
    var skill_class = skills[i].getAttribute("class");
    if(filter_type == skill_class){
       skills[i].style.display = "";
    }
    else if (filter_type == all_skills){
       skills[i].style.display = "";
    }
    else{
       skills[i].style.display = "none";
    }
  }
}

function runesHover(){
	if(document.getElementById("class_skills")){
		var class_skills = document.getElementById("class_skills");
		var img_list = class_skills.getElementsByTagName("img");
		for(var i=0;i<img_list.length;i++){
			if(img_list[i].getAttribute("data-tooltip-url")){
				var data_url = img_list[i].getAttribute("data-tooltip-url")
				$(img_list[i]).qtip({
					 content: {
							text: 'Loading...', // Loading text...
							ajax: {
								 url: data_url, // URL to the JSON script
								 type: 'GET', // POST or GET
							}
					 },
						style: {
		    			classes: 'ui-tooltip-dark ui-tooltip-shadow'
	 					},
	 					position: {
		 					viewport: $(window),
							my: 'bottom center',  // Position my top left...
							at: 'top center', // at the bottom right of...
							target: $(img_list[i]), // my target
							effect: false
					 }
				});
			}
		}
	}
}

function buildClassSelector(){
  if(document.getElementById("class_selection")){

    var select_block = document.getElementById("class_selection");
    var class_labels = select_block.getElementsByTagName("label");
    var class_radios = select_block.getElementsByTagName("input");
    var class_display = document.getElementById("class_display");
    var fixed_name = class_display.innerHTML

    for(var i=0;i<class_labels.length;i++){

      class_labels[i].onmouseover = function(){
        class_name = this.getAttribute("data-name");
        class_display.innerHTML = class_name;
      }

      class_labels[i].onmouseout = function(){
        class_display.innerHTML = fixed_name;
      }

      class_labels[i].onclick = function(){
      for(var i=0;i<class_labels.length;i++){class_labels[i].className = "";}
      fixed_name = this.getAttribute("data-name");
      this.className = "active";
      active_url = this.getAttribute("data-active");
      passive_url = this.getAttribute("data-passive");
      }
    }
  }

  var next_step = document.getElementById("build_next");
  var build_title = document.getElementById("build_name");
  var error_explanation = document.getElementById("error_explanation");
  var build_info = document.getElementById("build_info");
  var step_two = document.getElementById("step_two");
  var build_heading = document.getElementById("build_heading");

  next_step.onclick = function(){
    if(!fixed_name == ""){
      if(build_title.value.length){
        error_explanation.innerHTML = "";
        error_explanation.style.display = "none";

        build_info.style.display = "none";
        step_two.style.display = "";
        build_heading.innerHTML = build_title.value;
        build_heading.className = "new_title";

        $.ajax({
					url: active_url,
					success: function(data){
							$('#active_block').append(data);
							skillsActions();
						}
				});

        $.ajax({
					url: passive_url,
					success: function(data){
							$('#passive_block').html(data);
							elementHover();
						}
				});
      }
      else{
        error_explanation.innerHTML = "Enter a title"
        error_explanation.style.display = "";
      }
    }
    else{
      error_explanation.innerHTML = "Choose a class"
      error_explanation.style.display = "";
    }
  }
}

/*
function buildSkillTab(){
	if(document.getElementById("skills_tabs")){
		var tab_active = document.getElementById("tab_active");
		var tab_passive = document.getElementById("tab_passive");

		tab_active.onclick = function(){
			this.className = "tab_on";
			tab_passive.className = "";
			document.getElementById("active_block").style.display = "";
			document.getElementById("passive_block").style.display = "none";
		}
		tab_passive.onclick = function(){
			this.className = "tab_on";
			tab_active.className = "";
			document.getElementById("active_block").style.display = "none";
			document.getElementById("passive_block").style.display = "";
		}
	}
}
*/

function skillsActions(){

	var active_block = document.getElementById("active_block");
	var skills = active_block.getElementsByTagName("li");

	for(var i=0;i<skills.length;i++){
		var tooltip_url =	skills[i].getAttribute("data-tooltip-url")
		var drilldown_url =	skills[i].getAttribute("data-drilldown-url")
		var skill_name =	skills[i].getAttribute("id")

		elementHover(skills[i],tooltip_url);
		skills[i].onclick = function(){insertSkill(this)};
	}
}

function elementHover(e,url){
	$(e).qtip({
		 content: {
				text: 'Loading...', // Loading text...
				ajax: {
				   url: url, // URL to the JSON script
				   type: 'GET', // POST or GET
				}
		 },
		  style: {
  			classes: 'ui-tooltip-dark ui-tooltip-shadow'
			},
			position: {
				viewport: $(window),
				my: 'bottom center',  // Position my top left...
				at: 'top center', // at the bottom right of...
				target: e, // my target
				effect: false
		 }
	});
}

function insertSkill(e){
	url = e.getAttribute("data-drilldown-url");
	var build_skills = document.getElementById("build_skills");
	var skill_slots = build_skills.getElementsByTagName("li");
	for(var i=0;i<skill_slots.length;i++){
	var slot_selected = skill_slots[i].getAttribute("data-selected");
		if(!slot_selected){
			e.className = "skill_selected"
			var skill_title = e.getAttribute("data-title");
			var skill_details = e.getAttribute("data-details");
			var skill_img = e.getAttribute("data-img");
			skill_slots[i].setAttribute("data-selected", true);
			skill_slots[i].getElementsByTagName("div")[0].style.display = "none";
			skill_slots[i].getElementsByTagName("div")[1].style.display = "";
			skill_slots[i].getElementsByTagName("h5")[1].innerHTML = skill_title;
			skill_slots[i].getElementsByTagName("p")[1].innerHTML = skill_details;
			skill_slots[i].getElementsByTagName("img")[0].setAttribute("src", skill_img);
			var slot_id = skill_slots[i].getAttribute("data-id");

			e.onclick = function(){
				e.className = "";
				clearSkillSlot(skill_slots[i],this,url);
				e.onclick = function(){insertSkill(e)};
			}

			skillDrillDown(skill_slots[i],url,slot_id);
			skillSlotActions(skill_slots[i],slot_id,e,url);

			break
		}
	}
}

function skillDrillDown(e,url,id){
	var drilldown_block = document.getElementById("drilldown_block");
	var drilldown_sections = drilldown_block.getElementsByTagName("section");
	for(var i=0;i<drilldown_sections.length;i++){
		if(id == drilldown_sections[i].getAttribute("data-id") ){
			var target = drilldown_sections[i];
			target.style.display = "";
			$.ajax({
				url: url,
				success: function(data){
						$(target).html(data);
						runesActions();
					}
			});
		}
		else {drilldown_sections[i].style.display = "none";};
	}
}

function runesActions(){

	var drilldown_block = document.getElementById("drilldown_block");
	var runes = drilldown_block.getElementsByTagName("li");
	for(var i=0;i<runes.length;i++){
		var tooltip_url =	runes[i].getAttribute("data-tooltip-url");
		if(tooltip_url){
			elementHover(runes[i],tooltip_url);
		}
		runesSelect(runes[i])
	}
}

function runesSelect(e){
	var build_skills = document.getElementById("build_skills");
	var skill_slots = build_skills.getElementsByTagName("li");
	var section_block = e.parentNode;
	var runes = section_block.getElementsByTagName("li");

	e.onclick = function(){
		for(var i=0;i<runes.length;i++){runes[i].className = "";}
		this.className = "rune_active";
	 	var rune_img = e.getAttribute("data-img");
	 	var parent_id = section_block.parentNode.getAttribute("data-id");

	 	for(var i=0;i<skill_slots.length;i++){
	 		if(skill_slots[i].getAttribute("data-id") == parent_id){
	 			skill_slots[i].getElementsByTagName("img")[2].setAttribute("src", rune_img);
 			}
	 	}
	}
}

function skillSlotActions(e,id,skill_src,url){
	var skill_img = e.getElementsByTagName("img")[0];
	var clear_img = e.getElementsByTagName("img")[1];
	var rune_img = e.getElementsByTagName("img")[2];
	var drilldown_block = document.getElementById("drilldown_block");
	var drilldown_sections = drilldown_block.getElementsByTagName("section");

	skill_img.onmouseover = function(){
		skill_img.style.display = "none";
		clear_img.style.display = "";
	}
	clear_img.onmouseout = function(){
		clear_img.style.display = "none";
		skill_img.style.display = "";
	}

	clear_img.onclick = function(){clearSkillSlot(e,skill_src,url)}

	rune_img.onclick = function(){
	for(var i=0;i<drilldown_sections.length;i++){
		var target = drilldown_sections[i];
		target.style.display = "none";
		if(id == drilldown_sections[i].getAttribute("data-id") ){
			target.style.display = "";
			}
		}
	}
}

function clearSkillSlot(e,skill_src,url){
	var drilldown_block = document.getElementById("drilldown_block");
	var drilldown_sections = drilldown_block.getElementsByTagName("section");
	var skill_img = e.getElementsByTagName("img")[0];
	var slot_id = e.getAttribute("data-id");

	for(var i=0;i<drilldown_sections.length;i++){
		if(slot_id == drilldown_sections[i].getAttribute("data-id") ){
			drilldown_sections[i].style.display = "none";
			drilldown_sections[i].innerHTML = "";
		}
	}

	e.setAttribute("data-selected", "");
	e.getElementsByTagName("div")[0].style.display = "";
	e.getElementsByTagName("div")[1].style.display = "none";
	e.getElementsByTagName("img")[0].setAttribute("src", "/assets/skills/empty.png");
	e.getElementsByTagName("img")[2].setAttribute("src", "/assets/runes/rune_empty.png");
	e.getElementsByTagName("img")[0].onmouseover = null;
	e.getElementsByTagName("img")[1].onmouseover = null;
	e.getElementsByTagName("img")[2].onclick = null;
	skill_src.className="";
	skill_src.onclick = function(){insertSkill(skill_src)};
}

