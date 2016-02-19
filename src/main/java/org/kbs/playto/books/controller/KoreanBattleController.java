package org.kbs.playto.books.controller;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.kbs.playto.books.dao.KoreanBattleDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping(value = "/korean")
public class KoreanBattleController implements ServletContextAware{
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private KoreanBattleDAO koreanBattleDAO;

    private ServletContext servletContext;

    public void setServletContext(ServletContext servletCtx){
        this.servletContext=servletCtx;
    }

    @RequestMapping(value = "/battle", method = RequestMethod.GET)
    public String koreanBattle(HttpServletRequest request, HttpServletResponse response, Model model) {


        return "korean/battle";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public String koreanBattleSubmit(HttpServletRequest request) {

        logger.debug(request.getParameter("imageData"));

        return imageFileSave(request.getParameter("teamCode"),request.getParameter("imageData"));
    }

    public String imageFileSave(String fileName, String imageData) {

        logger.debug(servletContext.getRealPath("/upload") + "\\" + fileName + ".png");
        String fileData = imageData.replaceAll("data:image/png;base64,", "");
        String filePath = servletContext.getRealPath("/upload") + "\\" + fileName + ".png";
        byte[] byteData = Base64.decodeBase64(fileData);
        try {
            FileUtils.writeByteArrayToFile(new File(filePath), byteData);
        } catch (IOException e) {
            logger.error("ERROR", e);
        }

        return filePath;
    }
}
