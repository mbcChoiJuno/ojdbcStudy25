package mbcacademy.interfaces;

import java.util.ArrayList;

public interface IRepository<T, V> {

	public void post(T dto);
	
	public T findById(V id);
	
	public ArrayList<T> findAll();
	
	public void update(T dto, V id);
	
	public void delete(V id);
}
