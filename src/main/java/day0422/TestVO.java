package day0422;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본 생성자 만들기
@AllArgsConstructor //모든 인스턴스 변수로 생성자 만들기
@Getter //모든 인스턴스 변수로 getter method 만들기
@Setter
@ToString
public class TestVO {
//	@Setter
//	@Getter //아래 하나의 인스턴스 변수로 getter method 만들기
	private String name;
//	@Setter
//	@Getter
	private int age;
	
	
}
