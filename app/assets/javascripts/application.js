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
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require bootstrap-tagsinput
//= require twitter/typeahead
//= require twitter/typeahead.min
//= require data-confirm-modal
//= require tinymce-jquery
//= require jasny-bootstrap.min
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

//Dependent dropdowns (not used anymore)
// GET json from /{dropdown id}/ with parameter "observed"
$(document).ready(function(){
    $('select[data-option-dependent=true]').each(function(){
        var observer_id = $(this).attr('id')
        var observed_id = $('#'+$(this).data('option-observed'))
        var url = $(this).attr('id')

        observed_id.on('change', function(){
            $.ajax({url: url, 
            type: 'GET',
            dataType: 'script',
            data: {
                observer_id: observer_id,
                observed_id: observed_id.val()
            }})
        })
    })
});