package com.ymz.common.aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
//공통 로직을 처리할 메소드들을 구현할 클래스
public class LoggerAspect {
//
	
	private static Logger logger = Logger.getLogger(LoggerAspect.class);
	//핵심로직이 처리되기 전에 먼저 실행될 공통로직
	public void beforeLogger(){
		logger.info("LoggerAspect.beforeLogger()실행");
	}
	//핵심로직(메소드)처리후 실행
	//정상처리 후- 핵심 메소드가 return한 경우
	public void afterReturn(Object returnValue){
		logger.info("LoggerAspect.afterReturn()실행.리턴값"+returnValue);
	}
	//핵심로직에서 오류발생한 후 호출.
	public void afterThrow(Throwable ex){
		logger.error("LoggerAspect.afterThrow실행", ex);
	}
	//around처리 공통 메소드 - 핵심로직이 실행된 시간을 로그로 기록.
	public Object timeCheckAround(ProceedingJoinPoint jp) throws Throwable{
		//before
		try{
			long start =System.currentTimeMillis();//실행시간까지를 밀리초로 알려준다.
			long start2 = System.nanoTime();//실행시간까지 나노초로 리턴					
		Object ret = jp.proceed();//핵심메소드를 호출
		long end = System.currentTimeMillis();
		long end2 = System.nanoTime();
		logger.info("걸린시간 :" +(end-start)+"밀리초,"+(end2-start2)+"나노초");
		return ret;
		}catch(Throwable t){
			//after-retunning 시점
			logger.error("실행도중 오류 발생");
			throw t;
		}
	}
}
