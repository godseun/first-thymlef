package com.daehwa.b2b.config;

import com.daehwa.b2b.common.error.CustomExceptionResolver;
import java.util.List;
import org.springframework.context.annotation.Configuration;
import org.springframework.mobile.device.DeviceHandlerMethodArgumentResolver;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.mobile.device.site.SitePreferenceHandlerInterceptor;
import org.springframework.mobile.device.site.SitePreferenceHandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver;

@Configuration
@EnableWebMvc
public class WebMvcConfiguration implements WebMvcConfigurer {

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new DeviceResolverHandlerInterceptor());
    registry.addInterceptor(new SitePreferenceHandlerInterceptor());

    WebMvcConfigurer.super.addInterceptors(registry);
  }

  @Override
  public void addArgumentResolvers(
    List<HandlerMethodArgumentResolver> resolvers
  ) {
    resolvers.add(new DeviceHandlerMethodArgumentResolver());
    resolvers.add(new SitePreferenceHandlerMethodArgumentResolver());
    WebMvcConfigurer.super.addArgumentResolvers(resolvers);
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry
      .addResourceHandler("/resources/**")
      .addResourceLocations("classpath:/static/resources/");

    registry
      .addResourceHandler("/js/**")
      .addResourceLocations("classpath:/static/resources/js/");
    registry
      .addResourceHandler("/css/**")
      .addResourceLocations("classpath:/static/resources/css/");
    registry
      .addResourceHandler("/m/**")
      .addResourceLocations("classpath:/static/resources/m/");

    registry
      .addResourceHandler("/img/**")
      .addResourceLocations("classpath:/static/resources/img/");
    registry
      .addResourceHandler("/upload/**")
      .addResourceLocations("classpath:/static/upload/");

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
