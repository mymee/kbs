package org.kbs.playto.books.entity;

import java.util.List;

public class KoreanBattle {

    String teamCode = "";
    List<Integer> imageData = null;
    String quizNum;
    String quizAnswer1 = "";
    String quizAnswer2 = "";
    String quizAnswer3 = "";
    String quizAnswer4 = "";
    String quizAnswer5 = "";
    String quizAnswer6 = "";
    String quizAnswer7 = "";
    String quizAnswer8 = "";
    String quizProcessYN;

    public String getQuizAnswer1() {
        return quizAnswer1;
    }

    public void setQuizAnswer1(String quizAnswer1) {
        this.quizAnswer1 = quizAnswer1;
    }

    public String getQuizAnswer2() {
        return quizAnswer2;
    }

    public void setQuizAnswer2(String quizAnswer2) {
        this.quizAnswer2 = quizAnswer2;
    }

    public String getQuizAnswer3() {
        return quizAnswer3;
    }

    public void setQuizAnswer3(String quizAnswer3) {
        this.quizAnswer3 = quizAnswer3;
    }

    public String getQuizAnswer4() {
        return quizAnswer4;
    }

    public void setQuizAnswer4(String quizAnswer4) {
        this.quizAnswer4 = quizAnswer4;
    }

    public String getQuizAnswer5() {
        return quizAnswer5;
    }

    public void setQuizAnswer5(String quizAnswer5) {
        this.quizAnswer5 = quizAnswer5;
    }

    public String getQuizAnswer6() {
        return quizAnswer6;
    }

    public void setQuizAnswer6(String quizAnswer6) {
        this.quizAnswer6 = quizAnswer6;
    }

    public String getQuizAnswer7() {
        return quizAnswer7;
    }

    public void setQuizAnswer7(String quizAnswer7) {
        this.quizAnswer7 = quizAnswer7;
    }

    public String getQuizAnswer8() {
        return quizAnswer8;
    }

    public void setQuizAnswer8(String quizAnswer8) {
        this.quizAnswer8 = quizAnswer8;
    }

    public String getTeamCode() {
        return teamCode;
    }

    public void setTeamCode(String teamCode) {
        this.teamCode = teamCode;
    }

    public List<Integer> getImageData() {
        return imageData;
    }

    public void setImageData(List<Integer> imageData) {
        this.imageData = imageData;
    }

    public String getQuizNum() {
        return quizNum;
    }

    public void setQuizNum(String quizNum) {
        this.quizNum = quizNum;
    }

    public String getQuizProcessYN() {
        return quizProcessYN;
    }

    public void setQuizProcessYN(String quizProcessYN) {
        this.quizProcessYN = quizProcessYN;
    }

    @Override
    public String toString() {
        return "KoreanBattle{" +
                "teamCode='" + teamCode + '\'' +
                //", imageData=" + imageData +
                ", quizNum=" + quizNum +
                ", quizAnswer1='" + quizAnswer1 + '\'' +
                ", quizAnswer2='" + quizAnswer2 + '\'' +
                ", quizAnswer3='" + quizAnswer3 + '\'' +
                ", quizAnswer4='" + quizAnswer4 + '\'' +
                ", quizAnswer5='" + quizAnswer5 + '\'' +
                ", quizAnswer6='" + quizAnswer6 + '\'' +
                ", quizAnswer7='" + quizAnswer7 + '\'' +
                ", quizAnswer8='" + quizAnswer8 + '\'' +
                ", quizProcessYN=" + quizProcessYN +
                '}';
    }
}
