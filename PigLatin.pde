public void setup() 
{
	String[] lines = loadStrings("TheStarSpangledBanner.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
		ArrayList<String> wordsArray = returnWordsArray(lines[i]);
		for (String word : wordsArray)
		{
	 		System.out.print(pigLatin(word) + ' ');
	 	}
	 	System.out.println();
	}
}
public void draw()
{
    //not used
}

public ArrayList<String> returnWordsArray(String line)
{
	ArrayList<String> result = new ArrayList<String>();
	int indexOfFirstChar = 0;
	for (int i = 0; i < line.length(); i++)
	{
		if (line.charAt(i) == ' ' || line.charAt(i) == ',' || line.charAt(i) == '.')
		{
			if (line.charAt(indexOfFirstChar) != ' ')
				result.add(line.substring(indexOfFirstChar, i));
			indexOfFirstChar = i + 1;
		}
	}
	return result;
}

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
	int firstVowelIndex = findFirstVowel(sWord);
	if(firstVowelIndex == -1)
	{
		return sWord + "ay";
	}
	if (firstVowelIndex == 0)
	{
		return sWord + "way";
	}
	if (sWord.length() >= 2 && sWord.substring(0, 2).equals("qu"))
	{
		return sWord.substring(2, sWord.length()) + "quay";
	}
	if (firstVowelIndex != 0)
	{
		return sWord.substring(firstVowelIndex, sWord.length()) + sWord.substring(0, firstVowelIndex) + "ay";
	}
	return sWord;
}
