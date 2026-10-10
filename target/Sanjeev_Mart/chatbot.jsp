<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sanjeev Mart Assistant</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f5f7fa;
        }

        .chat-container {
            width: 420px;
            margin: 60px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            overflow: hidden;
        }

        .chat-header {
            background: #131921;
            color: white;
            padding: 18px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        #chatBox {
            height: 350px;
            padding: 15px;
            overflow-y: auto;
        }

        .bot {
            background: #eeeeee;
            padding: 10px;
            margin: 8px 0;
            border-radius: 10px;
        }

        .user {
            background: #ffb703;
            padding: 10px;
            margin: 8px 0;
            border-radius: 10px;
            text-align: right;
        }

        .input-area {
            display: flex;
            padding: 12px;
            border-top: 1px solid #ddd;
        }

        #message {
            flex: 1;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
        }

        button {
            margin-left: 8px;
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            background: #ffb703;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="chat-container">

    <div class="chat-header">
        Sanjeev Mart Assistant
    </div>

    <div id="chatBox">
        <div class="bot">
            Hello! How can I help you today?
        </div>
    </div>

    <div class="input-area">
        <input type="text"
               id="message"
               placeholder="Ask about products, cart, orders...">

        <button type="button" onclick="sendMessage()">
            Send
        </button>
    </div>

</div>

<script>
function sendMessage() {

    const input = document.getElementById("message");
    const chatBox = document.getElementById("chatBox");
    const message = input.value.trim();

    if (message === "") {
        return;
    }

    const userDiv = document.createElement("div");
    userDiv.className = "user";
    userDiv.textContent = message;
    chatBox.appendChild(userDiv);

    input.value = "";

    fetch("chatbot", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "message=" + encodeURIComponent(message)
    })
    .then(response => response.text())
    .then(reply => {

        const botDiv = document.createElement("div");
        botDiv.className = "bot";
        botDiv.textContent = reply;

        chatBox.appendChild(botDiv);
        chatBox.scrollTop = chatBox.scrollHeight;
    })
    .catch(() => {

        const botDiv = document.createElement("div");
        botDiv.className = "bot";
        botDiv.textContent = "Unable to connect to assistant.";

        chatBox.appendChild(botDiv);
    });
}

document.getElementById("message")
    .addEventListener("keydown", function(event) {

        if (event.key === "Enter") {
            sendMessage();
        }
    });
</script>

</body>
</html>