import { Entity, Column, OneToMany, PrimaryColumn } from 'typeorm';
import { ProductEntity } from './ProductEntity';

@Entity('currencies')
export class CurrencyEntity {

    @PrimaryColumn()
    id: number; // currency ISO code

    @Column({ length: 45 })
    name: string;

    @Column({ length: 3 })
    iso: string;

    @OneToMany(type => ProductEntity, product => product.currency)
    products: ProductEntity[];
}
