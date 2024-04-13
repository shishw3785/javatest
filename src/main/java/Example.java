import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import java.io.FileWriter;
import java.io.IOException;

@RestController
@EnableAutoConfiguration
public class Example {

    @RequestMapping("/")
    String home() throws IOException {
        fileWriterMethod("C:/Users/DELL/Desktop/data/logs", "哈喽,Java.");
        return "Hello World - v5!";
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(Example.class, args);
    }

    public static void fileWriterMethod(String filepath, String content) throws IOException {
        try (FileWriter fileWriter = new FileWriter(filepath)) {
            fileWriter.append(content);
        }
    }

    }
