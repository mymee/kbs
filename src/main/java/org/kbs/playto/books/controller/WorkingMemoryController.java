package org.kbs.playto.books.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/memory")
public class WorkingMemoryController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());
}
