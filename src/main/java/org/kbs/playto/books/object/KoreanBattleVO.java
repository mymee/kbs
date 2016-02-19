package org.kbs.playto.books.object;

import org.springframework.web.multipart.MultipartFile;

public class KoreanBattleVO {

    private String teamCode = null;
    private String battleQuize = null;
    private String battleQuizeSubmit = null;
    private String battleQuizeCapture = null;

    public String getTeamCode() {
        return teamCode;
    }

    public void setTeamCode(String teamCode) {
        this.teamCode = teamCode;
    }

    public String getBattleQuize() {
        return battleQuize;
    }

    public void setBattleQuize(String battleQuize) {
        this.battleQuize = battleQuize;
    }

    public String getBattleQuizeSubmit() {
        return battleQuizeSubmit;
    }

    public void setBattleQuizeSubmit(String battleQuizeSubmit) {
        this.battleQuizeSubmit = battleQuizeSubmit;
    }

    public String getBattleQuizeCapture() {
        return battleQuizeCapture;
    }

    public void setBattleQuizeCapture(String battleQuizeCapture) {
        this.battleQuizeCapture = battleQuizeCapture;
    }

    @Override
    public String toString() {
        return "KoreanBattleVO{" +
                "teamCode='" + teamCode + '\'' +
                ", battleQuize='" + battleQuize + '\'' +
                ", battleQuizeSubmit='" + battleQuizeSubmit + '\'' +
                ", battleQuizeCapture=" + battleQuizeCapture +
                '}';
    }
}
