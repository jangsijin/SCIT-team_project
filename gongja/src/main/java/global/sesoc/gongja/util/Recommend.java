package global.sesoc.gongja.util;

import java.util.Random;

public class Recommend {

	private String[] positive = {
			"https://www.youtube.com/watch?v=TpPwI_Lo0YY",
			"https://www.youtube.com/watch?v=QgAg9OzUCgY",
			"https://www.youtube.com/watch?v=s5r-4TBXgBI&t=1s",
			"https://www.youtube.com/watch?v=5Ed8FgvqR0I",
			"https://www.youtube.com/watch?v=yYLsfconw5A",
			"https://www.youtube.com/watch?v=jg7xntb_C2U",
			"https://www.youtube.com/watch?v=z1gruk7p7oQ",
			"https://www.youtube.com/watch?v=aMk1GYvEqUM",
			"https://www.youtube.com/watch?v=PkbsKNDO530",
			"https://www.youtube.com/watch?v=ZNba6QhUYM8",
			"https://www.youtube.com/watch?v=hL6dlLf-Wj4",
			"https://www.youtube.com/watch?v=rJuAUzw1aAM&list=PLReHj3Xz224OpciMigrHOnSsuipPFusWD",
			"https://www.youtube.com/watch?v=uCjKHv6fEk8&list=PL2xfMt_jbcnUflZJp0IQ378FTkoanQldO",
			"https://www.youtube.com/watch?v=LJTRFfcLI1Q",
			"https://www.youtube.com/watch?v=b84k3aSfaZM",
			"https://www.youtube.com/watch?v=1IxkKnS5QTA&t=61s",
			"https://www.youtube.com/watch?v=udOZemoqbD4&t=314s",
			"https://www.youtube.com/watch?v=v5JzHnjCKj0",
			"https://www.youtube.com/watch?v=lL3Ij7k6cms",
			"https://www.youtube.com/watch?v=yZ10Lj0Ozyw",
			"https://www.youtube.com/watch?v=1XGNqsXSASo",
			"https://www.youtube.com/watch?v=ThrgLGJrerY",
			"https://www.youtube.com/watch?v=Dic27EnDDls",
			"https://www.youtube.com/watch?v=ZfGzXCUqlJg",
			"https://www.youtube.com/watch?v=2MF3khBYYao",
			"https://www.youtube.com/watch?v=fLk-dYXs_rM",
			"https://www.youtube.com/watch?v=Bf00g81MGB0",
			"https://www.youtube.com/watch?v=F5d0mZ6mWjs&t=125s",
			"https://www.youtube.com/watch?v=as_vTI0_r9g",
			"https://www.youtube.com/watch?v=C5DKXoZSPWI",
			"https://www.youtube.com/watch?v=nztiGQ3M9C0",
			"https://www.youtube.com/watch?v=TkBLIGd21Ww",
			"https://www.youtube.com/watch?v=M4DFGqq2zAA"
	};
	
	private String[] negative = {
			"https://www.youtube.com/watch?v=f0rpWNud8GI",
			"https://www.youtube.com/watch?v=QgAg9OzUCgY",
			"https://www.youtube.com/watch?v=s5r-4TBXgBI&t=1s",
			"https://www.youtube.com/watch?v=5Ed8FgvqR0I",
			"https://www.youtube.com/watch?v=yYLsfconw5A",
			"https://www.youtube.com/watch?v=jg7xntb_C2U",
			"https://www.youtube.com/watch?v=z1gruk7p7oQ",
			"https://www.youtube.com/watch?v=aMk1GYvEqUM",
			"https://www.youtube.com/watch?v=PkbsKNDO530",
			"https://www.youtube.com/watch?v=ZNba6QhUYM8",
			"https://www.youtube.com/watch?v=hL6dlLf-Wj4",
			"https://www.youtube.com/watch?v=rJuAUzw1aAM&list=PLReHj3Xz224OpciMigrHOnSsuipPFusWD",
			"https://www.youtube.com/watch?v=uCjKHv6fEk8&list=PL2xfMt_jbcnUflZJp0IQ378FTkoanQldO",
			"https://www.youtube.com/watch?v=LJTRFfcLI1Q",
			"https://www.youtube.com/watch?v=b84k3aSfaZM",
			"https://www.youtube.com/watch?v=1IxkKnS5QTA&t=61s",
			"https://www.youtube.com/watch?v=udOZemoqbD4&t=314s",
			"https://www.youtube.com/watch?v=v5JzHnjCKj0",
			"https://www.youtube.com/watch?v=lL3Ij7k6cms",
			"https://www.youtube.com/watch?v=yZ10Lj0Ozyw",
			"https://www.youtube.com/watch?v=1XGNqsXSASo",
			"https://www.youtube.com/watch?v=ThrgLGJrerY",
			"https://www.youtube.com/watch?v=Dic27EnDDls",
			"https://www.youtube.com/watch?v=ZfGzXCUqlJg",
			"https://www.youtube.com/watch?v=2MF3khBYYao",
			"https://www.youtube.com/watch?v=fLk-dYXs_rM",
			"https://www.youtube.com/watch?v=Bf00g81MGB0",
			"https://www.youtube.com/watch?v=F5d0mZ6mWjs&t=125s",
			"https://www.youtube.com/watch?v=as_vTI0_r9g",
			"https://www.youtube.com/watch?v=C5DKXoZSPWI",
			"https://www.youtube.com/watch?v=nztiGQ3M9C0",
			"https://www.youtube.com/watch?v=TkBLIGd21Ww",
			"https://www.youtube.com/watch?v=M4DFGqq2zAA"
	};
	
	public String[] getPositive() {
		return positive;
	}

	public void setPositive(String[] positive) {
		this.positive = positive;
	}

	public String[] getNegative() {
		return negative;
	}

	public void setNegative(String[] negative) {
		this.negative = negative;
	}

	public String Recommender(int value) {
		
		Random random = new Random();
		int ran = random.nextInt(4);
		
		// negative 0 positive 1
		if(value == 0) {
			return negative[ran];
		} else {
			return positive[ran];
		}
	}
}
