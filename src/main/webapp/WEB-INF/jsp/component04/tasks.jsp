<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Task Checklist — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:1000px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px;font-weight:500}.nav .brand{color:#fff;font-weight:700;font-size:18px}
    .container{max-width:1000px;margin:0 auto;display:grid;grid-template-columns:1fr 340px;gap:24px}
    .full{grid-column:1/-1}h1{font-size:26px;font-weight:700;margin-bottom:24px}
    .card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:28px}
    .form-group{margin-bottom:16px}label{display:block;color:rgba(255,255,255,0.7);font-size:13px;margin-bottom:6px;font-weight:500}
    input,select{width:100%;padding:11px 14px;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.15);border-radius:10px;color:#fff;font-size:14px;font-family:'Outfit',sans-serif;outline:none}
    input:focus,select:focus{border-color:#a78bfa}select option{background:#1a0533}
    .btn{padding:11px 20px;border:none;border-radius:10px;font-size:14px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;transition:opacity 0.2s;text-decoration:none;display:inline-block}
    .btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff;width:100%}
    .btn-secondary{background:rgba(255,255,255,0.12);border:1px solid rgba(255,255,255,0.18);color:#fff}
    .btn-danger{background:rgba(239,68,68,0.15);border:1px solid rgba(239,68,68,0.3);color:#fca5a5}
    .task-item{display:flex;align-items:center;gap:12px;padding:14px 16px;border-bottom:1px solid rgba(255,255,255,0.06)}
    .task-item:last-child{border-bottom:none}
    .task-name{flex:1;font-size:15px}.task-date{color:rgba(255,255,255,0.4);font-size:12px}
    .badge{display:inline-block;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600}
    .badge-done{background:rgba(34,197,94,0.2);color:#86efac}.badge-pending{background:rgba(245,158,11,0.2);color:#fcd34d}
    .badge-high{background:rgba(239,68,68,0.2);color:#fca5a5}.badge-medium{background:rgba(245,158,11,0.2);color:#fcd34d}.badge-low{background:rgba(34,197,94,0.2);color:#86efac}
    .empty{text-align:center;padding:40px;color:rgba(255,255,255,0.4)}
  </style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span><div style="display:flex;gap:16px"><a href="/planning">← Planning</a><a href="/planning/budget">Budget</a><a href="/planning/guests">Guests</a></div></nav>
<div class="container">
  <div class="full" style="display:flex;justify-content:space-between;align-items:center"><h1>✅ Task Checklist</h1></div>
  <div>
    <div class="card">
      <c:choose>
        <c:when test="${empty tasks}"><div class="empty"><p>No tasks yet. Add your first task →</p></div></c:when>
        <c:otherwise>
          <c:forEach var="t" items="${tasks}">
            <div class="task-item">
              <div>
                <span class="badge badge-${t.taskType.toLowerCase()}">${t.taskType}</span>
                <span class="badge badge-${t.completed ? 'done' : 'pending'}" style="margin-left:6px">${t.completed ? 'Done' : 'Pending'}</span>
              </div>
              <div class="task-name">${t.title}</div>
              <div class="task-date">${t.dueDate}</div>
              <a href="/planning/tasks/toggle/${t.taskId}" class="btn" style="font-size:12px;padding:6px 12px;background:rgba(167,139,250,0.2);color:#c4b5fd">Toggle</a>
              <a href="/planning/tasks/edit/${t.taskId}" class="btn btn-secondary" style="font-size:12px;padding:6px 12px">Edit</a>
              <a href="/planning/tasks/delete/${t.taskId}" class="btn btn-danger" style="font-size:12px;padding:6px 12px" onclick="return confirm('Delete?')">✕</a>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
  <div class="card">
    <c:choose>
      <c:when test="${not empty editingTask}">
        <h2 style="font-size:18px;margin-bottom:20px;font-weight:700">Edit Task</h2>
        <form method="post" action="/planning/tasks/update">
          <input type="hidden" name="taskId" value="${editingTask.taskId}">
          <div class="form-group"><label>Task Title</label><input type="text" name="title" id="title" value="${editingTask.title}" placeholder="e.g. Book the venue" required></div>
          <div class="form-group"><label>Category</label><input type="text" name="category" id="category" value="${editingTask.category}" placeholder="e.g. Venue"></div>
          <div class="form-group"><label>Due Date</label><input type="date" name="dueDate" id="dueDate" value="${editingTask.dueDate}"></div>
          <div class="form-group"><label>Priority</label>
            <select name="taskType" id="taskType">
              <option value="HIGH" ${editingTask.taskType == 'HIGH' ? 'selected' : ''}>High</option>
              <option value="MEDIUM" ${editingTask.taskType == 'MEDIUM' ? 'selected' : ''}>Medium</option>
              <option value="LOW" ${editingTask.taskType == 'LOW' ? 'selected' : ''}>Low</option>
            </select>
          </div>
          <button type="submit" class="btn btn-primary">Save Changes</button>
          <a href="/planning/checklist" class="btn btn-secondary" style="display:inline-block;margin-top:12px;width:auto">Cancel</a>
        </form>
      </c:when>
      <c:otherwise>
        <h2 style="font-size:18px;margin-bottom:20px;font-weight:700">Add Task</h2>
        <form method="post" action="/planning/tasks/add">
          <div class="form-group"><label>Task Title</label><input type="text" name="title" id="title" placeholder="e.g. Book the venue" required></div>
          <div class="form-group"><label>Category</label><input type="text" name="category" id="category" placeholder="e.g. Venue"></div>
          <div class="form-group"><label>Due Date</label><input type="date" name="dueDate" id="dueDate"></div>
          <div class="form-group"><label>Priority</label>
            <select name="taskType" id="taskType"><option value="HIGH">High</option><option value="MEDIUM" selected>Medium</option><option value="LOW">Low</option></select>
          </div>
          <button type="submit" class="btn btn-primary">Add Task</button>
        </form>
      </c:otherwise>
    </c:choose>
  </div>
</div></body></html>
