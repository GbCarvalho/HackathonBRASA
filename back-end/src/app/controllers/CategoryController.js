import Category from '../models/Category';

class CategoryController {
    async store(req, res) {

        const categoryExists = await Category.findOne({ where: { name: req.body.name } })

        if (categoryExists) return res.status(400).json({ error: 'this category already exists' });

        const { id, name } = await Category.create(req.body);

        return res.json({ id, name })
    }

    async index(req, res) {
        categories = await Category.findAll();

        return res.json(categories);
    }

    async show(req, res) {
        category = await Category.findOne({where: {id: req.body.id }});
        
        return res.json(categories);
    }

}

export default new CategoryController();