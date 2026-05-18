package com.ttt.component06.repository;
import com.ttt.component06.model.Admin;
import com.ttt.component06.model.ModeratorAdmin;
import com.ttt.component06.model.SuperAdmin;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

@Repository
public class AdminRepository {
    private final String FILE = "data/admins.txt";
    private File getFile() { File f=new File(FILE); f.getParentFile().mkdirs(); return f; }
    public List<Admin> findAll() {
        List<Admin> list = new ArrayList<>();
        if(!getFile().exists()) return list;
        try(BufferedReader br=new BufferedReader(new FileReader(getFile()))) {
            String line; while((line=br.readLine())!=null) {
                if(line.trim().isEmpty()) continue;
                String[] p = line.split("\\|");
                if(p.length>=5) {
                    if("SUPER_ADMIN".equals(p[4])) list.add(new SuperAdmin(p[0],p[1],p[2],p[3]));
                    else list.add(new ModeratorAdmin(p[0],p[1],p[2],p[3]));
                }
            }
        } catch(Exception e) {}
        return list;
    }
    public void save(Admin admin) {
        List<Admin> all=findAll(); boolean found=false;
        for(int i=0;i<all.size();i++){ if(all.get(i).getAdminId().equals(admin.getAdminId())){ all.set(i,admin); found=true; break; } }
        if(!found) all.add(admin); writeAll(all);
    }
    public void delete(String id) { List<Admin> all=findAll(); all.removeIf(a->a.getAdminId().equals(id)); writeAll(all); }
    private void writeAll(List<Admin> all) {
        try(BufferedWriter bw=new BufferedWriter(new FileWriter(getFile()))) { for(Admin a:all){ bw.write(a.toFileString()); bw.newLine(); } } catch(Exception e){}
    }
}
