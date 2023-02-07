package com.daehwa.b2b.config;

import com.daehwa.b2b.config.filter.CustomAuthenticationFIlter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.filter.CorsFilter;

@EnableWebSecurity
public class WebSecurityConfig {

  @Autowired
  private CustomAuthenticationFIlter filter;

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http)
    throws Exception {
    http
      .csrf()
      .disable()
      .sessionManagement()
      .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
      .and()
      .authorizeRequests()
      .antMatchers(
        "/m/**",
        "/img/**",
        "/css/**",
        "/js/**",
        "/upload/**",
        "/resources/**",
        "/favicon*/**",
        "/error/**"
      )
      .permitAll();

    http.authorizeRequests().antMatchers("/shop/**").permitAll();
    http.authorizeRequests().antMatchers("/store/**").permitAll();
    http.authorizeRequests().antMatchers("/front/**").permitAll();
    http.authorizeRequests().antMatchers("/api/**").permitAll();

    // http.authorizeRequests().antMatchers("/test/**").authenticated();

    http.addFilterAfter(filter, CorsFilter.class);

    return http.build();
  }
}
