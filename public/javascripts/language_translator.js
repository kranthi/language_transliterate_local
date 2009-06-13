
google.load("language", "1")
function bind_scope(object,func,args){
    if(args){
      return function () {
        for(var i=arguments.length; i>= 0; i--){
              if(arguments[i]){
              args.unshift(arguments[i]);
              }
        }
     return func.apply(object, args);
    };
 }
  else{
return function () {
    return func.apply(object, arguments);
};
    }
}



function translated_handle(result, textarea_id) {
if (!result.error) {
   var container = document.getElementById(textarea_id);
   container.value = result.translation;
   } 
}

function detect_language(result,id,text){
if (!result.error && result.language) {
 var test_language = google.language.isTranslatable($('language_select').value);
if(test_language == false){
    alert("Translation is in progress for this language.Please try another one");
      }else{
         google.language.translate(text, result.language, $('language_select').value, bind_scope(window,translated_handle,[id]));
      }
    }
        
}

function translator(){
    var ids = document.getElementsByTagName('textarea');
    for(var i=0; i<ids.length;i++){
        var textarea_value = ids[i];		     
      if(textarea_value.value!=""){
        var test_language = google.language.isTranslatable($('language_select').value);          
        console.log($('language_select').value,"destination language");
        google.language.detect(textarea_value.value, bind_scope(window,detect_language,[ids[i].id,ids[i].value]));

       }
    }
 } 


function populateList() {
selectElement = document.getElementById('language_select');
for (l in google.language.Languages) {
            optionElement = null;
            optionElement = document.createElement('option');
            optionElement.innerHTML = l; 
            optionElement.value = google.language.Languages[l]; 
            selectElement.appendChild(optionElement);		     
    }
}
window.onload=populateList;


