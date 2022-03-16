package project5.kanban;

import java.util.List;

public interface KanbanDao {
	public List<KanbanVO> list();
	public KanbanVO individualMemberList();
	public KanbanVO individualProjectList();
	public void insert(KanbanVO vo);
	public void delete(int id);
	
}
