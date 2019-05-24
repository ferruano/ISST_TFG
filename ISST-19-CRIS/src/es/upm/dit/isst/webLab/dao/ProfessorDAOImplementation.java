package es.upm.dit.isst.webLab.dao;

import java.util.Collection;

import org.hibernate.Session;

import es.upm.dit.isst.webLab.model.Professor;

public class ProfessorDAOImplementation implements ProfessorDAO {
	private static ProfessorDAOImplementation instancia = null;
	private ProfessorDAOImplementation() {}
	public static ProfessorDAOImplementation getInstance() {
		if(null == instancia )
			instancia = new ProfessorDAOImplementation();
		return instancia;
	}
	@Override
	public void create(Professor professor) {
		// TODO Auto-generated method stub
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(professor);
			session.getTransaction().commit();
			
		}catch (Exception e) {
			
		} finally {
			session.close();
		}
	}
	@Override
	public Professor read(String email) {
		// TODO Auto-generated method stub
		Session session = SessionFactoryService.get().openSession();
		Professor prof = null;
		try {
			session.beginTransaction();
			prof = session.get(Professor.class, email);
			session.getTransaction().commit();
			
		}catch (Exception e) {
			
		} finally {
			session.close();
		}
		return prof;
	}
	@Override
	public void update(Professor professor) {
		// TODO Auto-generated method stub
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(professor);
			session.getTransaction().commit();
			
		}catch (Exception e) {
			
		} finally {
			session.close();
		}
		
	}
	@Override
	public void delete(Professor professor) {
		// TODO Auto-generated method stub
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(professor);
			session.getTransaction().commit();
			
		}catch (Exception e) {
			
		} finally {
			session.close();
		}
		
	}
	@Override
	public Collection<Professor> readAll() {
		// TODO Auto-generated method stub
		Session session = SessionFactoryService.get().openSession();
		Collection<Professor> collProf = null;
		try {
			session.beginTransaction();
			collProf = session.createQuery("from Professor").list();
			session.getTransaction().commit();
			
		}catch (Exception e) {
			
		} finally {
			session.close();
		}
		return collProf;
	}

}

