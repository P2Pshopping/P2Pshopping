<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Category Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: #343a40;
            color: white;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table {
            background-color: #495057;
            color: white;
        }
        .table th, .table td {
            border-color: #6c757d;
        }
    </style>
</head>
<%@include file="../layout/Header.jsp"%>

<body>
    <div class="container mt-5">
        <h2>Category Management</h2>
        
        <form action="${pageContext.request.contextPath}/admin/categories.do" method="post">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="url">URL</label>
                <input type="text" class="form-control" id="url" name="url" required>
            </div>
            <button type="submit" class="btn btn-success mt-2">Add Category</button>
        </form>

        <table class="table table-dark table-bordered mt-5">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>URL</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categoryList}">
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td>${category.url}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/admin/categories.do" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${category.id}" />
                                <input type="hidden" name="action" value="delete" />
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                            <button type="button" class="btn btn-warning btn-sm" onclick="editCategory(${category.id}, '${category.name}', '${category.url}')">Edit</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/admin/categories.do" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="editId" />
                        <input type="hidden" name="action" value="update" />
                        <div class="form-group">
                            <label for="editName">Name</label>
                            <input type="text" class="form-control" id="editName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="editUrl">URL</label>
                            <input type="text" class="form-control" id="editUrl" name="url" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function editCategory(id, name, url) {
            $('#editId').val(id);
            $('#editName').val(name);
            $('#editUrl').val(url);
            $('#editModal').modal('show');
        }
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
<%@ include file="../layout/Footer.jsp"%>

</html>

