package org.kbs.playto.books.entity;

/**
 * Created by mymee on 2016-02-21.
 */
public class BooksQuizAnswer {

    private String teamSeq = "";
    private String quizAnswer = "";
    private String quizNum = "";
    private String quizChance = "";

    public String getTeamSeq() {
        return teamSeq;
    }

    public void setTeamSeq(String teamSeq) {
        this.teamSeq = teamSeq;
    }

    public String getQuizAnswer() {
        return quizAnswer;
    }

    public void setQuizAnswer(String quizAnswer) {
        this.quizAnswer = quizAnswer;
    }

    public String getQuizNum() {
        return quizNum;
    }

    public void setQuizNum(String quizNum) {
        this.quizNum = quizNum;
    }

    public String getQuizChance() {
        return quizChance;
    }

    public void setQuizChance(String quizChance) {
        this.quizChance = quizChance;
    }
}
