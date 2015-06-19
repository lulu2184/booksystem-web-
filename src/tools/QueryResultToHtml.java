package tools;

import backend.query.QueryResult;

import java.util.List;
import java.util.ListIterator;

/**
 * Created by LU on 15/6/11.
 */
public class QueryResultToHtml {

    public static String transform(QueryResult rs){
        String htmlMsg = "";
        if (!rs.isValid()){
            htmlMsg = "Sorry, " + rs.getMessage();
        }else{
            htmlMsg = "<table> <tr>";
            ListIterator <String> field_it = rs.fields_name.listIterator();
            while (field_it.hasNext()){
                htmlMsg += "<td>" + field_it.next() + "</td>";
            }
            htmlMsg += "</tr>";

            ListIterator<List<String>> row_it = rs.result.listIterator();
            List<String> row;
            int count = 0;
            while (row_it.hasNext()){
                count++;
                htmlMsg += "<tr>";
                row = row_it.next();
                ListIterator <String> value_it = row.listIterator();
                while (value_it.hasNext()) {
                    htmlMsg += "<td>" + value_it.next() + "</td>";
                }
                htmlMsg += "</tr>";
            }

            htmlMsg += "</table>";
        }
        return htmlMsg;
    }

    public static String transform(QueryResult rs, List<String> keyField, List<String> dElement){
        String htmlMsg = "";
        if (!rs.isValid()){
            htmlMsg = "Sorry, " + rs.getMessage();
        }else{
            htmlMsg = "<table> <tr>";
            ListIterator <String> field_it = rs.fields_name.listIterator();
            while (field_it.hasNext()){
                htmlMsg += "<td>" + field_it.next() + "</td>";
            }
            htmlMsg += "</tr>";

            ListIterator<List<String>> row_it = rs.result.listIterator();
            List<String> row;
            int count = 0;
            while (row_it.hasNext()){
                count++;
                htmlMsg += "<tr>";
                row = row_it.next();
                ListIterator <String> value_it = row.listIterator();
                field_it = rs.fields_name.listIterator();
                //String value = "";
                while (value_it.hasNext()) {
                    String tv = value_it.next();
                    htmlMsg += "<td>" + tv + "</td>";
                }
                ListIterator <String> key = keyField.listIterator();
                ListIterator <String> element = dElement.listIterator();
                while (key.hasNext() && element.hasNext()){
                    String thisKey = key.next();
                    value_it = row.listIterator();
                    field_it = rs.fields_name.listIterator();
                    while (value_it.hasNext() && field_it.hasNext()){
                        String value = value_it.next();
                        if (field_it.next().equals(thisKey)){
                            htmlMsg += String.format("<td>" + element.next() + "</td>", thisKey + "=" + value);
                            break;
                        }
                    }
                }
                htmlMsg += "</tr>";
            }

            htmlMsg += "</table>";
        }
        return htmlMsg;
    }

    public static String rktransform(QueryResult rs){
        String htmlMsg = "";
        if (!rs.isValid()){
            htmlMsg = "Sorry, " + rs.getMessage();
        }else{
            htmlMsg = "<table><tr><td>rank</td>";
            ListIterator <String> field_it = rs.fields_name.listIterator();
            while (field_it.hasNext()){
                htmlMsg += "<td>" + field_it.next() + "</td>";
            }
            htmlMsg += "</tr>";

            ListIterator<List<String>> row_it = rs.result.listIterator();
            List<String> row;
            int count = 0;
            while (row_it.hasNext()){
                count++;
                htmlMsg += "<tr><td>" + Integer.toString(count) + "</td>";
                row = row_it.next();
                ListIterator <String> value_it = row.listIterator();
                while (value_it.hasNext()) {
                    htmlMsg += "<td>" + value_it.next() + "</td>";
                }
                htmlMsg += "</tr>";
            }

            htmlMsg += "</table>";
        }
        return htmlMsg;
    }
}
