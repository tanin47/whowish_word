/**
 * @author Tanin
 */
$w.ajaxSetup({
  beforeSend: function(xhr) {
    xhr.setRequestHeader('X-CSRF-Token', $w('meta[name="csrf-token"]').attr('content'));
  }
}); 

