import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    ManyToOne,
    JoinColumn,
    TableInheritance,
} from 'typeorm';
import { CurrencyEntity } from './CurrencyEntity';

@Entity('products')
@TableInheritance({ column: { type: 'varchar', name: 'type' } })
export class ProductEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 50 })
    name: string;

    @ManyToOne(type => CurrencyEntity)
    @JoinColumn({ name: 'currency_id' })
    currency: CurrencyEntity;

    @Column('decimal', { name: 'price', precision: 10, scale: 2 })
    price: number;
}
