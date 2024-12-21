import re

def anonymize_chat(input_file, output_file):
    # Regular expression to identify WhatsApp message format
    message_pattern = r'(\[\d{2}/\d{2}/\d{4}, \d{2}:\d{2}\]) (.+?): (.+)'
    
    # Dictionary to map original sender names to anonymized names
    user_mapping = {}
    user_count = 1
    
    with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8') as outfile:
        for line in infile:
            match = re.match(message_pattern, line)
            if match:
                timestamp, sender, message = match.groups()
                
                # Anonymize sender
                if sender not in user_mapping:
                    user_mapping[sender] = f'User{user_count}'
                    user_count += 1
                anonymized_sender = user_mapping[sender]
                
                # Write anonymized line to output file
                outfile.write(f'{timestamp} {anonymized_sender}: {message}\n')
            else:
                # Write lines that don't match the message pattern as-is (e.g., system messages)
                outfile.write(line)
    
    print("Anonymization complete!")
    print("User mapping:")
    for original, anonymized in user_mapping.items():
        print(f'{original} -> {anonymized}')

# Replace 'chat.txt' with the path to your exported chat file
input_file = 'whatsapp_chat_export.txt'
output_file = 'anonymized_chat.txt'
anonymize_chat(input_file, output_file)
