caesar <- function(text, h) {
  concat_text = paste(text, collapse = " ")
  h <- h %% 26
  int_chars = utf8ToInt(concat_text)
  int_ciphered_chars = c()
  for (f in int_chars) {
    g = f
    if (65 <= f && f <= 90) { # between "A" and "Z" ?
      g <- f + h
      if (g < 65) {           # before "A"
        g <- 91 - (65 - g)
      } else if (g > 90) {    # after "Z"
        g <- 65 + (g - 90)
      }
    } else if (97 <= f && f <= 122) { # between "a" and "z" ?
      g <- f + h
      if (g < 97) {               # before "a"
        g <- 123 - (97 - g)
      } else if (g > 122) {       # after "z"
        g <- 97 + (g - 122)
      }
    }
    
    int_ciphered_chars <- c(int_ciphered_chars, g)
    
  }
  intToUtf8(int_ciphered_chars)
}
# Test cases
caesar("abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ", 0)
# [1]  "abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ"
caesar("abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ", 1)
# [1]  "bcdefghijk lmnopqrstvwxyzb BCDEFGHIJK LMNOPQRSTUVWXYZB"
caesar("abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ", -1)
# [1]  "zbcdefghij klmnopqrsuvwxyz ZBCDEFGHIJ KLMNOPQRSTUVWXYZ"
caesar("abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ", 2)
# [1]  "cdefghijkl mnopqrstuwxyzbc CDEFGHIJKL MNOPQRSTUVWXYZBC"
caesar("abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ", -2)
# [1]  "yzbcdefghi jklmnopqrtuvwxy YZBCDEFGHI JKLMNOPQRSTUVWXY"
caesar("abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ", 28)
# [1]  "cdefghijkl mnopqrstuwxyzbc CDEFGHIJKL MNOPQRSTUVWXYZBC"
caesar("abcdefghij klmnopqrsuvwxyz ABCDEFGHIJ KLMNOPQRSTUVWXYZ", -28)
# [1]  "yzbcdefghi jklmnopqrtuvwxy YZBCDEFGHI JKLMNOPQRSTUVWXY"

caesar(c("Is", "really cool"), 2)
# [1] "Ku tgcnnb eqqn"