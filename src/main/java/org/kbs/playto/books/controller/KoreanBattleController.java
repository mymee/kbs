package org.kbs.playto.books.controller;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.kbs.playto.books.common.LZWCompress;
import org.kbs.playto.books.common.ValueObject;
import org.kbs.playto.books.dao.KoreanBattleDAO;
import org.kbs.playto.books.entity.KoreanBattle;
import org.kbs.playto.books.entity.KoreanBattleProcess;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Map;

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
        ValueObject quizVO = new ValueObject();
        quizVO.setString("quizNum", request.getParameter("quizNum"));

        quizVO.setString("quizProcessYN", "1");

        model.addAttribute("BATTLE_QUIZ",koreanBattleDAO.selectQuiz(quizVO));
        return "korean/battle";
    }

    @RequestMapping(value = "/battle/process", method = RequestMethod.POST)
    @ResponseBody
    public ValueObject koreanBattleProcess(@RequestBody KoreanBattleProcess koreanBattleProcess, HttpServletRequest request) {

        ValueObject quizVO = new ValueObject();
        quizVO.setNumber("quizNum", koreanBattleProcess.getQuizNum());
        quizVO.setNumber("quizProcessYN", koreanBattleProcess.getQuizProcessYN());

        koreanBattleDAO.updateKoreanBattleProcess(quizVO);

        return koreanBattleDAO.selectQuiz(quizVO);
    }

    @RequestMapping(value = "/battle/start", method = RequestMethod.GET)
    @ResponseBody
    public ValueObject koreanBattleProcessYN(HttpServletRequest request) {
        ValueObject quizVO = new ValueObject();

        return koreanBattleDAO.selectQuiz(quizVO);
    }

    @RequestMapping(value = "/battle/save", method = RequestMethod.POST)
    @ResponseBody
    public String koreanBattleSubmit(@RequestBody KoreanBattle koreanBattle) {

        long unixTime = System.currentTimeMillis();
        String fileName = koreanBattle.getTeamCode() + "_" + Long.toString(unixTime) + ".png";
        logger.debug(koreanBattle.toString());
        String imageDataDecompress = LZWCompress.decompress(koreanBattle.getImageData());
        //logger.debug("DATA = " + imageDataDecompress);
        logger.debug(servletContext.getRealPath("/resources/upload/battle") + '/' + fileName);
        String fileData = imageDataDecompress.replaceAll("data:image/png;base64,", "");
        String filePath = servletContext.getRealPath("/resources/upload/battle") + '/' + fileName;
        byte[] byteData = Base64.decodeBase64(fileData);
        try {
            FileUtils.writeByteArrayToFile(new File(filePath), byteData);
        } catch (IOException e) {
            logger.error("ERROR", e);
        }

        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamCode", koreanBattle.getTeamCode());
        quizVO.setString("quizAnswer1", koreanBattle.getQuizAnswer1());
        quizVO.setString("quizAnswer2", koreanBattle.getQuizAnswer2());
        quizVO.setString("quizAnswer3", koreanBattle.getQuizAnswer3());
        quizVO.setString("quizAnswer4", koreanBattle.getQuizAnswer4());
        quizVO.setString("quizAnswer5", koreanBattle.getQuizAnswer5());
        quizVO.setString("quizAnswer6", koreanBattle.getQuizAnswer6());
        quizVO.setString("quizAnswer7", koreanBattle.getQuizAnswer7());
        quizVO.setString("quizAnswer8", koreanBattle.getQuizAnswer8());
        quizVO.setString("quizAnswer9", "");
        quizVO.setString("quizAnswer10", "");
        quizVO.setString("fileName", fileName);
        quizVO.setString("imageData", imageDataDecompress);

        koreanBattleDAO.insertKoreanBattleAnswer(quizVO);

        return filePath;
    }

    @RequestMapping(value = "/battle/test", method = RequestMethod.GET)
    public String koreanBattleTest(HttpServletRequest request, HttpServletResponse response, Model model) {
        ValueObject quizVO = new ValueObject();

        return "korean/battle_back";
    }
}
