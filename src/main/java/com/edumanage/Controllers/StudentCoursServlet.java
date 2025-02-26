package com.edumanage.Controllers;

import com.edumanage.Models.Cours;
import com.edumanage.Models.Student;
import com.edumanage.dao.StudentCourseDAO;
import com.edumanage.dao.StudentDAO;
import com.edumanage.dao.coursDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/studentcours/*")
public class StudentCoursServlet extends HttpServlet {
    private StudentCourseDAO studentCourseDAO;
    private StudentDAO studentDAO;
    private coursDAO coursDAO;

    @Override
    public void init() throws ServletException {
        studentCourseDAO = new StudentCourseDAO();
        studentDAO = new StudentDAO();
        coursDAO = new coursDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getRequestURI();
        System.out.println(action);
        try {
            if (action == null || action.equals("/")) {
                listStudentCourses(request, response);
            } else {
                switch (action) {
                    case "/studentcours/list":
                        listStudentCourses(request, response);
                        break;
                    case "/studentcours/attach":
                        showAttachForm(request, response);
                        break;
                    case "/studentcours/attachCourse":
                        attachCourseToStudent(request, response);
                        break;
                    case "/studentcours/detachCourse":
                        detachCourseFromStudent(request, response);
                        break;
                    case "/studentcours/studentCourses":
                        showStudentCourses(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                        break;
                }
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listStudentCourses(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Student> students = studentDAO.selectAllEtudiant();
        List<Cours> courses = coursDAO.selectAllCours();

        request.setAttribute("studentList", students);
        request.setAttribute("courseList", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/StudentCours/ListStudentCours.jsp");
        dispatcher.forward(request, response);
    }

    private void showAttachForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Student> students = studentDAO.selectAllEtudiant();
        List<Cours> courses = coursDAO.selectAllCours();

        request.setAttribute("studentList", students);
        request.setAttribute("courseList", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/StudentCours/AttachCourse.jsp");
        dispatcher.forward(request, response);
    }

    private void attachCourseToStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        studentCourseDAO.attachCourseToStudent(studentId, courseId);
        response.sendRedirect("list");
    }

    private void detachCourseFromStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        studentCourseDAO.detachCourseFromStudent(studentId, courseId);
        response.sendRedirect("studentCourses?id=" + studentId);
    }

    private void showStudentCourses(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int studentId = Integer.parseInt(request.getParameter("id"));
        Student student = studentDAO.selectStudentById(studentId);

        List<Integer> courseIds = studentCourseDAO.getCoursesByStudentId(studentId);
        List<Cours> studentCourses = new ArrayList<>();

        for (Integer courseId : courseIds) {
            Cours course = coursDAO.selectCoursById(courseId);
            if (course != null) {
                studentCourses.add(course);
            }
        }

        request.setAttribute("student", student);
        request.setAttribute("studentCourses", studentCourses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/StudentCours/StudentCourses.jsp");
        dispatcher.forward(request, response);
    }
}