const { Router } = require('express')
const router = Router();
const faker = require('faker')
const User = require('../models/User')

router.get('/api/users', async (req, res) => {
    const users = await User.find();
    res.json({users})
})

router.get('/api/users/create', async (req, res) => {
    for(let i = 0; i <= 5; i++){
      await User.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            avatar: faker.image.avatar()
        })
    }
    res.json({message:'5 user create'})
})

module.exports = router