package entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class QueryFromForm {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false)
    private int qSoNo;
    private String qName;
    private String qEmail;
    private String qContact;
    private String qQueryHead;
    @Column(columnDefinition = "TEXT")
    private String qQueryExplained;

    public int getqSoNo() {
        return qSoNo;
    }

    public void setqSoNo(int qSoNo) {
        this.qSoNo = qSoNo;
    }

    public String getqName() {
        return qName;
    }

    public void setqName(String qName) {
        this.qName = qName;
    }

    public String getqEmail() {
        return qEmail;
    }

    public void setqEmail(String qEmail) {
        this.qEmail = qEmail;
    }

    public String getqContact() {
        return qContact;
    }

    public void setqContact(String qContact) {
        this.qContact = qContact;
    }

    public String getqQueryHead() {
        return qQueryHead;
    }

    public void setqQueryHead(String qQueryHead) {
        this.qQueryHead = qQueryHead;
    }

    public String getqQueryExplained() {
        return qQueryExplained;
    }

    public void setqQueryExplained(String qQueryExplained) {
        this.qQueryExplained = qQueryExplained;
    }

    public QueryFromForm() {
        super();
    }

    public QueryFromForm(String qName, String qEmail, String qContact,
                         String qQueryHead, String qQueryExplained) {
        super();
        this.qName = qName;
        this.qEmail = qEmail;
        this.qContact = qContact;
        this.qQueryHead = qQueryHead;
        this.qQueryExplained = qQueryExplained;
    }

    @Override
    public String toString() {
        return "QueryFromForm [qSoNo=" + qSoNo + ", qName=" + qName
                + ", qEmail=" + qEmail + ", qContact=" + qContact
                + ", qQueryHead=" + qQueryHead + ", qQueryExplained="
                + qQueryExplained + "]";
    }

}
