package com.kh.petmily.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.CarePetsitterDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.MemberImageDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetImageDto;
import com.kh.petmily.entity.PetImagePetDto;
import com.kh.petmily.entity.ReservationReviewPaySitterDto;
import com.kh.petmily.entity.ReviewSitterDto;
import com.kh.petmily.repository.CertDao;
import com.kh.petmily.service.AdminEmailService;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.EmailService;
import com.kh.petmily.service.MemberService;
import com.kh.petmily.service.RandomService;
import com.kh.petmily.vo.QnaVO;
import com.kh.petmily.vo.StrayVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private RandomService randomService;

	@Autowired
	private CertDao certDao;

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private AdminService adminService;
	
	//관리자 이메일 서비스
	@Autowired
	private AdminEmailService aemailService;
	
	@GetMapping("/email")
	@ResponseBody
	public String email(@RequestParam String userId) {
		String email = memberService.get_email(userId);
		return emailService.sendWriteMessage(email);
	}
	// 비밀번호 변경 이메일 발송
	@GetMapping("/send")
	@ResponseBody // 내가 반환하는 내용이 곧 결과물
	public String send(@RequestParam String email, HttpSession session) {
		// 인증번호를 세션이든 DB든 어디에 저장
		String cert = randomService.generateCertificationNumber(6);
		session.setAttribute("cert", cert);
		return emailService.sendCertMessage(email, cert);
	}

	@GetMapping("/validate")
	@ResponseBody
	public String validate(HttpSession session, @RequestParam String cert) {
		String value = (String) session.getAttribute("cert");
		session.removeAttribute("cert");
		if (value.equals(cert)) {
			return "success";
		} else {
			return "fail";
		}
	}

	///////////////////////////////////////////////////

	// 비밀번호 변경화면
	@GetMapping("/input")
	public String input() {
		return "member/input";
	}

	// 이메일 변경하기 위해서 이메일 전달
	@PostMapping("/input")
	@ResponseBody
	public String input(@RequestParam String email, @RequestParam String id) throws MessagingException {
		MemberDto find = memberService.passwordfind(email, id);
		if (find != null) {
			emailService.sendChangePasswordMail(email, id);
			return "success";
		} else {
			return "fail";
		}
	}

	// 이메일 전달 완료후 이메일 확인해달라는 페이지
	@GetMapping("/result")
	public String result() {
		return "member/result";
	}

	// 비밀번호 변경 페이지 (이메일에서 접속 가능)
	@GetMapping("/change")
	public String change(@RequestParam String cert, @RequestParam String email, @RequestParam String id,
			HttpServletResponse response, Model model) {
//			필요한 작업
//			- 사용자가 이메일에서 링크를 누르면 이곳으로 들어온다.
//			- 들어오면서 정상적인 링크라면 
//				cert라는 파라미터와 email이라는 파라미터를 가지고 온다
//			- 위의 두 파라미터를 받아서 DB에 검증을 실시
//			- 위의 인증결과와 무관하게 해당 이메일의 인증정보를 모두 삭제

		model.addAttribute("email", email).addAttribute("id", id);
		boolean enter = certDao.check(email, cert);
		certDao.delete(email);
		if (!enter) {
			// 에러 코드 송출
			response.setStatus(403);
		}
		return "member/change";
	}

	// 비밀번호 변경 기능
	@PostMapping("/change")
	public String change(@ModelAttribute MemberDto memberDto) {
		String origin = memberDto.getPw();
		String result = encoder.encode(origin);
		memberDto.setPw(result);
		memberService.pwchange(memberDto);
		return "redirect:/";
	}

	///////////////////////////////////////////////////

	// 회원가입
	// regist로 이동
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";
	}

	// 회원가입
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto, @RequestParam String pets, @ModelAttribute PetDto petDto,
			@RequestParam String id, @RequestParam String pet_name, @RequestParam String pet_age,
			@RequestParam String pet_type, @RequestParam String pet_ect, @RequestParam MultipartFile member_image,
			@RequestParam MultipartFile pet_image) throws IllegalStateException, IOException {
		
		// 비밀번호 암호화 후 다시 저장
		String orgin = memberDto.getPw();
		String result = encoder.encode(orgin);
		memberDto.setPw(result);
		// 회원 가입
		memberService.regist(memberDto);

		if (member_image.isEmpty() == false) {
			memberService.member_image_regist(id, member_image);
		}

		if (pets.equals("예")) {
			int real_pet_age = Integer.parseInt(pet_age);
			petDto.setMember_id(id);
			petDto.setName(pet_name);
			petDto.setAge(real_pet_age);
			petDto.setType(pet_type);
			petDto.setEct(pet_ect);

			memberService.pet_regist(petDto);
			int pet_no = memberService.pet_no(pet_name, pet_age, pet_type);

			if (pet_image.isEmpty() == false) {
				memberService.pet_image_regist(pet_no, pet_image);
			}

		}
		return "redirect:login";
	}

	// 로그인
	// login으로 이동
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	// 로그인 검사 후 제출
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto memberDto, HttpSession session, Model model) {

		MemberDto find = memberService.login(memberDto);

		if (find == null) {// 아이디가 없으면 -> 에러
			return "redirect:/member/login?error";
		} else { // 아이디가 있으면 --> 비밀번호 매칭검사

			boolean correct = encoder.matches(memberDto.getPw(), find.getPw());
			if (correct == true) {// 비밀번호 일치
				session.setAttribute("id", find.getId());
				session.setAttribute("grade", find.getGrade());
				String id = find.getId();
				memberService.updatelastlogin(id);

				// 블랙리스트인지 검사
				int isBlack = memberService.isBlack(id);
				int blackcount;
				if (isBlack > 0) {
					// 경고횟수
					blackcount = memberService.blackcount(id);
				} else {
					blackcount = 0;
				}
				model.addAttribute("blackcount", blackcount);
				return "redirect:/";
			} else { // 비밀번호 불일치
				return "redirect:/member/login?error";
			}
		}
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("grade");
		return "redirect:/";
	}

	//  회원이미지 가져오기(src로 주소)
	@GetMapping("/member/image")
	public ResponseEntity<ByteArrayResource> member_image(@RequestParam int member_image_no)
			throws UnsupportedEncodingException, IOException {
		return memberService.member_image(member_image_no);
	}

	// 펫이미지 가져오기(src로 주소)
	@GetMapping("/pet/image")
	public ResponseEntity<ByteArrayResource> pet_image(@RequestParam int pet_no)
			throws UnsupportedEncodingException, IOException {
		int pet_image_no = memberService.pet_image_no(pet_no);
		return memberService.pet_image(pet_image_no);
	}

	// 아이디찾기-GetMapping
	@GetMapping("/findid")
	public String findid() {
		return "member/findid";
	}

	// 아이디찾기-PostMapping
	@PostMapping("/findid")
	public String findid(@RequestParam String name, @RequestParam String email, @RequestParam String phone, Model model,
			MemberDto memberDto) {
		memberDto.setName(name);
		memberDto.setEmail(email);
		memberDto.setPhone(phone);
		String id = memberService.findid(memberDto);
		model.addAttribute("id", id);
		return "member/findid_result";
	}

	// 아이디중복검사
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {
		return memberService.userIdCheck(user_id);
	}

	// 이메일 중복검사
	@RequestMapping(value = "emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		return memberService.emailCheck(email);
	}

	// 회원탈퇴 비밀번호검사 페이지 연결
	@GetMapping("/memberdelete")
	public String memberdelete(@RequestParam String id, Model model) {
		model.addAttribute("id", id);
		return "member/memberdelete";
	}

	// 회원탈퇴
	@PostMapping("/memberdelete")
	public String memberdelete(@RequestParam String id, @RequestParam String password, Model model,
			HttpSession session) {
		// 회원탈퇴처리
		memberService.memberdelete(id, password);
		// 회원 탈퇴되었는지 검사
		int idExist = memberService.idExist(id);
		if (idExist >= 1) {
			model.addAttribute("id", id);
			String fail = "fail";
			model.addAttribute("fail", fail);
			return "redirect:/member/mylistchange";
		} else {
			session.removeAttribute("id");
			session.removeAttribute("grade");
			return "redirect:/";
		}
	}

	// 반려동물 정보수정 페이지 연결
	@GetMapping("/petchange")
	public String petchange(@RequestParam String pet_no, Model model) {
		model.addAttribute("pet_no", pet_no);

		// 동물정보 가져오기
		PetImagePetDto pet = memberService.getpet(pet_no);
		model.addAttribute("pet", pet);
		return "member/petchange";
	}

	// 회원정보수정
	@GetMapping("/mylistchange")
	public String edit(@RequestParam String id, Model model) {
		MemberDto dto = memberService.mylist(id);
		model.addAttribute("member", dto);

		MemberDto list = memberService.mylist(id);
		model.addAttribute("mylist", list);

		// 해당 회원의 회원 이미지 번호 구해오기
		Integer member_image_no = memberService.member_image_no(id);
		model.addAttribute("member_image_no", member_image_no);

		List<PetImagePetDto> petlist = memberService.mylistpet(id);
		model.addAttribute("mylistpet", petlist);

		return "member/mylistchange";
	}

	// 회원정보 수정 제출
	@PostMapping("/mylistchange")
	public String edit(@ModelAttribute MemberDto memberDto, @RequestParam MultipartFile member_image,
			@RequestParam int member_image_no,
//			@RequestParam String member_noimage,
			HttpSession session) throws IllegalStateException, IOException {

		String id = (String) session.getAttribute("id");
		int imagecount = memberService.imagecount(id);
		
		memberService.mylistchange(memberDto);

		if (member_image.isEmpty() == false) {
			if(imagecount==1) {
				MemberImageDto memberImageDto = memberService.getImageInfo(member_image_no);
				memberService.member_image_change(memberImageDto, member_image);			
			}else {
				memberService.member_image_regist(id, member_image);
			}
		}
//		else if(member_noimage.equals("true")){
//			if(imagecount==1) {
//				memberService.member_noimage(id);			
//			}
//		}

		return "redirect:mylist";
	}

	// 반려동물 정보수정 제출 후 연결
	@PostMapping("/petchange")
	public String petchange(@RequestParam String pet_no, @ModelAttribute PetDto petDto,
//			@RequestParam String pet_noimage,
			@RequestParam MultipartFile pet_image
			) throws IllegalStateException, IOException {
		memberService.petchange(petDto);

		int pet_image_pet_no = Integer.parseInt(pet_no);
		int petimagecount = memberService.petimagecount(pet_image_pet_no);
		
		if (pet_image.isEmpty() == false) {
			if(petimagecount==1) {			
				PetImageDto petImageDto = memberService.getPetImageInfo(pet_image_pet_no);
				memberService.pet_image_change(petImageDto, pet_image);
			}else {
				memberService.pet_image_regist(Integer.parseInt(pet_no), pet_image);
			}
		}
//		else {
//			if(petimagecount==1) {			
//				if(Integer.parseInt(pet_noimage)>0) {
//					memberService.pet_noimage(Integer.parseInt(pet_noimage));
//				}			
//			}
//		}

		return "redirect:mylist";
	}

	// 펫 추가
	@PostMapping("/pet_regist")
	public String pet_regist(@RequestParam String member_id, @ModelAttribute PetDto petDto,
			@RequestParam MultipartFile pet_image, HttpSession session) throws IllegalStateException, IOException {
		memberService.pet_regist(petDto);
		String pet_name = petDto.getName();
		String pet_age = Integer.toString(petDto.getAge());
		String pet_type = petDto.getType();
		int pet_no = memberService.pet_no(pet_name, pet_age, pet_type);

		// 이미지등록
		if (pet_image.isEmpty() == false) {
			memberService.pet_image_regist(pet_no, pet_image);
		}

		// 펫 마리수 세기
		String id = (String) session.getAttribute("id");
		int count = memberService.pet_exist(id);
		if (count == 0) {
			memberService.pet_No(id);
		} else {
			memberService.pet_Yes(id);
		}

		return "redirect:mylist";
	}

	// 펫 삭제
	@GetMapping("/pet_delete")
	public String pet_delete(@RequestParam int pet_no, HttpSession session) {
		memberService.pet_delete(pet_no);

		// 펫 마리수 세기
		String id = (String) session.getAttribute("id");
		int count = memberService.pet_exist(id);
		if (count == 0) {
			memberService.pet_No(id);
		} else {
			memberService.pet_Yes(id);
		}

		return "redirect:mylist";
	}

	// 내정보보기
	@GetMapping("/mylist")
	public String mylist(HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");

		MemberDto list = memberService.mylist(id);
		model.addAttribute("mylist", list);

		// 해당 회원의 회원 이미지 번호 구해오기
		Integer member_image_no = memberService.member_image_no(id);
		model.addAttribute("member_image_no", member_image_no);

		List<PetImagePetDto> petlist = memberService.mylistpet(id);
		model.addAttribute("mylistpet", petlist);

		return "member/mylist";
	}
	
	// 내정보보기
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");
		
		MemberDto mypage2 = memberService.mypage2(id);
		model.addAttribute("mypage2",mypage2);
		
		int size = memberService.size(id);
		model.addAttribute("size",size);

		MemberDto list = memberService.mypage(id);
		model.addAttribute("mypage", list);

		// 해당 회원의 회원 이미지 번호 구해오기
		Integer member_image_no = memberService.member_image_no(id);
		model.addAttribute("member_image_no", member_image_no);

		List<PetImagePetDto> petlist = memberService.mylistpet(id);
		model.addAttribute("mylistpet", petlist);
		
		// 블랙리스트 인지 확인
		int blackListc = adminService.blackListc(id);
		model.addAttribute("blackCount", blackListc);
		return "member/mypage";
	}


	// 내 리뷰 상세보기 페이지 연결
	@GetMapping("/myreview_content")
	public String myreview_content(@RequestParam int review_no, Model model) {

		ReviewSitterDto review = memberService.myreview_content(review_no);

		model.addAttribute("review", review);

		return "member/myreview_content";
	}

	// 내가 쓴 리뷰 페이지 연결
	@GetMapping("/myreview")
	public String myreview(HttpSession session, Model model, HttpServletRequest req) {

		String id = (String) session.getAttribute("id");

		int pagesize = 10;
		int navsize = 10;
		int pno;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
			if (pno <= 0)
				throw new Exception();
		} catch (Exception e) {
			pno = 1;
		}
		int finish = pno * pagesize;
		int start = finish - (pagesize - 1);

		int count = memberService.getmyreviewCount(id);

		List<ReviewSitterDto> review = memberService.myreview(id, start, finish);

		model.addAttribute("review", review);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);

		return "member/myreview";
	}

	// 내 예약 조회 페이지 연결
	@GetMapping("/myreservation")
	public String myreservation(HttpSession session, Model model, HttpServletRequest req) throws Exception {

		String id = (String) session.getAttribute("id");

		int pagesize = 10;
		int navsize = 10;
		int pno;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
			if (pno <= 0)
				throw new Exception();
		} catch (Exception e) {
			pno = 1;
		}
		int finish = pno * pagesize;
		int start = finish - (pagesize - 1);

		// 승인된 예약의 개수
		int count = memberService.getmyreservationCount(id);

		// 멤버+예약+결제+리뷰 합친 예약.
		List<ReservationReviewPaySitterDto> reservation_list = memberService.myreservation(id, start, finish);

		model.addAttribute("reservation_list", reservation_list);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);

		return "member/myreservation";
	}

	// 내가 쓴 돌봄게시판 연결
	@GetMapping("/mycareboard")
	public String mycareboard(HttpSession session, Model model, HttpServletRequest req) throws Exception {

		String id = (String) session.getAttribute("id");
		String grade = (String) session.getAttribute("grade");

		int pagesize = 10;
		int navsize = 10;
		int pno;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
			if (pno <= 0)
				throw new Exception();
		} catch (Exception e) {
			pno = 1;
		}
		int finish = pno * pagesize;
		int start = finish - (pagesize - 1);

		// 내가 만든 돌봄방 개수
		int count = memberService.getmycareboardCount(id);

		// 돌봄방 정보
		List<CarePetsitterDto> careboard_list = memberService.mycareboard(id, start, finish);

		model.addAttribute("id", id);
		model.addAttribute("grade", grade);
		model.addAttribute("careboard_list", careboard_list);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);

		return "member/mycareboard";
	}

	// 내가 쓴 문의/신고 게시판 연결
	@GetMapping("/myqnaboard")
	public String myfaqboard(HttpSession session, Model model, HttpServletRequest req) throws Exception {

		String id = (String) session.getAttribute("id");

		int pagesize = 10;
		int navsize = 10;
		int pno;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
			if (pno <= 0)
				throw new Exception();
		} catch (Exception e) {
			pno = 1;
		}
		int finish = pno * pagesize;
		int start = finish - (pagesize - 1);

		// 내가 올린 문의/신고 개수
		int count = memberService.getmyqnaboardCount(id);

		// 내가 올린문의/신고 정보
		List<QnaVO> qnaboard_list = memberService.myqnaboard(id, start, finish);

		model.addAttribute("id", id);
		model.addAttribute("qnaboard_list", qnaboard_list);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);

		return "member/myqnaboard";
	}

	// 내가 쓴 Save the Pets! 게시판 연결
	@GetMapping("/mystrayboard")
	public String mystrayboard(HttpSession session, Model model, HttpServletRequest req) throws Exception {

		String id = (String) session.getAttribute("id");

		int pagesize = 10;
		int navsize = 10;
		int pno;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
			if (pno <= 0)
				throw new Exception();
		} catch (Exception e) {
			pno = 1;
		}
		int finish = pno * pagesize;
		int start = finish - (pagesize - 1);

		// 내가 올린 Save the Pets ! 개수
		int count = memberService.getmystrayboardCount(id);

		// 내가 Save the Pets ! 정보
		List<StrayVO> strayboard_list = memberService.mystrayboard(id, start, finish);

		model.addAttribute("id", id);
		model.addAttribute("strayboard_list", strayboard_list);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);

		return "member/mystrayboard";
	}

	// 결제 비밀번호 확인
	@GetMapping("/PayPw")
	public String PayPw() {
		return "member/PayPw";
	}

	@PostMapping("/PayPw")
	public String PayPw(@ModelAttribute MemberDto memberDto, HttpSession session) {

		MemberDto find = memberService.login(memberDto);

		if (find == null) { // 로그인 실패
			return "redirect:/PayPw?error";

		} else { // 로그인 성공
			session.setAttribute("id", find.getId());
			session.setAttribute("grade", find.getGrade());
			String id = find.getId();
			memberService.updatelastlogin(id);
			return "redirect:/";
		}
	}
}
