// This is still necessary although we have websocket
// Websocket provide mechanism for establishing persistent, full-duplex communication channel between the client and the server
// Why? 
// 1. Business logic - handle message formatting, massage storage, validation, any actions developer/company want to perform when messages are sent or received.
// 2. Integration with other modules - act as central hub for coordinating messaging-related operations across various parts of your application.
// 3. Authentication and Authorization - 
// 4. Data Validation - Ensure incoming messages adhere to a certain structure or format before broadcasting them to other clients. This can help prevent malformed or malicious messages
// 5. Database integration - interact with database to store and retrieve messages.
// 6. Custom features - implement messaging threading, history, user presence, or message notification 