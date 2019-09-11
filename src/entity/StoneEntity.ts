import {
  ChildEntity,
  Column, JoinColumn, ManyToOne,
} from 'typeorm';
import { ProductEntity } from './ProductEntity';
import { CurrencyEntity } from './CurrencyEntity';

@ChildEntity('stone')
export class StoneEntity extends ProductEntity {
  @Column({ type: 'varchar', length: 50 })
  type: string;

  @ManyToOne(type => CurrencyEntity)
  @JoinColumn({ name: 'currency_id' })
  currency: CurrencyEntity;
}
