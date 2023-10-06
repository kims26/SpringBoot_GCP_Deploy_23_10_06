package demo_final.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AdminVo {

	int    Admin_idx;
	String Admin_name;
	String Admin_id;
	String Admin_pwd;
    String Admin_ip;
    String Admin_grade;
	int o_idx;
	int mem_idx;
	

	
	//String Admin_pwd_mask;
	
	// String mem_pwd_mask;
	
	
	// public String getMem_pwd_mask() {
		
	// 	int len = mem_pwd.length();
	// 	int half = len/2;
		
	// 	StringBuffer sb = new StringBuffer();
	// 	sb.append(mem_pwd.substring(0, half));
	// 	for(int i=half ; i< len ;i++) {
	// 		sb.append("*");
	// 	}
		
		
	// 	StringBuffer sb1 = new StringBuffer();
    //     for(int i=0;i< len ;i++) {
        	
    //     	if(i<half)
    //     		sb1.append(mem_pwd.charAt(i));
    //     	else
    //     		sb1.append("*");
    //     }
		
				
	// 	return sb1.toString();
	// }


    
	
	
}
