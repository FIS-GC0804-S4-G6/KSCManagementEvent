package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Welcome to KSCEvent School</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/css/superslides.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/css/font-awesome.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/css/main.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <ul class=\"header\">\n");
      out.write("            <li id=\"logo\" class=\"multicolore\">\n");
      out.write("                <a href=\"index.jsp\"><i class=\"fa fa-heart-o\"></i>&nbsp;KSCEvent</a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <ul class=\"menu multicolore\">\n");
      out.write("            ");

                String username = (String) session.getAttribute("username");
                if (username != null) {
                    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
                    response.addHeader("Pragma", "no-cache");
                    response.addDateHeader("Expires", 0);
            
      out.write("\n");
      out.write("            <li><a href=\"event.jsp\"><i class=\"fa fa-calendar\"></i>&nbsp;Event</a></li>\n");
      out.write("            <li><a href=\"#\"><i class=\"fa fa-university\"></i>&nbsp;About</a></li>\n");
      out.write("            <li><a href=\"#\"><i class=\"fa fa-search\"></i>&nbsp;Search</a></li> \n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-user\"></i>&nbsp;");
      out.print( username);
      out.write("</a>\n");
      out.write("                <a href=\"index.jsp\" id=\"login\">\n");
      out.write("                    <i class=\"fa fa-times-circle\"></i>&nbsp;Logout\n");
      out.write("                </a>\n");
      out.write("            </li>\n");
      out.write("            ");

            } else {
                response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
                response.addHeader("Pragma", "no-cache");
                response.addDateHeader("Expires", 0);
            
      out.write("\n");
      out.write("            <li><a href=\"event.jsp\"><i class=\"fa fa-calendar\"></i>&nbsp;Event</a></li>\n");
      out.write("            <li><a href=\"#\"><i class=\"fa fa-university\"></i>&nbsp;About</a></li>\n");
      out.write("            <li><a href=\"#\"><i class=\"fa fa-search\"></i>&nbsp;Search</a></li> \n");
      out.write("            <li><a href=\"login.jsp\" id=\"login\"><i class=\"fa fa-gittip\"></i>&nbsp;Log In</a></li>\n");
      out.write("            <li><a href=\"signup.jsp\"><i class=\"fa fa-user\"></i>&nbsp;Sign Up</a></li>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("        <div id=\"slides\">\n");
      out.write("            <ul class=\"slides-container\">\n");
      out.write("                <li>\n");
      out.write("                    <img src=\"lib/img/people.jpeg\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <h1>Hello, World</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"contrast\">\n");
      out.write("                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n");
      out.write("                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n");
      out.write("                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n");
      out.write("                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n");
      out.write("                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n");
      out.write("                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<a href=\"#\"><i class=\"fa fa-chevron-right fa-1x\"></i></a></p>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <img src=\"lib/img/cinelli-front.jpeg\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <h1>Hello, World</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"contrast\">\n");
      out.write("                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n");
      out.write("                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n");
      out.write("                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n");
      out.write("                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n");
      out.write("                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n");
      out.write("                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<a href=\"#\"><i class=\"fa fa-chevron-right fa-1x\"></i></a></p>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <img src=\"lib/img/cinelli.jpeg\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <h1>Hello, World</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"contrast\">\n");
      out.write("                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n");
      out.write("                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n");
      out.write("                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n");
      out.write("                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n");
      out.write("                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n");
      out.write("                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<a href=\"#\"><i class=\"fa fa-chevron-right fa-1x\"></i></a></p>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <img src=\"lib/img/surly.jpeg\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <h1>Hello, World</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"contrast\">\n");
      out.write("                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n");
      out.write("                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n");
      out.write("                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n");
      out.write("                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n");
      out.write("                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n");
      out.write("                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <a href=\"#\"><i class=\"fa fa-chevron-right fa-1x\"></i></a></p>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("            <nav class=\"slides-navigation\">\n");
      out.write("                <a href=\"#\" class=\"next\">\n");
      out.write("                    <i class=\"fa fa-chevron-circle-right fa-4x\"></i>\n");
      out.write("                </a>\n");
      out.write("                <a href=\"#\" class=\"prev\">\n");
      out.write("                    <i class=\"fa fa-chevron-circle-left fa-4x\"></i>\n");
      out.write("                </a>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/js/jquery-2.1.1.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/js/jquery.easing.1.3.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/js/jquery.animate-enhanced.min.js\"></script> \n");
      out.write("        <script type=\"text/javascript\" src=\"lib/js/jquery.superslides.min.js\"></script> \n");
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
