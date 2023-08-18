const { DataTypes } = require('sequelize');
const sequelize = require('../config/db.config');

const ReviewRating = sequelize.define(
    "ReviewRating",
    {
        review_id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            field: "review_id" // Match the field name from your database
        },
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'User', // Replace 'User' with your actual User model name
                key: 'user_id'
            }
        },
        rating: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                min: 1,
                max: 5
            }
        },
        review_text: {
            type: DataTypes.TEXT
        }
    }
);

module.exports = ReviewRating;