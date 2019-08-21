function createAnswerSheetData(){
  var counter = parseInt(document.getElementById('count-answer').innerHTML);
  temp_answer = document.getElementById('answer-1').value;
  for (i=2; i <= counter; i++){
    element_id = 'answer-' + i;
    temp_answer += '-----' + document.getElementById(element_id).value;
  }
  document.getElementById('all_answers').value = temp_answer;
  
  counter = parseInt(document.getElementById('count-correct-answer').innerHTML);
  temp_answer = document.getElementById('correct-answer-1').value;
  for (i=2; i <= counter; i++){
    element_id = 'correct-answer-' + i;
    temp_answer += '-----' + document.getElementById(element_id).value;
  }
  document.getElementById('all_correct_answers').value = temp_answer;
}