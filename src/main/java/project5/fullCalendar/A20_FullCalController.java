package project5.fullCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.net.aso.d;
import project5.member.MemberVO;
import project5.project.ProjectService;


@Controller
public class A20_FullCalController {

	@Autowired
	private A10_FullCalService service;
	
	
	@Autowired
	ProjectService service2;
	
	
	
	// http://localhost:7080/springweb/calendar.do
	@GetMapping("calendar.do")
	public String calendar(Model d, int projectkey) {
		d.addAttribute("pjList", service2.list());
		d.addAttribute("project", service2.get(projectkey));
		return "WEB-INF\\views\\schedule\\fullCalendar.jsp";
	}

	@GetMapping("calendar2.do")
	public String calendar2(Model d, int projectkey) {
		d.addAttribute("project", service2.get(projectkey));
		return "WEB-INF\\views\\schedule\\fullCalendar2.jsp";
	}
	
	
	
	// http://localhost:7080/springweb/calList.do
	@RequestMapping("getCalendarList.do")
	public String calList(Model d) {
		d.addAttribute("calList", service.getCalendarList());	
		return "pageJsonReport";
	}

	@RequestMapping("getCalendarIndividaulList.do")
	public String calList(Model d, MemberVO vo) {
		d.addAttribute("calList", service.getCalendarIndividaulList(vo.getMemberkey()));	
		return "pageJsonReport";
	}
	
	@RequestMapping("insertCalendar")
	public String insertCalendar(Calendar ins, MemberVO vo, Model d){
		d.addAttribute("memberkey", vo.getMemberkey());
		service.insertCalendar(ins);
		return "redirect:/calendar.do";
	}
	@RequestMapping("updateCalendar")
	public String updateCalendar(Calendar ins){
		System.out.println("수정 id:"+ins.getId());
		service.updateCalendar(ins);
		return "redirect:/calendar.do";
	}
	@RequestMapping("deleteCalendar")
	public String deleteCalendar(@RequestParam("id") int id){
		System.out.println("삭제 id:"+id);
		service.deleteCalendar(id);
		return "redirect:/calendar.do";
	}	
}
