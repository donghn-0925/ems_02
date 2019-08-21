function insertAnswer() {
  var counter = parseInt(document.getElementById('count-answer').innerHTML) + 1;
  document.getElementById('answer-form').innerHTML +=  '<textarea id="answer-'+ counter + '" name="answer-'+ counter + '"></textarea>';
  document.getElementById('count-answer').innerHTML = counter;
};

function insertCorrectAnswer() {
  var counter = parseInt(document.getElementById('count-correct-answer').innerHTML) + 1;
  document.getElementById('correct-answer-form').innerHTML +=  '<textarea id="correct-answer-'+ counter + '" name="correct-answer-'+ counter + '"></textarea>';
  document.getElementById('count-correct-answer').innerHTML = counter;
};
function createParamsData(){
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
