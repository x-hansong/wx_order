<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>submit demo</title>
<style>
p {
margin: 0;
color: blue;
}
div,p {
margin-left: 10px;
}
span {
color: red;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<p>Type 'correct' to validate.</p>
<form action="javascript:alert( 'success!' );">
<div>
<input type="text">
<input type="submit">
</div>
</form>
<span></span>
<script>
$( "form" ).submit(function( event ) {
if ( $( "input:first" ).val() === "correct" ) {
$( "span" ).text( "Validated..." ).show();
return;
}
$( "span" ).text( "Not valid!" ).show().fadeOut( 1000 );
event.preventDefault();
});
</script>
</body>
</html>