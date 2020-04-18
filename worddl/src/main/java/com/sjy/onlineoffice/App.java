package com.sjy.onlineoffice;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        App app = new App();
        app.test();
    }

    public void test(){
        Map<String,Object> dataMap = new HashMap<String, Object>();
        try {
            //编号
            dataMap.put("year", "2012");
            dataMap.put("numseri", "2012");
//            //日期
//            dataMap.put("date", new SimpleDateFormat("yyyy年MM月dd日").format(new SimpleDateFormat("yyyy-MM-dd").parse("2018-09-19")));
//            //附件张数
//            dataMap.put("number", 1);
//            //受款人
//            dataMap.put("payee", "张三");
//            //付款用途
//            dataMap.put("use_of_payment", "test");
//            //大写金额
//            dataMap.put("capitalization_amount", MoneyUtils.change(100.20));
            //小写金额
//            dataMap.put("lowercase_amount", "100");
            //Configuration 用于读取ftl文件
            Configuration configuration = new Configuration();
            configuration.setDefaultEncoding("utf-8");

            /**
             * 以下是两种指定ftl文件所在目录路径的方式，注意这两种方式都是
             * 指定ftl文件所在目录的路径，而不是ftl文件的路径
             */
            configuration.setDirectoryForTemplateLoading(
                    new File("F:\\onlineoffice\\worddl\\src\\main\\java\\com\\sjy\\onlineoffice\\template"));

            //输出文档路径及名称
            File outFile = new File("D:/报销信息导出.doc");

            //以utf-8的编码读取ftl文件
            Template template = configuration.getTemplate("dianli.ftl", "utf-8");
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "utf-8"), 10240);
            template.process(dataMap, out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
