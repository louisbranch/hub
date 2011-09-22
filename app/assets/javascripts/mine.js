window.onload = function(){
    quotes();
    checkLoginForm();
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
