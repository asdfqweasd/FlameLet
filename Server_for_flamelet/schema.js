var mongoose = require("mongoose")
var Schema = mongoose.Schema

var manager = new Schema({
    name: String,
    age: Number,
    gender: String,
    totalRating: Number,
    ratingTime: Number,
    averageRating: Number,
    position: String,
    Image: String,
    comments: String,
    email: String,
    password_hash: Number
})

var post = new Schema({

    title: String,
    content: String,
    like: Number,
    poster: String,
    dependency: String,
    imageIDs: String,
    fakeName: String
})

var tree_hole = new Schema({
    title: String,
    content: String,
    like: Number,
    poster: String,
    dependency: String,
    imageIDs: String,
    fakeName: String
})

const Manager = mongoose.model("managerdata", manager)
const Forum = mongoose.model("forumedata", post)
const TreeHole = mongoose.model("treeholedata", tree_hole)

module.exports = {Manager,Forum, TreeHole}