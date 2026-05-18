package com.ttt.component06.repository;
import com.ttt.component06.model.Announcement;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

@Repository
public class AnnouncementRepository {
    private final String FILE = "data/announcements.txt";
    
    private File getFile() {
        File f=new File(FILE);
        f.getParentFile().mkdirs(); 
        return f;
    }
    public List<Announcement> findAll() {
        List<Announcement> list = new ArrayList<>();
        if(!getFile().exists()) return list;
        try(BufferedReader br=new BufferedReader(new FileReader(getFile()))) {
            String line; while((line=br.readLine())!=null) {
                if(line.trim().isEmpty()) continue;
                String[] p = line.split("\\|");
                if(p.length>=4) list.add(new Announcement(p[0],p[1],p[2],p[3]));
            }
        } catch(Exception e) {}
        return list;
    }
    public void save(Announcement a) {
        List<Announcement> all=findAll(); boolean found=false;
        for(int i=0;i<all.size();i++){ 
            if(all.get(i).getId().equals(a.getId())){ 
                all.set(i,a); found=true; break; 
            } 
        }
        if(!found)
            all.add(a);
        writeAll(all);
    }
    public void delete(String id) { 
        List<Announcement> all=findAll();
        all.removeIf(a->a.getId().equals(id));
        writeAll(all); 
    }
    private void writeAll(List<Announcement> all) {
        try(BufferedWriter bw=new BufferedWriter(new FileWriter(getFile()))) { 
            for(Announcement a:all){
                bw.write(a.toFileString()); 
                bw.newLine();
            }
        } 
            catch(Exception e){}
    }
}
