package realty;

import org.springframework.stereotype.Repository;

import lombok.Data;


@Data
@Repository("reservation_dto")
public class reservation_dto {
int ridx,pidx,visitors;
String mtel,visit_date,visit_time,mname,pname,rdate;
}