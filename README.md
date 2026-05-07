# Robot Framework - Testing Organo Application

Project developed during a course on Robot Framework. In this course, I am testing the Organo Application.

## 🚀 Getting Started

### 📋 Prerequisites

To run this project, you need
- [Python 3](https://www.python.org/downloads/)
- [Node.js](https://nodejs.org/en/download)
- **Robot Framework**
```bash
pip install robotframework
```
- **Selenium Library**
```bash
pip install --upgrade robotframework-seleniumlibrary
```
- **Faker Library**
```bash
pip install robotframework-faker
```

### 🔧 Installing

First, you need to set up the application under test (Organo).

1. Open the Organo Folder:
```bash
cd organo-project-to-test
```

2. Install dependencies:
```bash
npm install
```

3. Run the project
```bash
npm start
```

The application will be available at http://localhost:3000


## ⚙️ Running the tests

With the Organo application running, open a new terminal and navigate to the robot project folder:
```bash
cd robot-project
```

Then, chooce a test to run.

**Example**:
```
robot first_test.robot
```
