
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Mike
 */
public class TestConsole {
    public static void main(String[] args) {
        
        boolean auth = true;
        boolean tls = true;
        String host = "smtp.gmail.com";
        String port = "587";
        
        String customerUsername = "Ducht";
        String customerPassword = "abcxyz";
        String linkActive = "thiendia.com";

        String username = "ducndgc00467@fpt.edu.vn";
        String password = "Duc76268481993@";
        String from = "ducndgc00467@fpt.edu.vn";
        String to = "doconut@hotmail.com";
        String subject = "Admin KSCSchool";
        String content = "Chào mừng " + customerUsername + " đã đăng kí tham gia làm thành viên của KSCEvent \n\n"
                    + "KSCEvent là nơi bạn có thể tìm kiếm và tham gia vào các hoạt động của trường KSC \n\n"
                    + "Nơi giao lưu học hỏi và giải trí giúp các sinh viên có được kiến thức và nâng cao "
                    + "kĩ năng giao tiếp. \n\n"
                    + "Thông tin tài khoản của bạn: \n\n"
                    + "username " + customerUsername + "\n\n"
                    + "password " + customerPassword + "\n\n"
                    + "Hãy click vào link sau để active tài khoản của bạn: \n\n"
                    + linkActive;
        
        EmailDeploy deploy = new EmailDeploy();
        
        //deploy.emailSender(username, password, auth, tls, host, port, from, to, subject, content);
        //List<String> listFile = new LinkedList<String>();
        String listFile = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Jellyfish.jpg";
        
        
        deploy.emailSenderAttachFile(username, password, auth, tls, host, port, from, to, subject, content, listFile);
        //deploy.emailSender(username, password, auth, tls, host, port, from, to, subject, content);
    }
}
