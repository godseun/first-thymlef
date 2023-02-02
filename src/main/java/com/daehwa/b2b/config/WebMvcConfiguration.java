package com.daehwa.b2b.config;

import com.daehwa.b2b.common.error.CustomExceptionResolver;
import java.util.List;
import org.springframework.context.annotation.Configuration;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver;

@Configuration
@EnableWebMvc
public class WebMvcConfiguration implements WebMvcConfigurer {

  @Override
  public void configureViewResolvers(ViewResolverRegistry registry) {
    registry.jsp("/WEB-INF/", ".jsp");

    WebMvcConfigurer.super.configureViewResolvers(registry);
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new DeviceResolverHandlerInterceptor());
    WebMvcConfigurer.super.addInterceptors(registry);
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry
      .addResourceHandler("/resources/**")
      .addResourceLocations("/WEB-INF/resources/");

    WebMvcConfigurer.super.addResourceHandlers(registry);
  }

  @Override
  public void extendHandlerExceptionResolvers(
    List<HandlerExceptionResolver> resolvers
  ) {
    HandlerExceptionResolver eResolver = resolvers
      .stream()
      .filter(x -> x instanceof ExceptionHandlerExceptionResolver)
      .findAny()
      .get();

    int index = resolvers.indexOf(eResolver);
    resolvers.add(index, new CustomExceptionResolver());

    WebMvcConfigurer.super.extendHandlerExceptionResolvers(resolvers);
  }
}
