package com.liclass.common.log;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import java.util.Arrays;

@Slf4j
/*스프링에서 빈(Baen)으로 인식하기 위해서 사용*/
@Component
/* 해당 클래스의 객체가 Aspect를 구현한 것임으로 나타내가 위해 사용*/
@Aspect
public class LoggerAdvice {

    /* execution(@execution) 메서드를 기준으로 Pointcut을 설정
    /*(리턴타입 패키지.클래스명.메서드(매개변수))
    @Before("execution(* com.spring..*Impl.*(..))")
    public void printLogging(){
        log.info("------------------------------------");
        log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
        log.info("------------------------------------");
    }*/

  /*  @Before("execution(* com.spring..*Impl.*(..)) && args(bvo)")
    public void printLogging(BoardVO bvo){
        log.info("------------------------------------");
        log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
        log.info("------------------------------------");
        log.info("BoardVO 타입의 bvo 파라미터 값 : " + bvo);
    }*/

 /*   @Before("execution(* com.spring..*Impl.*(..))")
    public void printLogging(JoinPoint jp){
        log.info("------------------------------------");
        log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
        //getArgs() : 전달되는 모든 파라미터들을 Object 배열로 가져온다.
        //getSignature() : 실행하는 대상 객체의 대한 정보를 알아낼 때 사용.
        log.info("[호출 메서드명] " + jp.getSignature().getName());
        log.info("[호출 메서드의 파라미터 값] " + Arrays.toString(jp.getArgs()));
        log.info("------------------------------------");
    }*/

    /* 예외가 발생한 시점에 동작 */
    @AfterThrowing(pointcut = "execution(* com.liclass..*Impl.*(..))", throwing = "exception")
    public void exceptionLogging(JoinPoint jp, Throwable exception){
        log.info("------------------------------------");
        log.info("[예외 발생]");
        log.info("[예외 발생 메서드명]" +jp.getSignature().getName());
        //exception.printStackTrace();
        log.info("[예외 메시지] " + exception);
        log.info("------------------------------------");
    }

//* 비지니스 로직 메서드가 정상적으로 수행된 후 동작*//*
/*    @AfterReturning(pointcut = "execution(* com.spring..*Impl.*(..))", returning = "returnValue")
    public void afterReturningMethod(JoinPoint jp, Object returnValue){
        log.info("------------------------------------");
        log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
        log.info("afterReturningMethod() called......." + jp.getSignature().getName());
        log.info("[리턴 결과] : " + returnValue);
        log.info("------------------------------------");
    }*/
    @Around("execution(* com.liclass..*Impl.*(..))")
    public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable{
        log.info("-------------------------------------");
        log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");

        //long startTime = System.currentTimeMillis();
        StopWatch watch = new StopWatch();
        watch.start();
        log.info("[호출 메서드의 파라미터 값] " + Arrays.toString(pjp.getArgs()));

        Object result = null;
        //proceed(): 실제 target 객체의 메스드를 실행하는 기능.
        result = pjp.proceed();

        //long endTime = System.currentTimeMillis();
        watch.stop();

        log.info("[Class]" + pjp.getTarget().getClass());
        //logger.info(pjp.getSignature().getName()+":소요시간 " + (endTime-startTime)+"ms");
        log.info("[호출 메서드명]" + pjp.getSignature().getName());
        log.info("[소요시간]" + watch.getTotalTimeSeconds() + "ms");
        log.info("[리턴 결과]" + result);
        log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
        log.info("-------------------------------------");

        return result;
    }
}