// Importar los módulos necesarios
const express = require('express');
const mongoose = require('mongoose');

// Conectar a la base de datos MongoDB
mongoose.connect('mongodb+srv://samuelquisol:123@db-ejemplo.foxkseq.mongodb.net/', { 
    useNewUrlParser: true,
    useUnifiedTopology: true, 
});

// Obtener la conexión a la base de datos
const db = mongoose.connection;

// Manejar errores de conexión a la base de datos
db.on('error', console.error.bind(console, 'connection error in DB'));

// Una vez que la conexión se establece correctamente
db.once('open', function(){
    console.log('Connected to MongoDB');
    
    // Definir el esquema para los usuarios
    const coderSchema = new mongoose.Schema({
        nombres: String,
        apellidos: String,
        ciudad: String,
        país: String,
        salario: Number,
        edad: Number,
        altura: Number,
        peso: Number,
        genero: String
    });

    // Crear modelos basados en el esquema para usuarios y empresas
    const coder = mongoose.model('programadores', coderSchema);

    // Configurar la aplicación Express
    const app = express();
    app.use(express.json());

    /* Definir la ruta para obtener cada elemento 
    del Array de objetos */

    app.get('/api/programadores', async (req, res)=>{
        let programadores = await coder.find();
        res.json(programadores);
    });

    /* 1. Obtener todos los usuarios que sean mayores de 18 años. */
    app.get('/api/usuarios/edadmayor18', async (req, res)=>{
        let programadores = await coder.find( {edad: {$gt: 18}} );
        res.json(programadores);
    });

    /* 2. Obtener todos los usuarios que sean de Londres o de París. */
    app.get('/api/usuarios/ciudadLondresoParís', async (req, res)=>{
        let programadores = await coder.find( { ciudad: 'Londres' });
        res.json(programadores);
    });

    /* 3. Obtener a todos los usuarios que ganen más de $2000 al mes y tengan menos de 30 años. */
    app.get('/api/usuarios/salariomayor2000/edadmenor30', async (req, res)=>{
        let programadores = await coder.find( {salario: { $gt: 2000 }, edad: { $lt: 30 }});
        res.json(programadores);
    });

    /* 4. Obtener a todos los usuarios que sean de España y ganen más de $3000 al mes. */
    app.get('/api/usuarios/país:España/salariomayor3000', async (req, res)=>{
        let programadores = await coder.find( {país: 'España', salario: { $gt: 3000 }});
        res.json(programadores);
    });

    /* 5. Obtener todos los usuarios que tengan entre 25 y 35 años. */
    app.get('/api/usuarios/edadmayorigual25menorigual35', async (req, res)=>{
        let programadores = await coder.find( {edad: { $gte: 25, $lte: 35}});
        res.json(programadores);
    });

    /* 6. Obtener a todos los usuarios que no sean de Estados Unidos. */
    app.get('/api/usuarios/ciudad!=EstadosUnidos', async (req, res)=>{
        let programadores = await coder.find( {país: { $ne: 'Estados Unidos' }});
        res.json(programadores);
    });

    /* 7. Obtener a todos los usuarios que sean de Londres y que ganen más de $2500 o que tengan más de 30 años. */
    app.get('/api/usuarios/ciudadLondres/salariomayor2500oedadmayor30', async (req, res)=>{
        let programadores = await coder.find( { ciudad: 'Londres', $and: [ {salario: {$gt: 2500}, $or: { edad: {$gt: 30} }}]});
        res.json(programadores);
    });

    /* 8. Obtener a todos los usuarios que sean de Australia y tengan un peso mayor a 140 libras. */
    app.get('/api/usuarios/país:Australia/peso>140', async (req, res)=>{
        let programadores = coder.find( {país: 'Australia', peso: {$gt: 140}});
        res.json(programadores);
    });

    /* 9. Obtener a todos los usuarios que no sean de Londres ni de París. */
    app.get('/api/usuarios/ciudad!=Londres||París', async (req,res)=>{
        let programadores = await coder.find( { ciudad: { $nin : ['Londres', 'París']}});
        res.json(programadores);
    });

    /* 10. Obtener a todos los usuarios que ganen menos de $2000 al mes o que tengan más de 40 años. */
    app.get('/api/usuarios/salario:-2000/edad:+40', async (req, res)=>{
        let programadores = await coder.find( { salario: { $lt: 2000 , $or: [ {edad: { $gt: 40 } } ] } } );
        res.json(programadores);
    });

    /* 11. Obtener a todos los usuarios que sean de Canadá y ganen más de $4000 al mes o que tengan una altura mayor a 180 cm. */
    app.get('/api/usuarios/país:Canadá/salario:+4000||altura:+180', async (req, res)=>{
        let programadores = await coder.find( { país: 'Canadá', $and: [{salario: {$gt: 4000}, $or: { altura: {$gt: 180} } } ] } );
        res.json(programadores);
    });

    /* 12. Obtener todos los usuarios que sean de Italia y tengan entre 20 y 30 años. */
    app.get('/api/usuarios/país:Italia/edad:20&&30', async (req,res)=>{
        let programadores = await coder.find( { país: 'Italia', edad: { $in : [20, 30] } } );
        res.json(programadores);
    });

    /* 13. Obtener todos los usuarios que no tengan un correo electrónico registrado. */
    app.get('/api/usuarios/!correo', async (req, res)=>{
        let programadores = await coder.find({correo: {$exists: false}});
        res.json(programadores);
    });

    /* 14. Obtener todos los usuarios que sean de Francia y que su salario esté entre $3000 y $5000 al mes. */
    app.get('/api/usuarios/país:Francia/salario:3000a5000', async (req, res)=>{
        let programadores = await coder.find({país: 'Francia'});
        res.json(programadores);
    });

    /* 15. Obtener todos los usuarios que sean de Brasil y que tengan un peso menor a 120 libras o más de 140 libras. */
    app.get('/api/usuarios/pais:Brasil/pesomenor120omayor140', async (req, res)=>{
        let programadores = await coder.find({pais: 'Brasil', peso: {$lt: 120, $gt: 140}});
        res.json(programadores);
    });

    /* 16. Obtener todos los usuarios que sean de Argentina o de Chile y que tengan una edad menor a 25 años. */
    app.get('/api/usuarios/pais:ArgentinaoChile/edadmenor25', async (req, res)=>{
        let programadores = await coder.find({pais: {$in: ['Argentina', 'Chile']}, edad: {$lt: 25}});
        res.json(programadores);
    });

    /* 17. Obtener a todos los usuarios que no sean de España ni de México y que ganen menos de $3000 al mes. */
    app.get('/api/usuarios/pais!España!México/salariomenos3000', async (req, res)=>{
        let programadores = coder.find({pais: {$nin: ['España', 'México']}, salario: {$lt: 3000}});
        res.json(programadores);
    })

    /* 18. Obtener todos los usuarios que sean de Alemania y que tengan un salario menor a $4000 o una edad mayor a 35 años. */
    app.get('/api/usuarios/pais:Alemania/salariomenor4000/edadmayor35', async (req, res)=>{
        let programadores = coder.find({pais: 'Alemania', salario: {$lt: 4000}, $or: {edad: {$gt: 35}}});
        res.json(programadores);
    });

    /* 19. Obtener todos los usuarios que no sean de Colombia y que su altura sea menor a 170 cm. */
        app.get('/api/usuarios/pais!Colombia/alturamayor170', async (req, res)=>{
        let programadores = coder.find({pais: {$ne: 'Colombia'}, altura: {$lt: 170}});
        res.json(programadores);
    });

    /* 20. Obtener todos los usuarios que sean de India y que no tengan un salario registrado. */
        app.get('/api/usuarios/pais:India/!salario', async (req, res)=>{
        let programadores = coder.find({pais: 'India', salario: null});
        res.json(programadores);
    });

    // Iniciar el servidor y escuchar en el puerto 3000
    app.listen(3000, ()=>{
        console.log('Server listening on port 3000');
    });
});