//= require active_admin/base
//= require typeahead.bundle
//= require bootstrap-tagsinput
//= require select2.full.min

//= require redactor
//= require redactor/source
//= require redactor/codemirror
//= require redactor/alignment
//= require redactor/table
//= require redactor/video
//= require redactor/imagelink

$(document).ready(function() {
  // Tags Input
  var tags = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: {
      url: '/tags.json',
      cache: false,
      filter: function(list) {
        return $.map(list, function(tag) {
          return { name: tag }; });
      }
    }
  });
  tags.initialize();

  $('input#product_all_tags').tagsinput({
    typeaheadjs: {
      name: 'tags',
      displayKey: 'name',
      valueKey: 'name',
      source: tags.ttAdapter()
    }
  });

  $(".select2").select2();
  $(".button.has_many_add").click(function() {
    setTimeout(function(){$(".select2").select2()}, 300);
  });

  // Redactor editor
  $('#page_content_en, #page_content_es, #page_content_pt').redactor({
    plugins: ['inlinestyle', 'alignment', 'table', 'video', 'textexpander', 'imagelink'],
    imageUpload: '/images',
    imageResizable: true,
    imagePosition: true
  });
})
