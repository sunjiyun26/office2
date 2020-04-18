package com.sjy.onlineoffice.doc;


import com.sjy.onlineoffice.doc.impl.FreemarkerService;
import com.sjy.onlineoffice.utils.ImgUtils;
import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FreemarkerServiceTest {
    @Test
    public void exportDoc() throws Exception {
        IDocument IDocument = new FreemarkerService();

        Map<String, Object> dataMap = new HashMap<String, Object>();
        dataMap.put("name", "yacongliu");

        String msg = IDocument.exportDoc(dataMap, "D:/test.doc");


        System.out.println(msg);

    }

    @Test
    public void exportDocTable() throws Exception {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        IDocument IDocument = new FreemarkerService("tem");

        dataMap.put("code", "001");
        dataMap.put("name", "张三" + ";<w:br />" + "李四");
        dataMap.put("number", "tbkg001");
        dataMap.put("phone", "125829321931");
        List list = new ArrayList();
        Map<String, String> map1 = new HashMap<String, String>(3);
        map1.put("jl", "2019-03 天津大学");


        Map<String, String> map2 = new HashMap<String, String>(3);
        map2.put("jl", "2015-03 南开大学");

        list.add(map1);
        list.add(map2);

        dataMap.put("columns", list);

        String msg = IDocument.exportDoc(dataMap, "D:/testTable.doc");

        System.out.println(msg);

    }

    @Test
    public void exportDocFactory() throws Exception {
        IDocument IDocument = DocumentFactory.produceFreemarker();

        Map<String, Object> dataMap = new HashMap<String, Object>(2);
        dataMap.put("name", "yacong_liu");

        String msg = IDocument.exportDoc(dataMap, "D:/test.doc");


        System.out.println(msg);

    }

    @Test
    public void getImgBase64CodeTest() throws IOException {
        String imgPath = "D:/tx.png";
        String imgBase64Code = ImgUtils.getImgBase64Code(imgPath);

        System.out.println(imgBase64Code);
    }

}