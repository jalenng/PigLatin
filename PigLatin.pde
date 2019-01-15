public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
    //not used
}

//public int 

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	int position = sWord.length();
	char[] vowels = {'a', 'e', 'i', 'o', 'u'};
	for (int i = 0; i < sWord.length(); i++)
	{
		char fromWord = sWord.charAt(i);
		for (char fromVowels: vowels)
		{
			if (fromWord == fromVowels)
			{
				position = Math.min(position, i);
			} 
		}
	}
	if (position == sWord.length())
	{
		position = -1;
	}
	return position;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	if (findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}
	if (sWord.length() >= 2 && sWord.substring(0, 2).equals("qu"))
	{
		return sWord.substring(2, sWord.length()) + "quay";
	}
	if (findFirstVowel(sWord) != 0)
	{
		return sWord.substring(1, sWord.length()) + sWord.charAt(0) + "ay";
	}
	return sWord;
}
