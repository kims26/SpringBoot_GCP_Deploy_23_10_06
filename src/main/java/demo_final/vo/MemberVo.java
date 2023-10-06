package demo_final.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberVo {

	int mem_idx;
	String mem_name;
	String mem_id;
	String mem_pwd;
	String mem_addr;
	String mem_type;
	String mem_zipcode;
	String mem_regdate;
	String mem_tel;
	String mem_ip;
	String mem_n_email;
	String mem_email;

	// String mem_pwd_mask;

	// public String getMem_pwd_mask() {

	// int len = mem_pwd.length();
	// int half = len/2;

	// StringBuffer sb = new StringBuffer();
	// sb.append(mem_pwd.substring(0, half));
	// for(int i=half ; i< len ;i++) {
	// sb.append("*");
	// }

	// StringBuffer sb1 = new StringBuffer();
	// for(int i=0;i< len ;i++) {

	// if(i<half)
	// sb1.append(mem_pwd.charAt(i));
	// else
	// sb1.append("*");
	// }

	// return sb1.toString();
	// }

}
