window.onload = function(){
    quotes();
    skillFilter();
    runesHover();
    buildClassSelector();
    buildSkillTab()
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
      build_url = this.getAttribute("data-url");
      }
    }
  }

  var next_step = document.getElementById("build_next");
  var build_title = document.getElementById("build_name");
  var error_explanation = document.getElementById("error_explanation");
  var build_info = document.getElementById("build_info");
  var build_skills = document.getElementById("build_skills");
  var build_heading = document.getElementById("build_heading");

  next_step.onclick = function(){
    if(!fixed_name == ""){
      if(build_title.value.length){
        error_explanation.innerHTML = "";
        error_explanation.style.display = "none";

        build_info.style.display = "none";
        build_skills.style.display = "";
        build_heading.innerHTML = build_title.value;
        build_heading.className = "new_title";

        $.ajax({
					url: build_url,
					success: function(data){
							$('#skills_container').html(data);
							skillsHover();
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

function skillsHover(){
	if(document.getElementById("skills_container")){
		var skills_container = document.getElementById("skills_container");
		var skills = skills_container.getElementsByTagName("li");
		for(var i=0;i<skills.length;i++){
			skill_url =	skills[i].getAttribute("data-url")
			skill_name =	skills[i].getAttribute("id")
			$(skills[i]).qtip({
				 content: {
						text: 'Loading...', // Loading text...
						ajax: {
						   url: skill_url, // URL to the JSON script
						   type: 'GET', // POST or GET
						}
				 },
				  style: {
      			classes: 'ui-tooltip-dark ui-tooltip-shadow'
 					},
 					position: {
						my: 'center left',  // Position my top left...
						at: 'center right', // at the bottom right of...
						target: $(skills[i]), // my target
						effect: false
				 }
			});
		}
	}
}

function runesHover(){
	if(document.getElementById("class_skills")){
		var class_skills = document.getElementById("class_skills");
		var img_list = class_skills.getElementsByTagName("img");
		for(var i=0;i<img_list.length;i++){
			if(img_list[i].getAttribute("data-url")){
				var data_url = img_list[i].getAttribute("data-url")
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

