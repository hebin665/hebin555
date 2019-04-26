package exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object arg2,
										 Exception arg3) {
		CustomException customException=null;
		if(arg3 instanceof CustomException) {
			customException=(CustomException) arg3;
		}else {
			customException=new CustomException("未知错误！");
		}
		String message=customException.getMessage();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("error", message);
		modelAndView.setViewName("/error");
		return modelAndView;
	}

}
