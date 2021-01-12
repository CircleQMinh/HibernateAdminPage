/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;
import Dao.AccountDao;import Dao.CustomerDAO;
import Model.Account;import Model.Customer;
/**
 *
 * @author ASUS
 */
public class UserService {
    private AccountDao accountDAO =new AccountDao();
    private CustomerDAO customerDAO=new CustomerDAO();
	public Account getAccountByUsername(String username)
    {
        return accountDAO.getAccountByUsername(username);
    }
    public Account getAccountAdminByUsername(String username)
    {
        return accountDAO.getAccountAdminByUsername(username);
    }
	public Account getAccountAdminEmployeeByUsername(String username)
    {
        return accountDAO.getAccountAdminEmployeeByUsername(username);
    }
    public Account getAccountByEmail(String email)
    {
        return accountDAO.getAccountByEmail(email);
    }
    public Object getAccountInformation(Account account)
    {
        return accountDAO.getAccountInformation(account);
    }
    public boolean addAccount(Account acc)
    {
        return accountDAO.addAccount(acc);
    }
    public boolean addCustomerInformation(Customer cus)
    {
        return customerDAO.addCustomerInformation(cus);
    }
    public Customer  getCustomerInformationByEmail(String email)
    {
        return customerDAO.getCustomerInformationByEmail(email);
    }
    public boolean editAccount(Account acc)
    {
        AccountDao.updateAcc(acc);
        return true;
    }
}
