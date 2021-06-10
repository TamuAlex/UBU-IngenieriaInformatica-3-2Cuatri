package es.ubu.lsi.dao.invoice;

import javax.persistence.EntityManager;

import es.ubu.lsi.dao.JpaDAO;
import es.ubu.lsi.model.invoice.Lineafactura;
import es.ubu.lsi.model.invoice.LineafacturaID;


public class LineaFacturaDAO extends JpaDAO<Lineafactura, LineafacturaID>{

	public LineaFacturaDAO(EntityManager em) {
		super(em);
		// TODO Auto-generated constructor stub
	}

}
