function insertAnswer() {
  var counter = parseInt(document.getElementById('count_answer').innerHTML) + 1;
  document.getElementById('answer_form').innerHTML +=  '<div class="row"><input type="checkbox" id="'+counter+'"><textarea id="answer_'+ counter + '" name="answer_'+ counter + '"></textarea></div>';
  document.getElementById('count_answer').innerHTML = counter;
};

function changeAnswerForm(index){
  if (index == 2){
    document.getElementById('answer_form').innerHTML =  '<div class="row"><textarea id="text_answer" name="answers"></textarea></div>';
    document.getElementById('selected_answer').hidden = true;
  } else {
    document.getElementById('selected_answer').hidden = false;
    document.getElementById('answer_form').innerHTML = '';
  }
}

function createQuestionData(){
  var counter = parseInt(document.getElementById('count_answer').innerHTML);
  temp_answer = document.getElementById('answer_1').value;
  for (i=2; i <= counter; i++){
    element_id = 'answer_' + i;
    temp_answer += '_____' + document.getElementById(element_id).value;
  }
  document.getElementById('all_answers').value = temp_answer;
  
  counter = parseInt(document.getElementById('count_correct_answer').innerHTML);
  temp_answer = document.getElementById('correct_answer_1').value;
  for (i=2; i <= counter; i++){
    element_id = 'correct_answer_' + i;
    temp_answer += '_____' + document.getElementById(element_id).value;
  }
  document.getElementById('all_correct_answers').value = temp_answer;

  if (index == 2){
    temp_answer = document.getElementById('text_answer').value;
    document.getElementById('all_correct_answers').value = temp_answer;
  } else{

  }

}
