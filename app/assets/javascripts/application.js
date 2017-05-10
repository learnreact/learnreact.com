//= require rails-ujs
//= require turbolinks
//= require_tree .

// Element.closest polyphil
if (window.Element && !Element.prototype.closest) {
    Element.prototype.closest =
    function(s) {
        var matches = (this.document || this.ownerDocument).querySelectorAll(s),
            i,
            el = this;
        do {
            i = matches.length;
            while (--i >= 0 && matches.item(i) !== el) {};
        } while ((i < 0) && (el = el.parentElement));
        return el;
    };
}

document.addEventListener("turbolinks:load", function() {
  // KLUDGE
  var userDropdown = document.getElementById("userDropdown");

  userDropdown.addEventListener("click", function (e) {
    var menu = e.target
      .closest("[data-dropdown]")
      .querySelector("[data-dropdown-menu]")

    return menu.style.visibility == "visible"
      ? menu.style.visibility = "hidden"
      : menu.style.visibility = "visible"
  })
})
