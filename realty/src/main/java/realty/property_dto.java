package realty;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository("property_dto")
public class property_dto {
	int pidx,punit,pblocks;
	String pname,paddress,ptype,psalsetype,psaledate,pmoveindate,pmig,pheating,pbuilder,pstatus,pdate;

}
