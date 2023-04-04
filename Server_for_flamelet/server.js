const express = require('express')
const mongoose = require('mongoose')
var app = express()
var {Manager, Forum, TreeHole} = require('./schema')

mongoose.connect("mongodb+srv://shanti:deco7381@flameletdb.cl0q3tp.mongodb.net/7381DB?retryWrites=true&w=majority")

mongoose.connection.once("open", () => {

    console.log("Connected to DB!")

}).on("error", (error) => {

    console.log("Failed to connect " + error)

})

//express 设置允许跨域访问
app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin,X-Requested-With,Content-Type,Accept,X-File-Name,authorization");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("Content-Type", "application/json;charset=utf-8");
    res.header("X-Powered-By", ' 3.2.1');
    res.header("Cache-Control", "no-store");
    if (req.method == 'OPTIONS') {
        res.sendStatus(200).end();
    } else {
        next();
    }
});

// UQ IP：10.89.96.129
// Home IP: 192.168.0.190
// UQzone IP: 172.23.126.138
var server = app.listen(8081, () => {
    console.log("Server is running!")
})

// create a manager
// POST request
app.post("/createmanager", (req, res) => {

    var manager = new Manager({
        name: req.get("name"),
        age: req.get("age"),
        gender: req.get("gender"),
        totalRating: 0,
        ratingTime: 0,
        averageRating: req.get("averageRating"),
        position: req.get("position"),
        Image: req.get("Image"),
        comments: req.get("comments"),
        email: req.get("email"),
        password_hash: req.get("password_hash")
    })

    console.log(manager)

    manager.save().then(() => {

        if (manager.isNew == false) {
            console.log("Saved data!")
            res.send("Saved data successfully")
        } else {
            console.log("Failed to save data")
        }

    })

})

// delete a manager
// POST request
app.post("/deletemanager", (req, res) => {
    Manager.findOneAndRemove({
        _id: req.get("id")
    }, (err) => {
        if (err != null) {
            console.log("Failed" + err)
        }
    })

    res.send("Deleted!")
})


// update a manager
// PUT request
app.post("/updatemanager", (req, res) => {


    // console.log(req.accepts())
    Manager.findByIdAndUpdate({
        _id: req.get("id")
    }, {
        name: req.get("name"),
        age: req.get("age"),
        gender: req.get("gender"),
        totalRating: req.get("totalRating"),
        ratingTime: req.get("ratingTime"),
        averageRating: req.get("averageRating"),
        position: req.get("position"),
        Image: req.get("Image"),
        comments: req.get("comments"),
        email: req.get("email"),
        password_hash: req.get("password_hash")
    }, (err) => {
        if (err != null) {
            console.log("Failed to update" + err)
        } else {
            console.log("Update find")
        }
    })

    res.send("Updated!")

})


// fetch a manager
// GET request
app.get('/fetchmanager', (req, res) => {
    Manager.find({}).then((DBitems) => {
        res.send(DBitems)
    })
})


/*
    Post part
 */
// fetch a forum post
// GET request
app.get('/fetchpost', (req, res) => {
    Forum.find({}).then((DBitems) => {
        res.send(DBitems)
    })
})


// create a forum
// POST request
app.post("/createnormalpost", (req, res) => {

    var post = new Forum ({

        title: req.get("title"),
        content: req.get("content"),
        like: req.get("like"),
        poster: req.get("poster"),
        dependency: req.get("dependency"),
        imageIDs: req.get('imageIDs'),
        fakeName: "none",
    })

    console.log(post)

    post.save().then(() => {

        if(post.isNew == false) {
            console.log("Saved data!")
            res.send("Saved data successfully")
        } else {
            console.log("Failed to save data")
        }

    })

})

// create a forum for main post
// POST request
app.post('/createmainpost', (req, res) => {
    var post = new Forum ({

        title: req.get("title"),
        content: req.get("content"),
        like: req.get("like"),
        poster: req.get("poster"),
        dependency: "main_post",
        imageIDs: req.get('imageIDs'),
        fakeName: "none",
    })

    var post_id = post._id;

    post.save().then(() => {

        if(post.isNew == false) {
            console.log("Saved data!")
            res.send("Saved data successfully")
            Forum.findOneAndUpdate({
                _id: post_id,
            }, {
                dependency: post_id,
                }, (err) => {
                if (err != null) {
                    console.log("Failed to update" + err)
                } else {
                    console.log("Update find")
                }
            })
        } else {
            console.log("Failed to save data")
        }

    })

})

// delete a forum
// POST request
app.post("/deletepost", (req, res) => {
    Forum.findOneAndRemove({
        _id: req.get("id")
    }, (err) => {
        if(err != null) {
            console.log("Failed" + err)
        }
    })

    res.send("Deleted!")
})


// update a forum
// POST request
app.post("/updatepost", (req, res) => {
    Forum.findOneAndUpdate({
        _id: req.get("id")
    }, {

        title: req.get("title"),
        content: req.get("content"),
        like: req.get("like"),
        poster: req.get("poster"),
        dependency: req.get("dependency"),
        imageIDs: req.get('imageIDs'),
        fakeName: req.get("fakeName"),
    }, (err) => {
        if(err != null) {
            console.log("Failed to update" + err)
        } else {
            console.log("Update find")
        }
    })

    res.send("Updated!")

})

/*
    Tree_hole part
 */
// fetch all tree hole posts
// GET request
app.get('/fetchtreehole', (req, res) => {
    TreeHole.find({}).then((DBitems) => {
        res.send(DBitems)
    })
})


// create a normal tree hole post(回帖)
// POST request
app.post("/createnormaltreehole", (req, res) => {

    var tree_hole = new TreeHole ({

        title: req.get("title"),
        content: req.get("content"),
        like: req.get("like"),
        poster: req.get("poster"),
        dependency: req.get("dependency"),
        imageIDs: req.get('imageIDs'),
        fakeName: "none",
    })

    console.log(tree_hole)

    tree_hole.save().then(() => {

        if(tree_hole.isNew == false) {
            console.log("Saved data!")
            res.send("Saved data successfully")
        } else {
            console.log("Failed to save data")
        }

    })

})

// create a forum for main tree_hole post
// POST request
app.post('/createmaintreehole', (req, res) => {
    var tree_hole = new TreeHole ({

        title: req.get("title"),
        content: req.get("content"),
        like: req.get("like"),
        poster: req.get("poster"),
        dependency: "main_post",
        imageIDs: req.get('imageIDs'),
        fakeName: "none",
    })

    var tree_hole_id = tree_hole._id;

    tree_hole.save().then(() => {

        if(tree_hole.isNew == false) {
            console.log("Saved data!")
            res.send("Saved data successfully")
            TreeHole.findOneAndUpdate({
                _id: tree_hole._id,
            }, {
                dependency: tree_hole_id,
            }, (err) => {
                if (err != null) {
                    console.log("Failed to update" + err)
                } else {
                    console.log("Update find")
                }
            })
        } else {
            console.log("Failed to save data")
        }

    })

})

// delete a forum
// POST request
app.post("/deletetreehole", (req, res) => {
    TreeHole.findOneAndRemove({
        _id: req.get("id")
    }, (err) => {
        if(err != null) {
            console.log("Failed" + err)
        }
    })

    res.send("Deleted!")
})


// update a forum
// POST request
app.post("/updatetreehole", (req, res) => {
    TreeHole.findOneAndUpdate({
        _id: req.get("id")
    }, {

        title: req.get("title"),
        content: req.get("content"),
        like: req.get("like"),
        poster: req.get("poster"),
        dependency: req.get("dependency"),
        imageIDs: req.get('imageIDs'),
        fakeName: req.get("fakeName"),
    }, (err) => {
        if(err != null) {
            console.log("Failed to update" + err)
        } else {
            console.log("Update find")
        }
    })

    res.send("Updated!")

})

/*
    Login part
 */

function hashcode(password) {
    let result = 0;
    let temp_result = 0;
    var len = password.length;
    var c = 31;

    let a1 = password.charCodeAt(0);
    let a2 = password.charCodeAt(1);
    temp_result = a1 * c + a2;

    for (let i = 2; i < len; i++) {
        let temp = password.charCodeAt(i);
        result = temp_result * c + temp;
        temp_result = result;
    }

    return result;

}

// verify login
app.get("/verifylogin", (req, res) => {
    Manager.findOne({
        email: req.get("email"),
        password_hash: req.get("password_hash")
    }).then((DBitems) => {
        res.send(DBitems)
    })
})

