var guests = {}

guests.parse_data = function(event, guests){
  var data = {};
  data['event'] = event;
  data['guests'] = [];
  var arrayOfLines = $('#new_guests').val().split('\n');
  for (var i = 0; i < arrayOfLines.length; i++) {
    name_email = arrayOfLines[i].split(',');
    data['guests'].push({'name':name_email[0].trim(),
        'email':name_email[1].trim()});
  }
  console.log(data);
  return data;
}


guests.onSubmit = function(event){
  event.preventDefault();
  data = guests.parse_data($(this).attr('id'), $('#new_guests').val());

  var guests_request = $.ajax({url:'/guests/add',
                        method: 'POST',
                        data: JSON.stringify(data),
                        dataType: 'html',
                        contentType: 'application/json'});

 guests.onSaveSuccess = function(response) {
    console.log(response)
    $('#guest-list').html(response);
    $('#new_guests').val('');
  }

  guests.onSaveFailure = function(err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  guests_request.done(guests.onSaveSuccess);
  guests_request.fail(guests.onSaveFailure);

}

$(document).ready(function(){
  $('.guests-form').on('submit', guests.onSubmit);
});

