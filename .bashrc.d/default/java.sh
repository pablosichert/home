alias java-format="java -jar ~/bin/google-java-format-1.5-all-deps.jar --replace"
j() { java-format $@.java && javac $@.java && java $@; }
