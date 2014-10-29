/**
 *
 * @author Mike
 */
public class Email {
    
    private String from;
    private String to;
    private String subject;
    private String content;
    private String attach;

    public Email(String from, String to, String subject, String content, String attach) {
        this.from = from;
        this.to = to;
        this.subject = subject;
        this.content = content;
        this.attach = attach;
    }
    
    public Email(String from, String to, String subject, String content) {
        this.from = from;
        this.to = to;
        this.subject = subject;
        this.content = content;
    }

    public Email(String attach) {
        this.attach = attach;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }
    
}
