package com.daehwa.b2b.admin.domain;

public class Paging {

  // 현재페이지
  public static final int DEFAULT_PAGE = 1;
  // 하나의 리스트에 뿌러질 ROW 수(기본)
  public static final int DEFAULT_ITEM_SIZE = 10;
  // 하나의 리스트에 뿌러질 ROW 수(리스트)
  public static final int LIST_ITEM_SIZE = 80;
  // 하나의 리스트에 뿌러질 ROW 수(포토그리드)
  public static final int PHOTO_ITEM_SIZE = 100;
  // 페이징이 필요 없는 경우 사용할 ROW 수
  public static final int INFINITE_ITEM_SIZE = 999999999;
  // 페이지 수
  public static final int DEFAULT_PAGE_SIZE = 10;

  // 시작 ROW
  private int startRow;
  // 끝 ROW
  private int endRow;
  // 현재페이지
  private int currentPage;
  // 페이지 수
  private int pageSize;
  // 하나의 리스트에 뿌러질 ROW 수
  private int itemSize;

  public Paging() {
    this.currentPage = DEFAULT_PAGE;
    this.itemSize = DEFAULT_ITEM_SIZE;
    this.pageSize = DEFAULT_PAGE_SIZE;
    this.process();
  }

  public Paging(int currentPage) {
    this.currentPage = currentPage;
    this.itemSize = DEFAULT_ITEM_SIZE;
    this.pageSize = DEFAULT_PAGE_SIZE;
    this.process();
  }

  public Paging(int currentPage, int itemSize) {
    this.currentPage = currentPage;
    this.itemSize = itemSize;
    this.pageSize = DEFAULT_PAGE_SIZE;
    this.process();
  }

  private void process() {
    this.startRow = itemSize * (currentPage - 1);
    this.endRow = startRow + itemSize;
  }

  public int getStartRow() {
    return startRow;
  }

  public void setStartRow(int startRow) {
    this.startRow = startRow;
  }

  public int getEndRow() {
    return endRow;
  }

  public void setEndRow(int endRow) {
    this.endRow = endRow;
  }

  public int getCurrentPage() {
    return currentPage;
  }

  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }

  public int getPageSize() {
    return pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public int getItemSize() {
    return itemSize;
  }

  public void setItemSize(int itemSize) {
    this.itemSize = itemSize;
  }

  @Override
  public String toString() {
    return (
      "Paging [startRow=" +
      startRow +
      ", endRow=" +
      endRow +
      ", currentPage=" +
      currentPage +
      ", pageSize=" +
      pageSize +
      ", itemSize=" +
      itemSize +
      "]"
    );
  }
}
