package realty;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository("cms_dto")
public class cms_dto {
	int cidx,psalsetype,ptype;
	String mname,memail,mtel,cmsdate,cmstext,cdate;
}