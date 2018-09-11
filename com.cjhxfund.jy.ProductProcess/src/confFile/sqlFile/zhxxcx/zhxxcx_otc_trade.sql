select tt.l_confirm_no,
       tt.l_date, --日期
       tt.l_time,
       tt.l_daily_instruction_no,
       tt.l_index_daily_modify,
       tt.en_bond_yield,
       tt.vc_busin_caption,
       (select td.vc_item_name
          from trade.tdictionary td
         where td.l_dictionary_no = '40396'
           and td.c_lemma_item = tt.c_busin_class) c_busin_class, --业务分类
       tt.c_busin_pro_type,
       tt.l_fund_id,
       tt.vc_fund_code, --基金代码
       tt.vc_fund_name, --基金名称
       tt.vc_combi_no, --组合代码
       tt.vc_combi_name, --组合名称
       tt.c_invest_type,
       tt.vc_report_code, --证券代码
       tt.vc_stock_name, --证券名称
       tt.vc_entrustdir_name, --委托方向
       tt.vc_market_name,
       tt.en_balance, --金额
       tt.en_cbalance,
       tt.en_amount, --数量       
       tt.en_price,
       tt.en_fee_ratio, --费率
       tt.en_fee, --费用
       tt.c_deal_status, --成交状态
       tt.c_status, --状态
       tt.l_operator_no, --操作员
       tt.c_exceed_flag, --巨额赎回处理标志
       tt.vc_in_intercode, --转入证券代码
       tt.vc_name, --对手名称
       tt.c_settle_type, --结算方式
       tt.en_interest, --利息
       tt.c_fee_deal_type, --手续费处理方式
       tt.vc_remark, --备注
       tt.vc_stockholder_id, --股东
       tt.vc_seat_id, --席位
       tt.l_execconfirm_no, --执行确认编号
       tt.vc_attached_warrant_code, --附送权证代码
       tt.en_warrant_amount, --附送权证数量
       tt.l_warrant_combi, --权证入账组合
       tt.l_confirm_date, --确认操作日期
       tt.l_deal_date,
       decode(tt.l_settle_date, 0, null, tt.l_settle_date) l_settle_date, --到账日期
       tt.vc_international_code, --国际代码
       tt.vc_ric_code, --路透代码
       tt.vc_sedol_code, --伦敦代码
       tt.vc_cusip_code, --美国代码
       tt.vc_bloomberg_code, --彭博代码
       tt.Vc_Trade_Currency_No, --交易币种
       tt.vc_direct_name, --姓名
       tt.vc_place, --存款地
       tt.vc_bank_name, --银行名称
       tt.en_rate, --利率
       tt.l_end_date, --到期日
       tt.c_advance_limit_flag, --提前支限限制
       tt.en_interest2, --利息总和
       tt.l_begin_date --起始日
  from (select a.l_confirm_no, --确认编号
               to_char(a.l_date) l_date, --日期
               a.l_time l_time, --确认时间
               a.l_daily_instruction_no, --指令序号
               a.l_index_daily_modify, --指令修改次序
               decode(c.c_asset_class,
                      '3',
                      100 *
                      trade.sf_get_bond_yield(a.l_date,
                                        a.vc_inter_code,
                                        a.en_price - m.en_bond_interest)) en_bond_yield,
               h.vc_busin_caption, --业务名称
               a.c_busin_class, --业务分类
               a.c_busin_pro_type, --业务过程分类
               a.l_fund_id, --基金序号
               b.vc_fund_code, --基金代码
               b.vc_fund_name, --基金简称
               d.vc_combi_no, --投资组合编号
               d.vc_combi_name, --投资组合名称
               a.c_invest_type, --投资类型
               c.vc_report_code, --申报代码
               c.vc_stock_name, --证券名称
               f.vc_entrustdir_name, --委托方向名称
               e.vc_market_name, --交易市场简称
               a.en_balance, --金额
               a.en_cbalance, --定金金额
               a.en_amount, --数量
               a.en_price, --价格
               a.en_fee_ratio, --费率
               a.en_fee, --费用
               a.c_deal_status, --成交状态
               a.c_status, --状态
               a.l_operator_no, --操作员
               a.c_exceed_flag, --巨额赎回处理标志
               a.vc_in_intercode, --转入证券代码
               g.vc_name, --对手名称
               a.c_settle_type, --结算方式
               a.en_interest, --利息
               a.c_fee_deal_type, --手续费处理方式
               a.vc_remark, --备注
               a.vc_stockholder_id, --股东
               a.vc_seat_id, --席位
               a.l_execconfirm_no, --执行确认编号
               a.vc_attached_warrant_code, --附送权证代码
               a.en_warrant_amount, --附送权证数量
               a.l_warrant_combi, --权证入账组合
               to_char(l_confirm_date) l_confirm_date,
               to_char(l_deal_date) l_deal_date,
               a.l_settle_date, --到账日期
               c.vc_international_code, --国际代码
               c.vc_ric_code, --路透代码
               c.vc_sedol_code, --伦敦代码
               c.vc_cusip_code, --美国代码
               c.vc_bloomberg_code, --彭博代码
               c.Vc_Trade_Currency_No, --交易币种
               i.vc_operator_name vc_direct_name, --姓名
               j.vc_place, --存款地
               k.vc_bank_name, --银行名称
               j.en_rate * 100 en_rate, --利率
               j.l_end_date, --到期日
               j.c_advance_limit_flag, --提前支限限制
               j.en_interest + j.en_total_interest en_interest2, --利息总和
               j.l_begin_date l_begin_date --起始日
          from trade.tstockmarketinfo  c, --证券行情信息表
               trade.TOutConfirm       a, --场外业务确认表
               trade.tbondproperty     m,
               trade.tfundinfo         b, --基金信息表
               trade.tcombi            d, --投资组合表
               trade.tmarketinfo       e, --交易市场信息表
               trade.tentrustdirection f, --委托方向表
               trade.TTradeRival       g, --交易对手表
               trade.tbusinflag        h, --业务类别表
               trade.toperator         i, --操作员表
               trade.tdepositreceipt   j, --在途存单信息表
               trade.tbankinfo         k --银行信息
         where a.l_fund_id = b.l_fund_id
           and a.l_date = c.l_date
           and a.vc_inter_code = c.vc_inter_code
           and a.l_basecombi_id = d.l_combi_id
           and c.c_market_no = e.c_market_no
           and c.c_market_no = f.c_market_no
           and a.c_entrust_direction = f.c_entrust_direction
           and a.L_RIVAL_ID = g.L_RIVAL_ID(+)
           and a.l_busin_flag = h.l_busin_flag(+)
           and a.l_direct_operator = i.l_operator_no(+)
           and a.l_confirm_no = j.l_confirm_no(+)
           and a.l_date = j.l_date(+)
           and j.l_bank = k.l_bank_no(+)
           and a.l_date = m.l_date(+)
           and a.vc_inter_code = m.vc_inter_code(+)
           and a.c_status = '1'
           and b.c_fund_status not in ('4', '5', '6')
           and (select count(*)
                  from trade.TOPFUNDRIGHT
                 where TOPFUNDRIGHT.l_basecombi_id = a.l_basecombi_id
                   and TOPFUNDRIGHT.c_layer = '3'
                   and TOPFUNDRIGHT.l_operator_no = 1000
                   and instr(TOPFUNDRIGHT.vc_rights, '1') > 0) > 0
           and exists
         (select 1
                  from trade.toperator
                 where toperator.L_OPERATOR_NO = 1000
                   and (instr(toperator.VC_MANAGE_RIGHT, c.c_stock_type) > 0 or
                       trim(toperator.VC_MANAGE_RIGHT) is null))) tt
 where 1 = 1