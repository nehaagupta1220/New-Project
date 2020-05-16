package Entities;

import java.sql.Timestamp;

public class Posts 
{
 private int pid;
 private String ptitle;
 private String pcontent;
 private String ppic;
private Timestamp pdate;
private String cid;
private int id;

    public Posts(int pid, String ptitle, String pcontent, String ppic, Timestamp pdate, String cid, int id) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.pdate = pdate;
        this.cid = cid;
        this.id= id;
    }

    public Posts() {
    }

    public Posts(String ptitle, String pcontent, String ppic, Timestamp pdate, String cid, int id) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.pdate = pdate;
        this.cid = cid;
        this.id=id;
    }

   

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public String getCatid() {
        return cid;
    }

    public void setCatid(String catid) {
        this.cid = catid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCid() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    


}
