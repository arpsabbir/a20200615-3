<?php
!defined('IN_ONEZ') && exit('Access Denied');
#名称：开发调试相关
#标识：debug

class onezphp_debug extends onezphp{
  function __construct(){
    
  }
  function index(){
    $ptoken=onez()->gp('ptoken');
    $this->remote($ptoken);
  }
  function remote($ptoken=false){
    include(dirname(__FILE__).'/php/remote.php');
  }
  function showerror(){
    ob_clean();
    error_reporting(E_ALL & ~E_NOTICE);
    ini_set('display_errors', '1');
    //将出错信息输出到一个文本文件
    onez()->mkdirs(ONEZ_CACHE_PATH . '/cache/plugins/debug/error');
    ini_set('error_log', ONEZ_CACHE_PATH . '/cache/plugins/debug/error/error_log.txt');
  }
}