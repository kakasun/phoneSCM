package cn.itcast.scm.service.impl;

import org.springframework.stereotype.Service;
import cn.itcast.scm.entity.Account;
import cn.itcast.scm.service.AccountService;
@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService {
	

	@Override
	public Account login(Account account) {
		
		return accountMapper.login(account);
	}
	
/*	@Autowired
	private AccountMapper accountMapper;

	@Override
	public int insert(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPk(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPk(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Account selectByPk(Account entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Account> selectUseDyc(Account entity) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Page<Account> selectPage(Page<Account> page) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Page<Account> selectPageListUseDyc(Page<Account> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}*/

}
