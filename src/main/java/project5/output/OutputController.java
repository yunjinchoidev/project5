package project5.output;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OutputController {
	
	@RequestMapping("/output.do")
	public String unifyIndex() {
		return "output/list";
	}

	
	
	
	
}
