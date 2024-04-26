package FINAL.bespoke.model.entity;
import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface FieldComment {
    String value();
}