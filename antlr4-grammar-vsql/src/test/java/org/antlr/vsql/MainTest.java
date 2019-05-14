package org.antlr.vsql;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr4.vsql.VSqlLexer;
import org.antlr4.vsql.VSqlParser;
import org.apache.commons.lang3.StringUtils;
import org.junit.Ignore;
import org.junit.Test;

public class MainTest {

    @Test
   // @Ignore
    public void test() {
        VSqlLexer lexer = new VSqlLexer(CharStreams.fromString(
                "SELECT uidddd\r\n" + 
                
                "FROM clickstream_log\r\n" + 
                "MATCH\r\n" + 
                "  (PARTITION BY uid, sid ORDER BY ts\r\n" + 
                "   DEFINE\r\n" + 
                "     Entry    AS RefURL  NOT ILIKE 'hhh'," + 
                "     Onsite   AS PageURL ILIKE     's'" + 

                "   PATTERN\r\n" + 
                "     P AS (EntryOnsitePurchase)\r\n" + 
                "   ROWS MATCH FIRST EVENT);"));
        CommonTokenStream stream = new CommonTokenStream(lexer);
        VSqlParser parser = new VSqlParser(stream);
        parser.addErrorListener(new BaseErrorListener() {
            @Override
            public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line,
                    int charPositionInLine, String msg, RecognitionException e) throws RecognitionException {
                System.out.println("ERROR " + msg);
            }
        });
        ParseTree root = parser.root();
        print(root, 1, stream);
    }

    @Test
    public void testExamples() throws IOException {
        for (File f : new File("./examples").listFiles()) {
        	if (f.getName().contains("_skip")) {
        		continue;
        	}
            VSqlLexer lexer = new VSqlLexer(CharStreams.fromPath(f.toPath()));
            CommonTokenStream stream = new CommonTokenStream(lexer);
            VSqlParser parser = new VSqlParser(stream);
            
            parser.addErrorListener(new BaseErrorListener() {
                @Override
                public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line,
                        int charPositionInLine, String msg, RecognitionException e) throws RecognitionException {
                    System.out.println("ERROR " + msg+" "+line);
                }
            });
            ParseTree root = parser.root();
            print(root, 0, stream);
        }
    }

    public static void print(final ParseTree node, final int level, CommonTokenStream stream) {
        final Interval sourceInterval = node.getSourceInterval();
        int line = -1;
        int charStart = -1;
        int endLine = -1;
        int endChar = -1;
        String text = null;
        try {
            final Token firstToken = stream.get(sourceInterval.a);
            line = firstToken.getLine();
            charStart = firstToken.getCharPositionInLine();
            endLine = line;
            endChar = charStart + firstToken.getText().length();
            text = firstToken.getText();
        } catch (Exception e) {

        }

        String data = "@(" + line + ":" + charStart + "," + endLine + ":" + endChar + ") with text: " + text;
        final int tmp = level + 1;
        final StringBuilder sb = new StringBuilder();
        sb.append(StringUtils.repeat("\t", level));
        sb.append(node.getClass().getSimpleName() + ": " + data + " :" + node.getText());
        System.out.println(sb.toString());
        final int n = node.getChildCount();
        for (int i = 0; i < n; i++) {
            final ParseTree c = node.getChild(i);
            print(c, tmp, stream);

        }
    }
}
