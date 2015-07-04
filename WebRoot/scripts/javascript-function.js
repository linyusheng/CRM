function keywordSearch(formId){
	document.pageform.currentpage.value = 1;
	document.getElementById(formId).submit();
}

function searchForPage(page) {
	document.pageform.currentpage.value = page;
	if(document.pageform.currentpage.value != null) {
		document.pageform.submit();
	} 
	else{
		window.alert("当前页面值不能为空!");
	}
}

function removemore() {
	var s = document.getElementsByTagName("input");
	var numberOfCheckBox=0;
	var numberOfChecked=0;
	for(i=0;i<s.length;i++){
		if(s[i].type=="checkbox"){
			numberOfCheckBox++;
			if(s[i].checked)
				numberOfChecked++;
		}
	}
	if(numberOfChecked>0){
		if (window.confirm("你确定要删除所选择的项吗？")) {
			document.removeform.submit();		
		}
	}
	else{
		alert("请选择后再进行删除操作。");
	}
}

function removeone(){
	return window.confirm("你确定要删除该项吗？");
}


function hiddenHTMLMark(markId){
	if(document.getElementById(markId).style.display=="block"){
		document.getElementById(markId).style.display="none"; 
		return true;
	}
	else{
		return false;
	}
}
function showHTMLMark(markId){
	if(document.getElementById(markId).style.display=="none"){		
		document.getElementById(markId).style.display="block";
		return true;
	}
	else{
		return false;
	}
}
function validateRegEx(regex, input, helpText, errorMessageId, helpMessage) {
    if (!regex.test(input)) {
      if (helpText != null){
    	  showHTMLMark(errorMessageId);
    	  helpText.innerHTML = helpMessage;
      }
      return false;
    }
    else {
      if (helpText != null){
    	  if(hiddenHTMLMark(errorMessageId)==true){      	     		
    			showHTMLMark("successmessage");
    			setTimeout("document.getElementById('successmessage').style.display='none';",1000);
    		}
    	  helpText.innerHTML = "";
      }
      return true;
    }
 }
function validateNonEmpty(tip,inputField, helpText,errorMessageId) {
    var m=tip+"不能为空。";
	return validateRegEx(/.+/,
    inputField.value, helpText,errorMessageId,
    m);
}
function validateEmail(tip,inputField,helpText,errorMessageId){

	var m="请在"+tip+"中请输入正确的邮箱格式。如：R7_2X@gmail.com";
	var regex=/.+/;
	if(!regex.test(inputField.value)){
		hiddenHTMLMark(errorMessageId);     	     		
		return true;
	}
	else{
		return validateRegEx(/^[\w\.-_\+]+@[\w-]+(\.\w{2,3})+$/,
				inputField.value, helpText, errorMessageId,
		m);	
	}
}
function validatePersonalNumber(tip,inputField,helpText,errorMessageId){
	var m="请在"+tip+"中请输入正确的手机号码格式(11位数字)。如：15902000001";
	var regex=/.+/;
	if(!regex.test(inputField.value)){
		hiddenHTMLMark(errorMessageId);     	     		
		return true;
	}
	else{
		return validateRegEx(/^\d{11}$/,
		inputField.value, helpText, errorMessageId,
		m);
	}
}

function validatePhoneNumber(tip,inputField,helpText,errorMessageId){
	var m="请在"+tip+"中请输入正确的电话号码格式。如：088-88888888";
	var regex=/.+/;
	if(!regex.test(inputField.value)){
		hiddenHTMLMark(errorMessageId);     	     		
		return true;
	}
	else{
		return validateRegEx(/^\d{3}-\d{8}$/,
		inputField.value, helpText, errorMessageId,
		m);
	}

}
function validateFax(tip,inputField,helpText,errorMessageId){
	var m="请在"+tip+"中请输入正确的传真号码格式。如：088-88888866";
	var regex=/.+/;
	if(!regex.test(inputField.value)){
		hiddenHTMLMark(errorMessageId);     	     		
		return true;
	}
	else{
		return validateRegEx(/^\d{3}-\d{8}$/,
		inputField.value, helpText, errorMessageId,
		m);
	}
}
function validateLength(tip,minLength, maxLength, inputField, helpText,errorMessageId){
	var m=tip+"中数据长度请保持在" + minLength + " ~ " + maxLength +" 字符之间。";
	return validateRegEx(new RegExp("^.{" + minLength + "," + maxLength + "}$"),
    inputField.value, helpText,errorMessageId,
    m);
}


function validateMoney(tip,inputField,helpText,errorMessageId){
	    var regex=/^\d+(\.\d{1,4})?$/; 
	    if(inputField.value.charAt(0)=="0"){   	
	    	if (helpText != null)
	    		if(inputField.value.charAt(1)!="."){
	    	  	  showHTMLMark(errorMessageId);
	    	  	  helpText.innerHTML = tip+"中请输入正确的合同金额格式。如：大于0小于65535的正数（小数点后保留4位数）";
	    	  	  return false;
	    	    }
	    	    
	    }	   	    
	    if(regex.test(inputField.value)){ 
	    	if(!(Math.ceil(inputField.value)>0&&parseInt(inputField.value)<=65535)){
	    		if (helpText != null){
	    	    	  showHTMLMark(errorMessageId);
	    	    	  helpText.innerHTML = tip+"中请输入正确的合同金额格式。如：大于0小于65535的正数（小数点后保留4位数）";
	    	      }
	    	    return false;
	    	  }
	    	else{
	    		if (helpText != null){
	    	    	  if(hiddenHTMLMark(errorMessageId)==true){      	     		
	    	    			showHTMLMark("successmessage");
	    	    			setTimeout("document.getElementById('successmessage').style.display='none';",1000);
	    	    		}
	    	    	  helpText.innerHTML = "";
	    	      }
	    	    return true;
	    	}
	    }
	    
	    if (helpText != null){
	  	  showHTMLMark(errorMessageId);
	  	  helpText.innerHTML = tip+"中请输入正确的合同金额格式。如：大于0小于65535的正数（小数点后保留4位数）";
	    }
	    return false;
} 
function validateLastTime(tip,inputField,helpText,errorMessageId){
    var regex=/^\d{0,20}$/;
    if(inputField.value.charAt(0)=="0"){
    	
    	 if (helpText != null){
    	  	  showHTMLMark(errorMessageId);
    	  	  helpText.innerHTML = tip+"中输入正确的失效格式。如：大于0小于65535的正整数";
    	    }
    	    return false;
    }
    
     if(regex.test(inputField.value)){ 
    	               if(!(parseInt(inputField.value)>=1&&parseInt(inputField.value)<=65535)){
    		                    if (helpText != null){
    	    	                showHTMLMark(errorMessageId);
    	    	                helpText.innerHTML = tip+"中输入正确的失效格式。如：大于0小于65535的正整数";
    	                                }
    	                        return false;
    	                       }
    	                else{
    		                  if (helpText != null){
    	    	                   if(hiddenHTMLMark(errorMessageId)==true){      	     		
    	    			            showHTMLMark("successmessage");
    	    			            setTimeout("document.getElementById('successmessage').style.display='none';",1000);
    	    		                   }
    	    	                     helpText.innerHTML = "";
    	                           }
    	                        return true;
    	                     }
                     }
    
    if (helpText != null){
  	  showHTMLMark(errorMessageId);
  	  helpText.innerHTML = tip+"中输入正确的失效格式。如：大于0小于65535的正整数";
    }
    return false;
}

function validateYear(tip,inputField,helpText,errorMessageId){
	var m=tip+"中请输入正确的年份格式。如：2013";
	return validateRegEx(/^\d{4}$/,
	inputField.value, helpText, errorMessageId,
	m);
}

function validatePassword(oldPassword,newPassword,confirmPassword,helpText,errorMessageId){
	var regex=/^\w{1,16}$/;
	if(regex.test(oldPassword.value)){
		if(regex.test(newPassword.value)){
			if(regex.test(confirmPassword.value)){
				if(newPassword.value!=confirmPassword.value){
					showHTMLMark(errorMessageId);
		  	  		helpText.innerHTML = "新密码和确认密码必须一致。";
		  	  		return false;
				}
				else{
					hiddenHTMLMark(errorMessageId); 
					helpText.innerHTML = "";
					return true;
				}
			}
			else{
				showHTMLMark(errorMessageId);
	  	  		helpText.innerHTML = "确认密码中数据长度请保持在1 ~ 16 字符之间。";
	  	  		return false;
			}
		}
		else{
			showHTMLMark(errorMessageId);
  	  		helpText.innerHTML = "新密码中数据长度请保持在1 ~ 16 字符之间。";
  	  		return false;
		}
	}
	else{
		showHTMLMark(errorMessageId);
	  	helpText.innerHTML = "旧密码中数据长度请保持在1 ~ 16 字符之间。";
	  	return false;
	}
	return true;
}

function start(year){
	var startYear=1900;//起始年份
	var endYear=new Date().getUTCFullYear();//结束年份，默认为当前年份
	var obj=document.getElementById(year);
	for (var i=startYear;i<=endYear;i++)obj.options.add(new Option(i,i));
	obj.options[obj.options.length-1].selected=1;
}


function go(page){
	window.location.href=page;
}

function turn(input,value){

	if(value == 1) $("#panel1").slideToggle("slow");
	if(value == 2) $("#panel2").slideToggle("slow");
	if(value == 3) $("#panel3").slideToggle("slow");
	
	if(input.src.indexOf("down") > 0){
		input.src = "img/icons/icon_up.png"
		flag = false;
		
	}
	else {
		input.src= "img/icons/icon_down.png"
		flag = true;
	}
}

function getSuffix(file_name){
	var result =/\.[^\.]+/.exec(file_name);
	return result;
	}

function validateSuffix(file_name,helpText,errorMessageId){
	if(file_name == "" || file_name == null) return true;
	file_name = file_name.toLowerCase();
	var suffixName=getSuffix(file_name);
	if(suffixName==".jpg"||suffixName==".png"||
		suffixName==".gif"||suffixName==".bmp"){
		hiddenHTMLMark(errorMessageId);
		helpText.innerHTML = "";
		return true;
	}
	else{
		showHTMLMark(errorMessageId);
	  	helpText.innerHTML = "请上传以下格式的图片：.jpg|.png|.gif|.bmp";
	  	return false;
	}
}

function compareDate(dateA,dateB){
	var dA = dateA.split("-");
	var dB = dateB.split("-");
	var date1 = new Date(dA[0],dA[1],dA[2]);
	var date2 = new Date(dB[0],dB[1],dB[2]);
	if(date1>date2)
		return 1;
	else if(date1<date2)
			return -1
		else return 0;
	
}

function validateDate(dateA,dateB,message,helpText,errorMessageId){
	if(compareDate(dateA,dateB)>0){

		showHTMLMark(errorMessageId);
	  	helpText.innerHTML = message;
	  	return false;
	}
	else{
		hiddenHTMLMark(errorMessageId);
		helpText.innerHTML = "";
		return true;
	}
}

function validateWarnDate(message,warnDate,helpText,errorMessageId){

	var today = new Date();	
	var todayString = today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate();
	return validateDate(warnDate,todayString,message,helpText,errorMessageId);
}

function validateWarnDateforsell(message,warnDate,helpText,errorMessageId){

	var today = new Date();	
	var todayString = today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate();
	return validateDate(todayString,warnDate,message,helpText,errorMessageId);
}

function validateSelect(message,select,helpText,errorMessageId){
	alert(select==message);
	alert(select);
	alert(message);
	if(select==message){
		
		showHTMLMark(errorMessageId);
	  	helpText.innerHTML = message;
	  	return false;
	}
	else{
		hiddenHTMLMark(errorMessageId);
		helpText.innerHTML = "";
		return true;
	}
}


