package com.daehwa.b2b.config;

import net.sf.ehcache.Cache;
import net.sf.ehcache.config.CacheConfiguration;
import net.sf.ehcache.config.CacheConfiguration.TransactionalMode;
import net.sf.ehcache.config.DiskStoreConfiguration;
import net.sf.ehcache.config.PersistenceConfiguration;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CacheConfig {

  private Cache createCacheConfig(String name) {
    CacheConfiguration getCacheConfig = new CacheConfiguration()
      .eternal(true)
      .timeToIdleSeconds(0)
      .timeToLiveSeconds(0)
      .maxEntriesLocalHeap(10000)
      .maxEntriesLocalDisk(100000)
      .memoryStoreEvictionPolicy("LRU")
      .transactionalMode(TransactionalMode.OFF)
      .persistence(
        new PersistenceConfiguration()
          .strategy(PersistenceConfiguration.Strategy.LOCALTEMPSWAP)
      )
      .name(name);
    return new Cache(getCacheConfig);
  }

  @Bean
  public EhCacheCacheManager ehCacheCacheManager() {
    net.sf.ehcache.config.Configuration configuration = new net.sf.ehcache.config.Configuration();
    // path는 DiskStoreConfiguration 클래스의 ENV enum 참조하거나 PhysicalPath로 설정
    configuration.diskStore(
      new DiskStoreConfiguration().path("java.io.tmpdir")
    );

    net.sf.ehcache.CacheManager manager = net.sf.ehcache.CacheManager.create(
      configuration
    );

    // 캐시 추가
    manager.addCache(createCacheConfig("getSelect")); // test
    manager.addCache(createCacheConfig("CACHE_M_PRDT_LIST"));
    manager.addCache(createCacheConfig("CACHE_PRDT_LIST"));
    manager.addCache(createCacheConfig("CACHE_BANNER_LIST"));

    return new EhCacheCacheManager(manager);
  }
}
