package org.kbs.playto.books.entity;

/**
 * Created by mymee on 2016-02-21.
 */
public class ReturnMessage {
    int returnCode;
    String returnMessage;

    public int getReturnCode() {
        return returnCode;
    }

    public void setReturnCode(int returnCode) {
        this.returnCode = returnCode;
    }

    public String getReturnMessage() {
        return returnMessage;
    }

    public void setReturnMessage(String returnMessage) {
        this.returnMessage = returnMessage;
    }
}
