import Provider from '../models/Provider';

class ProviderController {
    async store(req, res){
        const checkProvider = Provider.findOne({ 
            where: { cnpj: req.body.cnpj } 
        });

        if (checkProvider){
            return res.status(400).json({ message: "Provider already created"});
        }

        provider = Provider.create(req.body);

        return res.json(provider);
    }
}

export default new ProviderController();