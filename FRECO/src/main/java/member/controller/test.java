package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller

public class MemberIDDuplicateController {

	private final String command = "IdDuplicate.me";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command)
	public int doAction(@RequestParam("MID") String MID) {
		int cnt = memberDao.IdDuplicate(MID);
		return cnt;
		
		
		
	}
	
}
