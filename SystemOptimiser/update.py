from dotenv import load_dotenv
import os, sys

dir = os.path.dirname(os.path.abspath(__file__))
with open(f"{dir}\\name.txt") as f:
    CurrentName = f.read().strip()

def main() -> None:
    try:
        NewName = sys.argv[1]    
    except:
        return print("Usage: python update.py [name]")
    
    for path in [f"{dir}\\{i}" for i in os.listdir(dir) if os.path.basename(__file__) not in i and "exe" not in i]:
        with open(path) as f: 
            content = f.read()
        with open(path, "w") as f: 
            f.write(content.replace(CurrentName, NewName))
            print(f"Successfully overwrote [{path}]")

if __name__=="__main__":
    load_dotenv()
    main()
