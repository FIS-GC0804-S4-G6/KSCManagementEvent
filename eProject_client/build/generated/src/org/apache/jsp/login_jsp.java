package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Login - KSCEvent</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/css/style_login.css\" />\t\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"noBack();\">\n");
      out.write("        <div class=\"body\"></div>\n");
      out.write("        <div class=\"grad\"></div>\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <a href=\"index.jsp\"><span class=\"randomText\">Login</span><br/><span>KSCEvent</span></a>\n");
      out.write("        </div>\n");
      out.write("        <br/>\n");
      out.write("        <form class=\"login\" method=\"post\" action=\"authentication?act=login\">\n");
      out.write("            <input type=\"email\" placeholder=\"email\" name=\"email\" /><br/>\n");
      out.write("            <input type=\"password\" placeholder=\"password\" name=\"password\" /><br/>\n");
      out.write("            <select name=\"persistent\">\n");
      out.write("                <option value=\"Don't Remember\">Don't Remember</option>\n");
      out.write("                <option value=\"Remember me\">Remember me</option>\n");
      out.write("            </select>\n");
      out.write("            <input type=\"submit\" value=\"Login\" />\n");
      out.write("            <a href=\"signup.jsp\"><input type=\"button\" value=\"Let's Signup\" /></a>\n");
      out.write("        </form>\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/js/jquery-2.1.1.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/js/prefixfree.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/js/script.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
