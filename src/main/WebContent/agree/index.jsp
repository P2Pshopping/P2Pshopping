("use strict");
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="./styles.css" rel="stylesheet" type="text/css" />
<html>
<head>
<meta charset="UTF-8">
   <script type="text/javascript"> 


const form = document.querySelector('#form__wrap'); // 데이터를 전송하는 Form 
const checkAll = document.querySelector('.terms__check__all input'); // 모두 동의 체크박스
const checkBoxes = document.querySelectorAll('.input__check input'); // 모두 동의를 제외한 3개의 체크박스
const submitButton = document.querySelector('button'); // 확인 버튼

const agreements = {
  termsOfService: false,
  privacyPolicy: false,
  allowPromotions: false
};

form.addEventListener("submit", (e) => e.preventDefault());

checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

function toggleCheckbox(e) {
  const { checked, id } = e.target;
  agreements[id] = checked;
  this.parentNode.classList.toggle("active");
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { termsOfService, privacyPolicy, allowPromotions } = agreements;
  if (termsOfService && privacyPolicy && allowPromotions) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { termsOfService, privacyPolicy } = agreements;
  if (termsOfService && privacyPolicy) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

checkAll.addEventListener("click", (e) => {
  const { checked } = e.target;
  if (checked) {
    checkBoxes.forEach((item) => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add("active");
    });
  } else {
    checkBoxes.forEach((item) => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove("active");
    });
  }
  toggleSubmitButton();
});

</script>
</head>

