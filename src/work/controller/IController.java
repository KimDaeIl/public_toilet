package work.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public interface IController {

    void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}
