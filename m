Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF37454A7D1
	for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083838; cv=fail; b=TPQ59hIP+FCDiKjvZIRSRs2mIdBXvXy9Gi1fWmaNcQtol2BZhIsSQefUeOiGVHXaAau2xJM06p5OuQW/Ujyz1HFdw7BYukmie29+4CFZ47bx+ZDm1kQMVcDXL6bZfHJHeGBAmdqOyOczdVq6GQ0du5aNiV5uDgHqp9BsyjlAYvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083838; c=relaxed/simple;
	bh=sJLnOPWdikwIEPe6+SHvoxP7SqqsFz8idfhLmYhLEEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gLlHERLYMEpI89vhF0xgjufRlccXxUsUFYIZmksnVY95WWAI/psUxXfUlK5+USItYKZeHKtwUdOX+1F64UvM+r2Q+UUQ3FlNj1Lw6xGHUq5vLVpY0Mm/S6FoFzhpCx8W3ZWHzbP4zLc4pcRPTTMgQl5OqdDYnbh4RUfuBnHUP7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WrDdIm9h; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WrDdIm9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjqSf37PjOgL/sztI8LghirKtbpPOIwF9CqlJyMVqwp/xr695cRaMvPCCNhVQetB2dHWU5sp9xoTuPj7PN0ocRXrYLvKx6iAMXcOuUtOyeLptJfWsUQC8ItI/Gm8b2elYjOp1RSG4y9CJUITHrNvM+LcScravGKUvXyJo9TQxJ80e66fyox2qlo5qaWsCts0WaSy8rHoRtAoRBz5Feak5ceG1JzZx2BWLIVYTF+Tw+rrEVTLHEJlScjk5R/Ee5cN8rkFKBafGZMq3iLipypZbeD43Btasj/F6v0UNQ33zzbm3YerLKYAzFerNO2PjJa/uGHt/uI6V/DbuxNmlr4fNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqVJ23GffrdvW1AZBa+Oa9TKhD6nxdbYi0l1ru19mzo=;
 b=aEmev0T2UhSiIttdrqLrkihgEMGdxC8vIRQuFEm4JwrVBkwTC/Rzf/bhLcxOVeC0/q1UESBQ4Z/zaZJM5JbB2wlV/s3d78ufJY0yBpLRND1CtCbshjJj9fcKDJYHh8oogJG66jAjrKiEsVjtnvhmk45oaJrzjs7BYgo9tTQ2Sw7UV04F7/G238eyBlEDCT76j7qtHVmWYyP/ESh+WW6oc//9zgxlQWz7VjHRjHiIc89XX93ZYKfF4PjxiW71hwMrPFxT+nJNzVpxq8Xl5M2DL9+A8toxe7UG0g35XwUx4fyEKxVyKmfh9oFwcrOTlNeYwTh37WiFU55FKl6hRgw+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqVJ23GffrdvW1AZBa+Oa9TKhD6nxdbYi0l1ru19mzo=;
 b=WrDdIm9hsr+hF8KmEB8AgXH9cV4DjR/b0x8LDXsydlOMOZcbBEQGB9MRxcvj152JesdOVJeu20B5rCWZDc4VIwdCEYjLAt2I3wPXdy3Hf0pGfpMzox4f5Dn/+sWzgepCPBF/6cC42mov0/Hr76bzOYRGcP0Z+BN3XcU2Gj+x084DetPpFtONCrcxPirj+INtaPa7bmHnVOLR+dGFfk9AQfO15SLmMDXsd3EIaGVzR8u8DUIHD5sxF84ajOSN3YAlBrEF6Iz43XFezhz8KiZ8SQq6ytSc6NEAXE227WuJssmEuxMab4gQZaIcuz8YscHs0IpXtqhr4ywR+lkytCZ2OA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8734.eurprd04.prod.outlook.com (2603:10a6:102:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 17:03:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 17:03:37 +0000
Date: Thu, 15 Oct 2026 13:03:28 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA
 mux driver
Message-ID: <atEHYLnJ5GTr1-ae@lizhi-Precision-Tower-5810>
References: <cover.1791535540.git.zhoubinbin@loongson.cn>
 <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
X-ClientProxiedBy: DS7PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:8:57::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e1e18f-4b90-4af0-733e-08df2ade40c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|19092799006|56012099006|5023799004|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5Br2TOUZXznszCko9jw0RDe8HVrQHyqE2/eAvMA1Q3/tAnaLBxkE6Y7p9hysKRvAl/vn9Y8hVnStL1Y/1g3lWlITxynAox5mDFKLEoIGCbvh0Wz1NnQMjs02bXyZ7jZkc/yxHmLQayCwfheYZXDKrF6ITV+lDpxN4Zt3tA7PHTQWG8EZpnz+DDFApy+yf913WesFfin/DrrsYSDORdNuPis7rZYzGs8gEDoHSpbk/ALMLpv0X5KumHaCPQjyhFplprSHykh+fL2ZfQBI9BWXUB01kJyml8sow5H7fRzTwnz/5wmAxAK6YJvth8ArRzEOrO8kePdEGlcdXeueEKojjO/I5vH5PEC4UwKT6PAQYSoOpmMmCROY+YkVCGHMuV2nmkGs4SuKABFtR5+vJQedNc17FeXWuRIfLrmFc976W+YXD9kKJE61UElY0vdRZccd8l0lTXuiuIutBoY6gVqGXbJkafsugyqJjz9FYLoCfFGEEwX8aJHKh94BvLUdz7b1ZahAplDVfsBLrz02h6nii4RkvANjvwwRXG/sRfZfdX3WFDdmUPy2rxQ1XYF2RsmvIceX5oIc5HUTH5CRiZSk3BK6Z33pooLD0O74Vkp+YEzyv3jruTOVyJ5BnEWr/u2l3t/6OHC7Zc5V+fLJXiG0z+bD7dYNIwkH6XZVSOzP/9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(19092799006)(56012099006)(5023799004)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/p6fstfcEFlloLhuMp1pqXRT1nIVc1jXWVJ0ld99niebeX8of8ybdkWSNGOp?=
 =?us-ascii?Q?UmAyMiKYV+gSJc1gLS7vAoNA6wCXk1pQdmYaKkXITZFEiQ9QusifuTdVTSpW?=
 =?us-ascii?Q?Pzk9hC/jnjwTA1kFv+kNWGxXLjqZxzhDw+sLy836xRMVzR14SinHwJP5szQn?=
 =?us-ascii?Q?CtmTdipxyN8Qgqv9ARM5Zgp1BBAoRd7XgF37ccDKb8nzWWogQvAacnyIcR0c?=
 =?us-ascii?Q?nuRfQsOATQjh1tqqTRZ3myjbConMB9msH5inN8hS+339qdIC1Qlm+gfm/JgW?=
 =?us-ascii?Q?B5BRq3UHj38Hr1bczyHA7MVBAi4/N6oDvvrPqSKyvRVpdJ9Tz9p6w8JXoFS/?=
 =?us-ascii?Q?o+zCIDDtzUt73rH799NNPcH9Ks2xtOkTnH6GXo4YlK/am79Aq9hS/L7ySeLs?=
 =?us-ascii?Q?eIodgfyF20S9IChmk2sJ36Fw1Uxlrvd3VePQl2+cizlUQFQCpvxbbbsEBe8V?=
 =?us-ascii?Q?7SoULpJEeQDgeEN1gHFz4NHWbUFBdWy7gXtDf/h2rZwUOnA80FjkvWqmANUl?=
 =?us-ascii?Q?hRP7U/95bZIetwd8HYRyQcju/8MDDpX2x/bg2bNeJIfStMDILwXZ9Hvy5s0D?=
 =?us-ascii?Q?/gk1ZOTPdBJb8yqtL1x+TewpBpKG3UcegA4Z43ekazfhF2E7XTtOkF8pHz09?=
 =?us-ascii?Q?iyX1UYQYdDVXb2XGZz/Q2z6E+mkstdHsDlruJq1aiKbV31ptYOEfgLsVbZUZ?=
 =?us-ascii?Q?QcpNbZa5PW15zlP+d7R6jScz8R+P3ozfxNKnQlCa1q5MbJiFD4hlrVCJd1+m?=
 =?us-ascii?Q?oOyJNTkzrg1IE4NiCVXgi3CcdCR9Uqk8In3EO3gO6hUxdF9I3IMKjoKvb0ad?=
 =?us-ascii?Q?8kWsEKbX9nprhGEXaeMq74YQAbgflpET0OYY7x6p0MPK86bHZgOffCkoRq5i?=
 =?us-ascii?Q?my8lf8NdCyk7tYL7JmEI0Vi2Ocz9MSsBfEyXIxyMrToyflQ5LBsF26nNAQnv?=
 =?us-ascii?Q?BBC/ZVsYjnO3SEmFUOV4qvwvou9bRAp+F+iNXLtFpsJvNOubPi1/ZMYXV0Jd?=
 =?us-ascii?Q?vVtz+JTqno/4BIDmtMvVHiPgdzABuzWG24FtBD8+Jh5ZTvTjNf6mNIH4yAXU?=
 =?us-ascii?Q?dBye4zrx3MtV2m9MXf9TCsYAdVClvRE99sQBDvhZw6D3/6w5YTiozX++j8Cc?=
 =?us-ascii?Q?nHhA9P5REQWiVmOBYz6iimT8Xk+SRjBu5P06iQZeuGmXOrSRwMkocqaoi67I?=
 =?us-ascii?Q?8ZZ2/pRu5FXOpQD2mZ7otEas2s9/roCumr5DAhgkIbkS5tZGphtRP6nMEx9H?=
 =?us-ascii?Q?IVH6VAxoVkBYFkbVuUuhGvxsh28WoYwueZNiQHqRa+bGhonCyrQCKcuIJRyD?=
 =?us-ascii?Q?FzLn7N7FQ0+0ssalSpDj7t/EklgJF8Te6qN2LichRIPMZuPuEZjAx2w0tbQA?=
 =?us-ascii?Q?1BH4IKo6sXZcMP7ekuWtbIqT8Dbu1b9+JS28NcxzlBrWiRYLL4cw2yytPg3O?=
 =?us-ascii?Q?BDVO22krdw1HweiW/6LogkG+Wwd09+B5qQEak3QdCEHhQtbop/GV6Te6BEfd?=
 =?us-ascii?Q?ReZCJZQV75p45aQsDUMDY/M6HqkMlvnnRw0nHR9dygqu425jmPQk6/iPZyWG?=
 =?us-ascii?Q?zqPe2LRTRjIVRefywKiCTkjUTKsNF/vgfiIr1kFX16WU/KzURdPNgZeYWQde?=
 =?us-ascii?Q?+IgWbOV8r5QkR86Nt4zV3a2Gz4FXYCobg/WKMFI1MuZYuQQJCJOneElb70w2?=
 =?us-ascii?Q?l6AFQcW6sbL1fDVH9S30oLv947iZbWLYsJ2niCPvFaqdvMhETLXj2nl+PBHP?=
 =?us-ascii?Q?3SU7qFhqYfOAfcxy+n2oK6TQ21F6/d4smeuDjvDt4wIsc9oD/oxr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e1e18f-4b90-4af0-733e-08df2ade40c0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 17:03:36.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VD8LO0MkzPDtEJT4EIQEVhKdmcCW4MMag8nkHvZ9/hE0Q6U1FWPs+P7XE36XC/UYz98rYyiXiGl9CIC6HzEcjepbalCn8vaWVLTKGaCSbRxrEqqBncw5ua0yGagxPje
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8734

On Fri, Oct 09, 2026 at 05:19:34PM +0800, Binbin Zhou wrote:
> The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> implemented as a set of routing fields in the chip global configuration
> registers CHIP_CTRL13/14/15, which select which physical channel of the
> on-chip CMC DMA controller handles each peripheral DMA request.
>
> Add a driver that exposes these routing fields as an OF DMA router. The
> router's allocation callback validates the <request> <channel> <flags>
> specifier, programs the corresponding CHIP_CTRL register field, and then
> rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> controller's xlate is used.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/dma/loongson/Makefile               |   1 +
>  drivers/dma/loongson/loongson2-apb-dmamux.c | 398 ++++++++++++++++++++
>  3 files changed, 400 insertions(+)
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 78622b255f88..0b0c6ea41c64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15355,6 +15355,7 @@ F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:	drivers/dma/loongson/loongson2-apb-dma.c
> +F:	drivers/dma/loongson/loongson2-apb-dmamux.c
>  F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>  LOONGSON LS2X I2C DRIVER
> diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefile
> index 48c19781e729..271fd38fa8f2 100644
> --- a/drivers/dma/loongson/Makefile
> +++ b/drivers/dma/loongson/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-cmc-dma.o
> +obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-dmamux.o
> diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/loongson/loongson2-apb-dmamux.c
> new file mode 100644
> index 000000000000..01bd3ce4ca25
> --- /dev/null
> +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> @@ -0,0 +1,398 @@
...
> +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u32 request, u32 channel)
> +{
> +	const struct loongson2_dmamux_map *map;
> +	u32 reg_val, route_val, high_val = 0;
> +
> +	if (request >= mux->config->num_maps)
> +		return -EINVAL;
> +
> +	if (channel > mux->config->max_channel)
> +		return -EINVAL;
> +
> +	map = &mux->config->maps[request];
> +
> +	switch (map->type) {
> +	case LOONGSON_DMAMUX_PAIR:
> +		route_val = channel / 2;
> +		break;
> +	case LOONGSON_DMAMUX_SINGLE:
> +		route_val = channel;
> +		if (map->high_reg)
> +			high_val = (channel >> 2) & 0x1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	guard(spinlock_irqsave)(&mux->lock);
> +
> +	/* Write the primary register field */
> +	reg_val = loongson2_dmamux_read(mux, map->reg);
> +	reg_val &= ~map->mask;
> +	reg_val |= field_prep(map->mask, route_val);
> +	loongson2_dmamux_write(mux, map->reg, reg_val);
> +
> +	/* Write the extension register field if present */
> +	if (map->high_reg) {
> +		reg_val = loongson2_dmamux_read(mux, map->high_reg);
> +		reg_val &= ~BIT(map->high_shift);
> +		reg_val |= high_val << map->high_shift;

assign_bit(map->high_shift, &reg_val, high_val);

other looks good

Frank
> +		loongson2_dmamux_write(mux, map->high_reg, reg_val);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * loongson2_dmamux_route_allocate() - DMA router allocation callback
> + * @dma_spec: OF DMA specifier <request> <channel> <flags>
> + * @ofdma:    Router's of_dma structure; ofdma->dma_router points to our
> + *            struct dma_router embedded in struct loongson2_dmamux.
> + *
> + * Return: NULL as route_data (nothing to free), or an ERR_PTR on failure.
> + */
> +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *dma_spec,
> +					     struct of_dma *ofdma)
> +{
> +	struct loongson2_dmamux *mux;
> +	u32 request, channel, flags;
> +	int ret;
> +
> +	if (!ofdma->dma_router)
> +		return ERR_PTR(-EINVAL);
> +
> +	mux = container_of(ofdma->dma_router, struct loongson2_dmamux, dma_router);
> +
> +	if (dma_spec->args_count != 3)
> +		return ERR_PTR(-EINVAL);
> +
> +	request = dma_spec->args[0];
> +	channel = dma_spec->args[1];
> +	flags = dma_spec->args[2];
> +
> +	if (request >= mux->config->num_maps ||
> +	    channel > mux->config->max_channel)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Program the SoC-specific route register */
> +	ret = loongson2_dmamux_set_route(mux, request, channel);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/* The of_node_put() will be done in of_dma_router_xlate function */
> +	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
> +	if (!dma_spec->np)
> +		return ERR_PTR(-ENODEV);
> +
> +	dma_spec->args[0] = channel;
> +	dma_spec->args[1] = flags;
> +	dma_spec->args_count = mux->config->parent_args_count;
> +
> +	return NULL;
> +}
> +
> +/**
> + * loongson2_dmamux_route_free() - DMA router free callback
> + * @dev: Back pointer to the router's device
> + * @route_data: Router-specific data returned by route_allocate
> + *
> + * The driver does not allocate any per-route resources, so this callback
> + * is intentionally empty. It must still be provided because the OF DMA
> + * core calls it unconditionally on some error paths (e.g. -EPROBE_DEFER)
> + * without checking for a NULL pointer.
> + */
> +static void loongson2_dmamux_route_free(struct device *dev, void *route_data)
> +{
> +}
> +
> +/**
> + * loongson2_dmamux_unregister_of_dma() - devm action to unregister the router
> + * @data: Pointer to struct loongson2_dmamux
> + *
> + * Called automatically by the device-managed resource framework both on
> + * probe failure and on driver removal, ensuring the OF DMA router is
> + * always unregistered.
> + */
> +static void loongson2_dmamux_unregister_of_dma(void *data)
> +{
> +	struct loongson2_dmamux *mux = data;
> +
> +	of_dma_router_free(mux->dma_router.dev->of_node);
> +}
> +
> +static int loongson2_dmamux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct loongson2_dmamux *mux;
> +	u32 dma_requests;
> +	int ret;
> +
> +	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> +	if (!mux)
> +		return -ENOMEM;
> +
> +	mux->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mux->base))
> +		return PTR_ERR(mux->base);
> +
> +	spin_lock_init(&mux->lock);
> +	mux->config = &ls2k0300_dmamux_config;
> +
> +	ret = of_property_read_u32(dev->of_node, "dma-requests", &dma_requests);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing dma-requests property\n");
> +
> +	if (dma_requests != mux->config->num_maps)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "dma-requests=%u mismatches driver num_maps=%u",
> +				     dma_requests, mux->config->num_maps);
> +
> +	mux->dma_router.dev = dev;
> +	mux->dma_router.route_free = loongson2_dmamux_route_free;
> +
> +	platform_set_drvdata(pdev, mux);
> +
> +	ret = of_dma_router_register(dev->of_node, loongson2_dmamux_route_allocate,
> +				     &mux->dma_router);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register DMA router");
> +
> +	ret = devm_add_action_or_reset(dev, loongson2_dmamux_unregister_of_dma, mux);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev,
> +		 "Loongson2 DMA Mux Controller registered (max_channel=%u, requests=%u)",
> +		 mux->config->max_channel, mux->config->num_maps);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id loongson2_dmamux_of_match[] = {
> +	{ .compatible = "loongson,ls2k0300-dmamux" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
> +
> +static struct platform_driver loongson2_dmamux_driver = {
> +	.driver = {
> +		.name = "loongson2-dmamux",
> +		.of_match_table = loongson2_dmamux_of_match,
> +	},
> +	.probe = loongson2_dmamux_probe,
> +};
> +module_platform_driver(loongson2_dmamux_driver);
> +
> +MODULE_DESCRIPTION("Loongson2 SoC DMA Mux Controller driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> --
> 2.52.0
>
