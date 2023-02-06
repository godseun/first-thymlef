package com.daehwa.b2b.config.resolver;

import javax.servlet.http.HttpServletRequest;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.mobile.device.site.SitePreferenceUtils;
import org.springframework.mobile.device.util.ResolverUtils;
import org.springframework.mobile.device.view.LiteDeviceDelegatingViewResolver;
import org.springframework.util.Assert;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ViewResolver;

// TODO: Auto-generated Javadoc
/**
 * Integration of Tiles with Spring Moblie
 *
 * Dynamically loads the the location of JSP using Tiles Expression Language.
 */

public class TilesSupportLiteDeviceDelegatingViewResolver
  extends LiteDeviceDelegatingViewResolver {

  /** The device type. */
  private String deviceType;

  /**
   * Instantiates a new tiles support lite device delegating view resolver.
   *
   * @param resolver
   *            the resolver
   */
  public TilesSupportLiteDeviceDelegatingViewResolver(ViewResolver resolver) {
    super(resolver);
  }

  /*
   * (non-Javadoc)
   *
   * @see
   * org.springframework.mobile.device.view.LiteDeviceDelegatingViewResolver#
   * getDeviceViewNameInternal(java.lang.String)
   */
  protected String getDeviceViewNameInternal(String viewName) {
    String attributeValue = null;
    RequestAttributes attrs = RequestContextHolder.getRequestAttributes();
    Assert.isInstanceOf(ServletRequestAttributes.class, attrs);
    HttpServletRequest request =
      ((ServletRequestAttributes) attrs).getRequest();
    Device device = DeviceUtils.getCurrentDevice(request);
    SitePreference sitePreference = SitePreferenceUtils.getCurrentSitePreference(
      request
    );
    String resolvedViewName = viewName;
    if (ResolverUtils.isNormal(device, sitePreference)) {
      resolvedViewName = getNormalPrefix() + viewName + getNormalSuffix();
      attributeValue = getNormalPrefix();
    } else if (ResolverUtils.isMobile(device, sitePreference)) {
      resolvedViewName = getMobilePrefix() + viewName + getMobileSuffix();
      attributeValue = getMobilePrefix();
    } else if (ResolverUtils.isTablet(device, sitePreference)) {
      resolvedViewName = getTabletPrefix() + viewName + getTabletSuffix();
      attributeValue = getTabletPrefix();
    }

    if ("index".equals(viewName)) {
      resolvedViewName = resolvedViewName.replace("index", "/index");
    }

    request.setAttribute(deviceType, attributeValue);
    return stripTrailingSlash(resolvedViewName);
  }

  /**
   * Strip trailing slash.
   *
   * @param viewName
   *            the view name
   * @return the string
   */
  private String stripTrailingSlash(String viewName) {
    if (viewName.endsWith("//")) {
      return viewName.substring(0, viewName.length() - 1);
    }
    return viewName;
  }

  /**
   * Sets the device type.
   *
   * @param deviceType
   *            the deviceType to set
   */
  public void setDeviceType(String deviceType) {
    this.deviceType = deviceType;
  }
}
