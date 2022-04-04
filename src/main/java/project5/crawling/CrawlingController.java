package project5.crawling;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.IOException;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.net.aso.p;

@Controller
public class CrawlingController {

	@RequestMapping("/crawling.do")
	public String crawling(Model d) {

		String URL = "https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid1=105&sid2=230";
		Document doc;

		try {
			doc = Jsoup.connect(URL).get();
			Elements elem = doc.select(".date");
			String[] str = elem.text().split(" ");

			Elements todaylist = doc.select("#main_content > div.list_body.newsflash_body > ul.type06_headline > li");
			int i=0;
			for (Element element : todaylist) {
                i++;			
                System.out.println(element);
                d.addAttribute("go"+i, element.text());

            }
			
			String a =todaylist.text();
			d.addAttribute("juga", a);
			
			
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		return "pageJsonReport";
	}

}
