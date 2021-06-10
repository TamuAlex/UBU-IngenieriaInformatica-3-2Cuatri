package es.ubu.lsi.dao.invoice;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.slf4j.Logger;

import es.ubu.lsi.dao.JpaDAO;
import es.ubu.lsi.model.invoice.Factura;

public class FacturaDAO extends JpaDAO<Factura, Long>{

	//private static final Logger logger = LoggerFactory.getLogger(FacturaDAO.class);
	public FacturaDAO(EntityManager em) {
		super(em);
		// TODO Auto-generated constructor stub
	}
	
	
	public List<Factura> findAll(){
		try {
		TypedQuery<Factura> query = getEntityManager().createNamedQuery("Factura.findAll", Factura.class);
		
		return query.getResultList();
		} catch (Exception e) {
			//El logger
			throw new RuntimeException(e);
		}
	}
	
	
	public List<Factura> findAllWithLines(){
		try {
			TypedQuery<Factura> query = getEntityManager().createNamedQuery("Factura.findAllWithLines", Factura.class);
			
			return query.getResultList();
			
		} catch(Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public List<Factura> findAllWithLinesUsingGraph(){
		try {
			List<Factura> facturas = getEntityManager().createNamedQuery("Factura.findAll", Factura.class)
					.setHint("javax.persistence.loadgraph", 
							getEntityManager().getEntityGraph("Factura.graph.invoicesWithLines")).getResultList();
			return facturas;
		} catch(Exception e) {
			throw new RuntimeException(e);
		}
	}

}
