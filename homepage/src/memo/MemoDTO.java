package memo;

public class MemoDTO {
	private int    memono;
	private String  title;
	private String content;
	private String  wdate;
	private int   	viewcnt;
	
	public MemoDTO() {
		super();
	}
	public int getMemono() {
		return memono;
	}
	public void setMemono(int memono) {
		this.memono = memono;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "MemoDTO [memono=" + memono + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", viewcnt=" + viewcnt + "]";
	}
	
	
}
