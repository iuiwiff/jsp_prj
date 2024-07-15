package day0417;

public class DataVO {
	private String name;
	private String url;
	private String img;
	
	public DataVO(String name, String url, String img) {
		this.name = name;
		this.url = url;
		this.img = img;
	}

	public String getName() {
		return name;
	}
	
	public String getUrl() {
		return url;
	}
	

	public String getImg() {
		return img;
	}

	@Override
	public String toString() {
		return "DataVO [name=" + name + ", url=" + url + ", img=" + img + "]";
	}

}
