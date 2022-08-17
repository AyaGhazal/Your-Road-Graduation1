const {MongoClient} = require('mongodb');

async function main() {
    const uri = "mongodb+srv://ayaghazal:14789@test.9afxt.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";
    const client = new MongoClient(uri);
    try {
        await client.connect();
    
        await listDatabases(client);
     
    } catch (e) {
        console.error(e);
    }

    finally {
        await client.close();
    }



}
main().catch(console.error);
