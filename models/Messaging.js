const { DataTypes } = require('sequelize');
const sequelize = require('../config/db.config');

const Message = sequelize.define(
    "Message",
    {
        message_id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            field: "message_id" // Match the field name from your database
        },
        conversation_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'Conversation', // Replace 'Conversation' with your actual Conversation model name
                key: 'conversation_id'
            }
        },
        sender_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'User', // Replace 'User' with your actual User model name
                key: 'user_id'
            }
        },
        content: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        sent_at: {
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW
        }
    }
);

module.exports = Message;