//= require active_admin/base
//= require typeahead.bundle
//= require bootstrap-tagsinput

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
})
