import nltk
from nltk.corpus import stopwords

# Download NLTK stopwords if not already downloaded
nltk.download('stopwords')

def remove_stopwords(text):
    # Tokenize the text
    words = nltk.word_tokenize(text)
    
    # Get the list of English stopwords
    stop_words = set(stopwords.words('english'))
    
    # Remove stopwords from the tokenized text
    filtered_words = [word for word in words if word.lower() not in stop_words]
    
    # Join the filtered words back into a string
    filtered_text = ' '.join(filtered_words)
    
    return filtered_text

def main():
    # Read the passage from a text file
    with open('passage.txt', 'r') as file:
        passage = file.read()

    # Remove stopwords from the passage
    cleaned_passage = remove_stopwords(passage)
    
    # Print the cleaned passage
    print("Original Passage:")
    print(passage)
    print("\nCleaned Passage:")
    print(cleaned_passage)

if __name__ == "__main__":
    main()