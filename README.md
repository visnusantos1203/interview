# Grader

Grader is a library that will be used to output the grades for each
student in the class including their average given a CSV.

## Problem

Implement the Grader library so when used with "scrape.rb", it displays
the name of the student, grades for each subject and their total average grade.

When you run this script:

```
bundle exec ruby -Ilib scrape.rb
```

We expect the following output:

```
+---------------+---------+------+---------+---------+
| Name          | English | Math | Physics | Average |
+---------------+---------+------+---------+---------+
| Billy Joel    | 92      | 88   | 85      | 88      |
+---------------+---------+------+---------+---------+
| Omar Hassan   | 78      | 98   | 95      | 90      |
+---------------+---------+------+---------+---------+
| Ashley Bubble | 85      | 90   | 91      | 88      |
+---------------+---------+------+---------+---------+
```

Use TDD/BDD if necessary and test parts that you think are worthwhile.

This project uses git but does not have a remote repository. So keep committing
your progress so we can see your thought process as well as how you structure your
commits and commit messages.

When you're done. Compress the file again and send it back.

Thanks! And happy coding!

## Testing

To run the tests, simply do:

```
bundle exec rake spec
```
