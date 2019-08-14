const app = require('./app')
const morgan = require('morgan')
const cors = require('cors')
const { connect } = require('./database')

 app.use(morgan('dev'))
 app.use(cors())
 app.use(require('./routes/users'))

async function main(){
  //Database conction
  await connect() 

  await app.listen(3333)
    console.log('serven on 3333')
}

main();