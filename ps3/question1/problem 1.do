import excel "/Users/kailiao/Downloads/ps3.xlsx", sheet("Sheet1") cellrange(A2:I266) firstrow clear

rename D Confidence_individual

rename Confidence Confidence_institutional

destring Confidence_institutional Confidence_individual, replace

gen Con_ins_lag1 = Confidence_institutional[_n-1]

gen Con_ind_lag1 = Confidence_individual[_n-1]

destring IndexLevel Con_ind_lag1 Dividends Earnings ConsumerPriceIndes Longinterestrate Con_ins_lag1, replace

gen index_pct=100*(IndexLevel[_n]-IndexLevel[_n-1])/IndexLevel[_n-1]

reg index_pct Con_ind_lag1 Con_ins_lag1 Dividends Earnings ConsumerPriceIndes Longinterestrate 

gen datee=ym(year, month)

tset datee

vec index_pct Confidence_individual



