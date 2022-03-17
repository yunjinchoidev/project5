package project5.gantt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GanttService {
	
	@Autowired
	private GanttDao dao;

	public List<GanttVO> list() {
		return dao.list();
	}

	public GanttVO individualMemberList() {
		return dao.individualMemberList();
	}

	public GanttVO individualProjectList() {
		return dao.individualProjectList();
	}
	
	public void insert(GanttVO vo) {
		dao.insert(vo);
	}
	
	public void delete(int id) {
		dao.delete(id);
	};
	
	public void update(GanttVO vo) {
		dao.update(vo);
	}
	public void update2(GanttVO vo) {
		dao.update(vo);
	}
	
}
