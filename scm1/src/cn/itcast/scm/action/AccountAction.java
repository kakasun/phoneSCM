package cn.itcast.scm.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.scm.entity.Account;
import cn.itcast.scm.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountAction extends BaseAction {
	@Resource
	private AccountService accountService;
	
	@RequestMapping("/login")
	public String login(Account account,HttpServletRequest request,HttpSession session){
		
			if(account.getAccLogin() != null && account.getAccPass() != null){
				Account acc = accountService.login(account);
				if(acc != null){
					System.out.println("登录成功");
					session.setAttribute("account", acc);
					return "forward:/WEB-INF/jsp/home.jsp"; 
				}else{
					session.setAttribute("msg", "登录账号错误，请重新登录");
					System.out.println("2");
					return "forward:/login.jsp";
				}
			}else{
				System.out.println("1");
				session.setAttribute("msg", "登录账号错误，请重新登录");
				return "forward:/login.jsp";
			}		
		}
		
		
}

