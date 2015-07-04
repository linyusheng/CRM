package com.R72X.action;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import com.R72X.entity.Sellswarn;
import com.R72X.service.SellswarnService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class SellswarnAction {
	/**
	 * Spring注入Service
	 */
	private SellswarnService sellswarnService;
	
	private Integer id;
	private Integer[] ids;
	private Sellswarn sellswarn;
	
	/**
	 * 用于判断当前显示销售提醒的类型
	 */
	private Boolean flag;
	private Boolean[] isWarning;
	private String keyWord;
	
	private Collection<Sellswarn> sellswarnColl;
	
	private PageBean pageBean;
	
	public void setSellswarnService(SellswarnService sellswarnService){
		this.sellswarnService = sellswarnService;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer[] getIds() {
		return ids;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	public Sellswarn getSellswarn() {
		return sellswarn;
	}
	public void setSellswarn(Sellswarn sellswarn) {
		this.sellswarn = sellswarn;
	}
	public Boolean getFlag() {
		return flag;
	}
	public void setFlag(Boolean flag) {
		this.flag = flag;
	}
	public Boolean[] getIsWarning() {
		return isWarning;
	}
	public void setIsWarning(Boolean[] isWarning) {
		this.isWarning = isWarning;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Collection<Sellswarn> getSellswarnColl(){
		return sellswarnColl;
	}
	public void setSellswarnColl(Collection<Sellswarn> sellswarnColl){
		this.sellswarnColl = sellswarnColl;
	}
	public PageBean getPageBean(){
		return pageBean;
	}
	public void setPageBean(PageBean pageBean){
		this.pageBean = pageBean;
	}
	
	/**
	 * 查找
	 * @return
	 * @throws Exception
	 */
	public String load() throws Exception{
		if (id == null){
			return "success";
		}
		sellswarn = sellswarnService.loadSellswarn(id);
		return "success";
	}
	
	/**
	 * 增加或修改
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception{
		sellswarnService.saveSellswarn(sellswarn);
		return "success";
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String remove() throws Exception{
		if (ids == null)
			return "success";
		for (int i = 0, size = ids.length; i < size; i++){
			sellswarnService.removeSellswarn(ids[i]);
		}
		return "success";
	}
	
	/**
	 * 根据关键字查找相关记录
	 * @return
	 * @throws Exception
	 */
	public String search() throws Exception{
		if (pageBean == null){
			pageBean = new PageBean();
		}
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		if (!session.containsKey("flag")){
			session.put("flag", true);
		}
		if (flag == null){
			flag = (Boolean)session.get("flag");
		}
		else{
			session.put("flag", flag);
			context.setSession(session);
		}
		if (flag == true) {
			//若flag==true，则查找未过期销售提醒，并以默认排序显示
			sellswarnColl = sellswarnService.searchSellswarnById(
					((keyWord == null)?null:keyWord), pageBean);
		}
		else {
			//若flag==false，则查找已过期销售提醒，并以提醒时间倒序显示
			sellswarnColl = sellswarnService.searchSellswarnByDate(
					((keyWord == null)?null:keyWord), pageBean);
			isWarning = new Boolean[sellswarnColl.size()];
			
			//获取当天日期，用于与提醒时间进行比较
			Date date = new Date();
			Timestamp t = new Timestamp(date.getTime());
			t.setHours(0);
			t.setMinutes(0);
			t.setSeconds(0);
			t.setNanos(0);
			int i = 0;
			//对每个sellswarnColl中sellswarn的warnDate进行比较
			//并把比较结果记录在isWarning中，用于高亮提醒当天到
			//期的销售提醒。
			for (Sellswarn s : sellswarnColl){
				if ( t.compareTo(s.getWarnDate()) == 0){
					isWarning[i] = true;
					
				}
				else
					isWarning[i] = false;
				i++;
			}
		}
		return "success";
	}
}