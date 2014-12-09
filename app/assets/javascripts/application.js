// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// $(function () {
//   $(".choose").click(function (e) {
//     e.preventDefault();
//     var div = $(this);
//     var url = $(this).parents("form").attr("action");
//     console.log(url);
//     $.ajax(url, {
//       type: "PUT",
//       url: url,
//       success: function (data) {
//         if(this.class == "btn-success")
//           div.addClass("btn-danger");
//         else if (this.class == "btn-danger")
//           div.addClass("btn-success");
//         }
//       });
//       // failure: function (data) {
//       //   "this is broken!!!"
//       // }
//     });
//   });
