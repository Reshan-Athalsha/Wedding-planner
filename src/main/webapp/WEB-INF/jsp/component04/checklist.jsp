<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>

    .container-checklist { max-width: 1000px; margin: 0 auto; display: grid; grid-template-columns: 1fr 340px; gap: 24px; }
    .full { grid-column: 1/-1 }
    h1 { font-size: 26px; font-weight: 700; margin-bottom: 24px; }
    .checklist-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(10px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 28px; }
    .form-group { margin-bottom: 16px }
    label { display: block; color: rgba(255,255,255,0.7); font-size: 13px; margin-bottom: 6px; font-weight: 500 }
    input, select { width: 100%; padding: 11px 14px; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.15); border-radius: 10px; color: #fff; font-size: 14px; font-family:'Outfit',sans-serif; outline: none }
    input:focus, select:focus { border-color:#a78bfa }
    select option { background:#1a0533 }
    .btn-checklist { padding: 11px 20px; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; font-family:'Outfit',sans-serif; cursor: pointer; transition: opacity 0.2s; text-decoration: none; display: inline-block }
    .btn-primary { background: linear-gradient(135deg,#7c3aed,#a855f7); color: #fff; width: 100% }
    .btn-secondary { background: rgba(255,255,255,0.12); border: 1px solid rgba(255,255,255,0.18); color: #fff }
    .btn-danger { background: rgba(239,68,68,0.15); border: 1px solid rgba(239,68,68,0.3); color: #fca5a5 }
    .task-item { display: flex; align-items: center; gap: 12px; padding: 14px 16px; border-bottom: 1px solid rgba(255,255,255,0.06) }
    .task-item:last-child { border-bottom: none }
    .task-name { flex: 1; font-size: 15px }
    .task-date { color: rgba(255,255,255,0.4); font-size: 12px }
    .badge { display: inline-block; padding: 3px 10px; border-radius: 20px; font-size: 11px; font-weight: 600 }
    .badge-done { background: rgba(34,197,94,0.2); color: #86efac }
    .badge-pending { background: rgba(245,158,11,0.2); color: #fcd34d }
    .badge-high { background: rgba(239,68,68,0.2); color: #fca5a5 }
    .badge-medium { background: rgba(245,158,11,0.2); color: #fcd34d }
    .badge-low { background: rgba(34,197,94,0.2); color: #86efac }
    .empty { text-align: center; padding: 40px; color: rgba(255,255,255,0.4) }
</style>

<div class="container py-5 mt-4">
    <div class="container-checklist">
      <div class="full" style="display:flex;justify-content:space-between;align-items:center">
          <h1 class="display-6 fw-bold mb-4">Task Checklist</h1>
      </div>
      <div>
        <div class="checklist-card">
          <c:choose>
            <c:when test="${empty tasks}"><div class="empty"><p>No tasks yet. Add your first task &rarr;</p></div></c:when>
            <c:otherwise>
              <c:forEach var="t" items="${tasks}">
                <div class="task-item">
                  <div>
                    <span class="badge badge-${not empty t.taskType ? t.taskType.toLowerCase() : 'medium'}">${t.taskType}</span>
                    <span class="badge badge-${t.completed ? 'done' : 'pending'}" style="margin-left:6px">${t.completed ? 'DONE' : 'PENDING'}</span>
                  </div>
                  <div class="task-name">${t.title}</div>
                  <div class="task-date">${t.dueDate}</div>
                  <a href="/planning/tasks/complete/${t.taskId}" class="btn-checklist" style="font-size:12px;padding:6px 12px;background:rgba(167,139,250,0.2);color:#c4b5fd">Toggle</a>
                  <a href="/planning/tasks/edit/${t.taskId}" class="btn-checklist btn-secondary" style="font-size:12px;padding:6px 12px">Edit</a>
                  <a href="/planning/tasks/delete/${t.taskId}" class="btn-checklist btn-danger" style="font-size:12px;padding:6px 12px" onclick="return confirm('Delete?')">&#x2715;</a>
                </div>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <div class="checklist-card">
        <c:choose>
          <c:when test="${not empty editingTask}">
            <h2 style="font-size:18px;margin-bottom:20px;font-weight:700">Edit Task</h2>
            <form method="post" action="/planning/tasks/update">
              <input type="hidden" name="taskId" value="${editingTask.taskId}">
              <div class="form-group"><label>Task Title</label><input type="text" name="title" id="title" value="${editingTask.title}" placeholder="e.g. Book the venue" required></div>
              <div class="form-group"><label>Category</label><input type="text" name="category" id="category" value="${editingTask.category}" placeholder="e.g. Venue, Catering, Decor"></div>
              <div class="form-group"><label>Due Date</label><input type="date" name="dueDate" id="dueDate" value="${editingTask.dueDate}"></div>
              <div class="form-group"><label>Task Type</label>
                <select name="taskType" id="taskType"><option value="HIGH" ${editingTask.taskType == 'HIGH' ? 'selected' : ''}>High Priority</option><option value="MEDIUM" ${editingTask.taskType == 'MEDIUM' ? 'selected' : ''}>Medium Priority</option><option value="LOW" ${editingTask.taskType == 'LOW' ? 'selected' : ''}>Low Priority</option></select>
              </div>
              <button type="submit" class="btn-checklist btn-primary">Save Changes</button>
              <a href="/planning/checklist" class="btn-checklist btn-secondary" style="display:inline-block;margin-top:12px;width:auto">Cancel</a>
            </form>
          </c:when>
          <c:otherwise>
            <h2 style="font-size:18px;margin-bottom:20px;font-weight:700">Add Task</h2>
            <form method="post" action="/planning/tasks/add">
              <div class="form-group"><label>Task Title</label><input type="text" name="title" id="title" placeholder="e.g. Book the venue" required></div>
              <div class="form-group"><label>Category</label><input type="text" name="category" id="category" placeholder="e.g. Venue, Catering, Decor"></div>
              <div class="form-group"><label>Due Date</label><input type="date" name="dueDate" id="dueDate"></div>
              <div class="form-group"><label>Task Type</label>
                <select name="taskType" id="taskType"><option value="HIGH">High Priority</option><option value="MEDIUM" selected>Medium Priority</option><option value="LOW">Low Priority</option></select>
              </div>
              <button type="submit" class="btn-checklist btn-primary">Add Task</button>
            </form>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
