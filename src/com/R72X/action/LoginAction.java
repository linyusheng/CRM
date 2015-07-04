package com.R72X.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.R72X.entity.User;
import com.R72X.service.UserService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction {
	private UserService userService;	
	private User user;
	private Collection<User> userColl;
	private PageBean pageBean;
	private String isResetPWD;
	private String keyWord;
	
	private String account;
	private String password;
	private String errorMessage;
	private String newPassword;
	
	private String title;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath = "D://userPhoto" ;
	
	public void setSavePate(String value){
		this.savePath = value;
	}
	
	public String getSavePath(){
		return this.savePath;
	}
	
	
	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Collection<User> getUserColl() {
		return userColl;
	}
	public void setUserColl(Collection<User> userColl) {
		this.userColl = userColl;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String getAccount() {
		return account;
	}
	public String getPassword() {
		return password;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	
	public boolean isAccountExist(String account) throws Exception{		
		userColl=userService.searchUserByAccount(account);
		if(userColl.isEmpty())return false;
		else return true;
	}
	
	public String login() throws Exception{
		if(account==null||password==null){
			return "fail";
		}
		if(userService.isAccountExist(account)){
			user=userService.login(account, password);
			if(user!=null){				
				updateSession();
				return "success";
			}
			else{
				errorMessage="密码错误！";
			}
		}
		else{
			errorMessage="该帐号不存在！";
		}
		return "fail";
	}
	
	public String logout() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		session.clear();
		return "success";
	}
	
	public String loadMessage() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			errorMessage="您还没登录，请登录！";
			return "fail";
		}
		Integer id=(Integer)session.get("loginId");
		user=userService.loadUser(id);
		return "success";
	}
	
	public String savePassword() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			errorMessage="您还没登录，请登录！";
			return "fail";
		}
		Integer id=(Integer)session.get("loginId");
		if(userService.savePassword(id, password, newPassword).equals("success")){
			return "success";
		}
		errorMessage="修改失败，您输入了错误的旧密码！";
		return "errorPassword";
		
	}
	
	public String saveMessage() throws Exception{	
		updatePhoto();
		userService.saveUser(user);
		updateSession();
		return "success";
	}
	
	public String doNothing()throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			errorMessage="您还没登录，请登录！";
			return "fail";
		}
		return "success";
	}
	
	private void updateSession() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		session.put("loginId", user.getUserId());
		session.put("loginCategory", user.getUserCategory());
		session.put("loginName", user.getUserName());
		session.put("loginPhoto", user.getPhoto());
	}
	
	public void updatePhoto() throws Exception {
		//控制文件上传
		if(getUpload() != null){	//修改用户信息时，选择了图片上传功能
			setUploadFileName(UUID.randomUUID().toString()+ getUploadFileName());	//更改上传文件名为：用户名+上传文件名
			FileOutputStream fos = new FileOutputStream(getSavePath() + "\\" + getUploadFileName());
			FileInputStream fis = new FileInputStream(getUpload());
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer))>0){
				fos.write(buffer, 0, len);
			}
			user.setPhoto(getUploadFileName());
		}
		else ;	//不选择图片上传功能则不修改图片
	}
	
	public String download() throws Exception {

		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		String fileName = (String)session.get("loginPhoto");
		String filePath = savePath + "/" + fileName;
		
		
		//获取下载的文件流
		File downFile = new File(filePath);
		InputStream inStream = new FileInputStream(downFile);

		// 告诉Struts 执行完 Action 就行了，不用再去调用结果响应的操作
		ActionContext.getContext().getActionInvocation().getProxy().setExecuteResult(false);
		// 取得 HttpServletResponse
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setHeader("Content-Disposition", "attachment; filename="
				+ java.net.URLEncoder.encode(fileName, "UTF-8"));

		//输出文件流到客户端
		OutputStream out = response.getOutputStream();
		byte[] buffer = new byte[4096];
		while (inStream.read(buffer) > 0) {
			out.write(buffer);
		}
		out.flush();
		
		return "";
	}
	
	
	/*public static void main(String[] args){
		String[] li=new String[]{};
		for(int i=0;i<10;i++){
			li[i]=new String(""+i);
		}
		for(int i=0;i<10;i++){
			System.out.println(li[i]);
		}
	}*/
}
