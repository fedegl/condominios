jQuery.fn.rest_in_place = function(url, objectName, attributeName) {
  var e = this;
  function clickFunction() {
    var oldValue = e.html();
    e.html('<form action="javascript:void(0)" style="display:inline;"><input type="text" name="textfield" value="' + oldValue + '"/><input type="submit" value="Guardar"/><input type=button value="Cancelar" /></form>');
    e.find("input:first").select();
    e.unbind('click');
    e.find("[type=button]").click(function(){
    	e.html(oldValue);
      setTimeout(function(){ e.click(clickFunction)}, 100);
    })   
    e.find("form").submit(function(){
      var value = e.find("input").val();
      e.html("Guardando...");
      jQuery.ajax({
        "url" : url,
        "type" : "post",
        "beforeSend"  : function(xhr){ xhr.setRequestHeader("Accept", "application/json"); },
        "data" : "_method=put&"+objectName+'['+attributeName+']='+encodeURIComponent(value)+(window.rails_authenticity_token ? "&authenticity_token="+encodeURIComponent(window.rails_authenticity_token) : ''),
        "success" : function(){
          jQuery.ajax({
            "url" : url,
            "beforeSend"  : function(xhr){ xhr.setRequestHeader("Accept", "application/json"); },
            "success" : function(json){
              e.html(eval('(' + json + ')' )[objectName][attributeName]);
              e.click(clickFunction);
            }
          });
        }
      });
      return false;
    })
  }
  this.click(clickFunction);
}

jQuery(function(){
  jQuery(".rest_in_place").each(function(){
    var e = jQuery(this);
    var url; var obj; var attrib;
    e.parents().each(function(){
      url    = url    || jQuery(this).attr("url");
      obj    = obj    || jQuery(this).attr("object");
      attrib = attrib || jQuery(this).attr("attribute");
    });
    e.parents().each(function(){
      if (res = this.id.match(/^(\w+)_(\d+)$/i)) {
        obj = obj || res[1];
      }
    });
    url    = e.attr("url")       || url    || document.location.pathname;
    obj    = e.attr("object")    || obj;
    attrib = e.attr("attribute") || attrib;
    e.rest_in_place(url, obj, attrib);
  });
});

