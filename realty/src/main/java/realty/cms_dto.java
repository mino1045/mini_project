package realty;

import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.Data;


@Data
@Repository("cms_dto")
public class cms_dto {
	int cidx;
	String mname,memail,mtel,cmsdate,cmstext,cdate;
	List<Integer> psalsetype,ptype;
}