# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#Post Actor dropdown button
$ ->
    console.log("idea.js ready for post_actor dropdown")
    $("#post_actor_dropdown li a").click ->
        post_actor_cat = $(this).attr("cat")
        post_actor_id = $(this).attr("value")
        console.log(post_actor_cat + ":" + post_actor_id + ":" + $(this).text())
        $("#post_actor_button_text").html($(this).text())
        $("#post_actor_cat").prop("value", post_actor_cat)
        $("#post_actor_id").prop("value", post_actor_id)

#Add TinyMCE Class to Bootstrap form
$ ->
    console.log("idea.js ready for adding class")
    $("#idea_brief_how").addClass("tinymce")
    script = $("#edit script")
    console.log(script.text())
    $.globalEval(script.text())