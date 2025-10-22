db.createRole({
  role: 'soloLeer',
  privileges: [
    { resource: { db: 'emprendedores', collection: 'pedido' }, actions: ['find'] },
  ],
  roles: []
});

db.createRole({
  role: 'leerEscribir',
  privileges: [
    { resource: { db: 'emprendedores', collection: 'pedido' }, actions: ['find'] },
    { resource: { db: 'emprendedores', collection: 'pedido' }, actions: ['insert', 'update'] }
  ],
  roles: []
});


// Usuario 1: adminUsuarios con rol gestorUsuarios
db.createUser({
  user: 'leer',
  pwd: 'leer123',
  roles: [{ role: 'soloLeer', db: 'emprendedores' }]
});

// Usuario 2: adminProductos con rol gestorProductos
db.createUser({
  user: 'escribir',
  pwd: 'escribir123',
  roles: [{ role: 'leerEscribir', db: 'emprendedores' }]
});