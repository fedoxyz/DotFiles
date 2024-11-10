#!/bin/bash                                                                                                                                                                

 # Define the virtual environment directory                                                                                                                                 
 VENV_DIR="$HOME/aider/venv"                                                                                                                                                

 # Define the chat history directory                                                                                                                                        
 CHAT_HISTORY_DIR="$HOME/aider/chats"                                                                                                                                       

 # Create the chat history directory if it doesn't exist                                                                                                                    
 mkdir -p "$CHAT_HISTORY_DIR"                                                                                                                                               

 # Create a unique filename for the chat history                                                                                                                            
 timestamp=$(date +"%Y%m%d_%H%M%S")                                                                                                                                         
 chat_history_file="$CHAT_HISTORY_DIR/chat_history_$timestamp.md"                                                                                                           

 # Check if the virtual environment exists                                                                                                                                  
 if [ ! -d "$VENV_DIR" ]; then                                                                                                                                              
   # Create the virtual environment if it doesn't exist                                                                                                                     
   python3 -m venv "$VENV_DIR"                                                                                                                                              
 fi                                                                                                                                                                         

 # Activate the virtual environment                                                                                                                                         
 source "$VENV_DIR/bin/activate"                                                                                                                                            

 # Export OPENAI_API_KEY into the virtual environment
 export OPENAI_API_KEY="${OPENAI_API_KEY}"

 # Check if aider-chat is installed, install if not                                                                                                                         
 if ! pip show aider-chat > /dev/null 2>&1; then                                                                                                                            
   pip install aider-chat                                                                                                                                                   
 fi                                                                                                                                                                         

 # Run aider with the specified options and save chat history                                                                                                               
 aider --chat-history-file "$chat_history_file" "$@"
