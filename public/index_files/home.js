(function() {

  (function($) {
    var documentHandler;
    documentHandler = function() {
      var $current;
      $current = (this === document ? $(this) : $(this).contents());
      $current.mousemove(function(e) {
        return jQuery.mlp = {
          x: e.pageX,
          y: e.pageY
        };
      });
      return $current.find("iframe").load(documentHandler);
    };
    $.mlp = {
      x: 0,
      y: 0
    };
    $(documentHandler);
    return $.fn.ismouseover = function(overThis) {
      var result;
      result = false;
      this.eq(0).each(function() {
        var $current, offset;
        $current = ($(this).is("iframe") ? $(this).contents().find("body") : $(this));
        offset = $current.offset();
        return result = offset.left <= $.mlp.x && offset.left + $current.outerWidth() > $.mlp.x && offset.top <= $.mlp.y && offset.top + $current.outerHeight() > $.mlp.y;
      });
      return result;
    };
  })(jQuery);

  $(function() {
    $("form input[id], select[id]").each(function(index, element) {
      var div, offset;
      div = $('<div class="conf_panel" target="' + $(element).attr("id") + '">R<input type="checkbox">W<input type="checkbox"></div>');
      $("body").append(div);
      offset = $(element).offset();
      offset.left += $(element).width();
      offset.top -= 30;
      div.offset(offset);
      $(element).mouseover(function() {
        return div.css("opacity", 1);
      }).mouseout(function() {
        return setTimeout((function() {
          if (!(div.ismouseover() || $(element).ismouseover())) {
            return div.css("opacity", 0.2);
          }
        }), 1000);
      });
      return div.mouseover(function() {
        return div.css("opacity", 1);
      }).mouseout(function() {
        return setTimeout((function() {
          if (!(div.ismouseover() || $(element).ismouseover())) {
            return div.css("opacity", 0.2);
          }
        }), 1000);
      });
    });
    $("div.conf_panel").hide();
    return $('#admin_mode').click(function() {
      return $("div.conf_panel").toggle();
    });
  });

}).call(this);
