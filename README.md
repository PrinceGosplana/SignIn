# SignIn
Simple application for technical interview
Project Details:

Step 1.

Create 3 screens (Log In, Sign Up, Forgot Password) with an appropriate button at the center for each. A user opens screens in the listed order (use a navigation stack):

Every 5 seconds show a simple pop up with a message only on the current screen (at the top).

Pop up has 3 states:

- connection error

- connecting

- connection established

When a user presses a button, show a message sent a pop up only if the current state is a connection established.

Please pay attention to the following details:

- Use RxSwift to generate a connection state (in a random manner).

- The next state should not be equal to the previous one.

- Be consistent. Select any architecture of your choice and follow it on all screens. It might include but is not limited to MVC, MVVM, MVP, Redux/Flux.

- Please do not access a shared state directly inside a view controller (e. g. State.shared) and take advantage of the Dependency Injection principle instead.

- Add unit tests for the state generator and the state renderer (e. g. UIViewController)

- Support for iOS 11.0+

Step 2.

Implement an operation queue using RxSwift.

1. Add a button with a Send Commands title to the first screen.

2. When a user presses this button, create an array of commands with ID from 1 to 10.

3. Let’s assume that each command takes ID-seconds to execute.

a. You can use DispatchQueue.main.async(after:) or any other approach to simulate the delay.

4. Each command just prints its ID to the console at the end of the execution.

5. Start the next command only when the previous one is completed.
