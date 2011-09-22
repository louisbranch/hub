window.onload = function(){
    quotes();
    skillFilter();
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
