package org.kbs.playto.books.controller;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.kbs.playto.books.common.LZWCompress;
import org.kbs.playto.books.common.ValueObject;
import org.kbs.playto.books.dao.WorkingMemoryDAO;
import org.kbs.playto.books.entity.WorkingMemory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value="/working")
public class WorkingMemoryController implements ServletContextAware {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private WorkingMemoryDAO workingMemoryDAO;

    private ServletContext servletContext;

    public void setServletContext(ServletContext servletCtx){
        this.servletContext=servletCtx;
    }

    @RequestMapping(value="/memory",method = {RequestMethod.GET, RequestMethod.POST})
    public String workingMemory(HttpServletRequest request, HttpServletResponse response, Model model){

        return "working/memory";
    }


    @RequestMapping(value = "/memory/save", method = RequestMethod.POST)
    @ResponseBody
    public String workingMemorySubmit(@RequestBody WorkingMemory workingMemory) {

        long unixTime = System.currentTimeMillis();
        String fileName = workingMemory.getTeamCode() + "_" + Long.toString(unixTime) + ".png";
        logger.debug(workingMemory.toString());
        String imageDataDecompress = LZWCompress.decompress(workingMemory.getImageData());
        //logger.debug("DATA = " + imageDataDecompress);
        logger.debug(servletContext.getRealPath("/resources/upload/memory") + '/' + fileName);
        String fileData = imageDataDecompress.replaceAll("data:image/png;base64,", "");
        String filePath = servletContext.getRealPath("/resources/upload/memory") + '/' + fileName;
        byte[] byteData = Base64.decodeBase64(fileData);
        try {
            FileUtils.writeByteArrayToFile(new File(filePath), byteData);
        } catch (IOException e) {
            logger.error("ERROR", e);
        }

        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamCode", workingMemory.getTeamCode());
        quizVO.setString("xy1", workingMemory.getXy1());
        quizVO.setString("xy2", workingMemory.getXy2());
        quizVO.setString("xy3", workingMemory.getXy3());
        quizVO.setString("xy4", workingMemory.getXy4());
        quizVO.setString("xy5", workingMemory.getXy5());
        quizVO.setString("xy6", workingMemory.getXy6());
        quizVO.setString("xy7", workingMemory.getXy7());
        quizVO.setString("xy8", workingMemory.getXy8());
        quizVO.setString("xy9", workingMemory.getXy9());
        quizVO.setString("xy10", workingMemory.getXy10());
        quizVO.setString("xy11", workingMemory.getXy11());
        quizVO.setString("xy12", workingMemory.getXy12());
        quizVO.setString("xy13", workingMemory.getXy13());
        quizVO.setString("xy14", workingMemory.getXy14());
        quizVO.setString("xy15", workingMemory.getXy15());
        quizVO.setString("xy16", workingMemory.getXy16());
        quizVO.setString("xy17", workingMemory.getXy17());
        quizVO.setString("xy18", workingMemory.getXy18());
        quizVO.setString("xy19", workingMemory.getXy19());
        quizVO.setString("xy20", workingMemory.getXy20());
        quizVO.setString("fileName", fileName);
        quizVO.setString("imageData", imageDataDecompress);

        workingMemoryDAO.insertWorkingMemory(quizVO);

        return filePath;
    }

}
