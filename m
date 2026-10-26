Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032845;
	b=RskGlrtf0jyDyocoOxPaFRAkBMJOAhabN6nb6TZHJHmOcPnngiJys7gbcgLUuYBue51j
	 jhQMTc1Bu5UhzjK+ZHLaZlixQa3zrD58CSzsM91NSuhvJzCsAuEMdQv2ojLhwpxo1tpKQ
	 D7Kt+ryKCcFnQ9k6S579WHWnLV+Sg3V6EVgrNI5BNPUI/LpDtU8JqGY1DggaCCbi6qRQ9
	 +KQHwG38K76yEQh1kMcdmS5gli8o9Juy5dDin8jHHt1xfJWSpXNkdR15LwrA0OrW7KmmD
	 36+zHEJeYt+VO1ooS+GCY/fi4vWeHsOIAFqfUduRbEMRmWu/kw6amZnDkEmzRUxRZKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032845;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xD5jfpImKpfff0Y2W5dq/KCK6BOfTU6Bxtq5umiXNYs=;
	b=qxhE+POpwyxs48TYeB+tL98l9p5CbEeDli7f7/3/qCrMOheXPP4ya4++U1us9kSILNwW
	 CPmbUCUG2CHh6m6c5e6jxfhwEu7aNOaLMHnjrXSdzIrpP/eSNDuHqCCtDIqsr/gIJn0l6
	 6imYj0xLzsQ7dmzQ8x+5mb/hXhn3Z67dm5C7ojG08QecY2Ughu5IjeKTzOSOMcBERhI4V
	 cGjG8o/cCUy9vMX57C3Nmvo4Dqw29YtTVyG1Fkrp9asOGZUxiW5qbCloZHmI5lP0M4kC7
	 8yl2gVr/aCKFjC/HI2OtAEIa+FbLvucz1ZfWSXcexN6fmG75Fuqh4NcbBAAWlS2f54A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gtjAex5c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.62
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A246606A31A
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 16:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A246606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gtjAex5c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj1Lv7ixrw9xHKAtEQhalGHfg0Z9R52/cBpRlIkM9ZNpqbnG1sPkRzs9BNnJvz3LPywmaa2xmG8Sp1TE89BqKvkqx5/NC6W+x9pDukOgH/dPOQwDiAv4Qtrhe3VJBcM7WbaXZqy7FNsS12ZqdSy87p3klMPHl52KzaBd1AL4cMgGWiLIY8u4CdshkdOVQoAsWhOihxgRlxhtbe0hUA8a+n3LVpQXOe5j7y6m4c2rMQLyfuiMhn1FiM41kgNWg+pmy83/8aD0elTq9/dntbMO2g8sQUtn5HywC8vpXhDuVRxtSr9PvOGFbHXjcuNnfVe282QYYjaOZhMEqYyjCyQgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD5jfpImKpfff0Y2W5dq/KCK6BOfTU6Bxtq5umiXNYs=;
 b=NAyUBwcad1dFUJqC1O8DHr+kioph8Eud7wv1NiOUQzuoX58uPvJMKnm9QZhdHWbrMq2rrMcu6zPtIqnE9wIRs0vU4vUfCpR2Yi8qbN/9Tju7V0K+JV3RNjGneU36VGp+oJD2uqC5fgGfEMjBZFXfb4tQA5/OH7CqEtZRcVnw7ZAExkyKl3bu04eVbCEjCVennDUe/DYBh/4nlRerHLF3UOSgbXlBV5JkUMdgekGeLZE0w00LhXwjAtADtDeVcYTfjXEv8OmQSvhOy4zQkwMMnEcaZ3Gth0lcV17n7tsD+l+lM+DP1PN7HP2PnwoBvH9SHbxMqMfnzsbVs8vgRGlEpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD5jfpImKpfff0Y2W5dq/KCK6BOfTU6Bxtq5umiXNYs=;
 b=gtjAex5cbrFilHAT+L6YJrZiLwqfm/zHQDrXW/w/36v++Sifmw7r3LWvU29ZzQSSBnQMQrGM7v75hS8nbFtRDVsQ7E6kTYLALi0pf/Ifeg1bWc4ySEPHr7MuWLBgpOfKkbPqBhZFoJ6hpWi9h7IpzaheBM6ia+2akMnlxyHuYOIN/bNJUDOYO6bqh8cmm7sGVMFdAtuQ+hTnwTt9dv0yLBIk1sIZqMgYm2mhjqgmehUdLz8vXKaKG9j4dHdEcpo1c9Q/oVWZ06QasyUXu/8oJPfDFIIknc+/Phr637nOB0zJ/WQr6H4F5F8aNbp/7XwQDnaRI8qM5edpHeCxmn4hVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMZPR04MB191951.eurprd04.prod.outlook.com (2603:10a6:20b:7c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 16:40:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 16:40:42 +0000
Date: Mon, 26 Oct 2026 11:40:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: dma: Document DMA mux support for
 Loongson-2K0300
Message-ID: <at-Cf-bxYkBxMMEi@SMW015318>
References: <cover.1792986696.git.zhoubinbin@loongson.cn>
 <c4ae9695aa266bf714a53b5f46218645fc64347a.1792986696.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ae9695aa266bf714a53b5f46218645fc64347a.1792986696.git.zhoubinbin@loongson.cn>
X-ClientProxiedBy: PH8P220CA0065.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMZPR04MB191951:EE_
X-MS-Office365-Filtering-Correlation-Id: beb5e150-67f9-44bf-0f50-08df337fdfe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|261026140227099003|4143699003|261009221727099003|11063799006|56012099006|261009223027099003|261009221227099003|261009223327099003|261022105027099003|261022075727099003|261022113327099003|261009220027099003|10067099003|261021121427099003|261026121527099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kbgzZBimWgILHKLiSEJc2P/v7ui7WTtjHcyCZ+ka4Gge/Gp01WHWk7fTfiWYoFsVt/FftB1ai59pD0skSHEjPg1KseX+YYea5qHZDsJx4T9PEK3Qnbw7Vxy4j9VbS8MoBVtjmycTersnQ2ixnj629gWGfG5obqFH+aAeMoO+8wzZ1PJcKUQqNOSvMqUlFXiGfW/wCs+9yEjBLNkTiu3VP80IGynt2pJ2X8W3sTyNpsTUn7wVtWi61H2u/JOBc7uli9sXM63JD1GQ9bIINd6kXsxidjqrMTm99nST4qpmwK+aEk9K9GV89MXUktEJsEYGcpbkuyHqnPV0riDxc9PgYnDDtOVccAYuIHglGUA2AP4ty9aFCHKSoDvLubJhexFfuFDtSCgsZV7RxpmBB7y92lnm8/QmZOTCFUL3Sf4JWzALwicx1b3A8Le0AVo9nsEHfVL6TWJJEatHg7o3L7mAw4Kyfll0d+CToRK+GIN1U5IUOELUcoMnKBvUVqytFb+xHuD6qTxvlDrYV/S6MpDLym+FbK+5/xauRor0j1sLI3FuC6SpsBJFWq1tqvV18z5v98ZKULlwNNH0CDCKglxxguMS2ImClP+gbmSfuBVTJjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(261026140227099003)(4143699003)(261009221727099003)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(261009223327099003)(261022105027099003)(261022075727099003)(261022113327099003)(261009220027099003)(10067099003)(261021121427099003)(261026121527099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KyO+EPp5jht7w7IVYb7uZ30qxOKPjnnl38Y/xUoXOgi0S1XEl8adtAWk6/wJ?=
 =?us-ascii?Q?OvplpxQZO4wvnVpQCBblHlck7hfmQ10ZDL80rzZR9qaREJMdT/oj+g8ghIie?=
 =?us-ascii?Q?LLDy7UoUYz6B6PmvO21vezSDWEn3vGfA1cFw/A/z5hoxEbDCdu42zhzPAJx+?=
 =?us-ascii?Q?gpEtZHJT7U3uhICWxLJhlYL9djeiPDuu2FKF7pHVwIXEzhL9DCfsWa/mgsc9?=
 =?us-ascii?Q?dTKglrSuwg9YvXOiGAvOnuTspfH7bLgc/VkEcrN3YCVqRxP3heqIjwEO297F?=
 =?us-ascii?Q?/DgrU6xZEyBX5p87qJErGpbEyCXGYKYKn/9CvzbCk84mlNafSALMCvAajULk?=
 =?us-ascii?Q?S0NTpNDgmjy0//i7px0jYuFuIMKEs8IPMocBTjluoJHEMeFMc/UZdWPfTSwr?=
 =?us-ascii?Q?b7ulH1f2NiT1UHBo5ermvrL09nDqWCMAfJnxBDXIqnxX7grDmP3VAIMLX5kv?=
 =?us-ascii?Q?5+6U7C1w15z0TKmylHQQOHSQPVduVdTWPknAXjsHVnY9MpWo9f5JikeuAEL3?=
 =?us-ascii?Q?zEHBulfKdElvv3Y4v8hIMDwJwEoXaaFu3Zg16zcTYsyqvTwRMe/74mhMjB0c?=
 =?us-ascii?Q?ujDJOFB1c6hKmEJtPPA4+h8TcE4FrRZrgOd9+iipL5KFDcDen547MB97r1rR?=
 =?us-ascii?Q?N5qUdtwDm2K0nDECir2expDqs2Zusy0Oi13qcYvBMOOeNcpVQTVwwReCF15P?=
 =?us-ascii?Q?L+9GypD2uCDmvhsycNunNog50kUuzp+99Y4vCcZMwdN0P+qHUgEcYdTdF07O?=
 =?us-ascii?Q?B1lctfDJvKWHGMEzrWUXwBf8L7I3r+gzppOCHnDri9C1pazC3ojeVKbsGIj1?=
 =?us-ascii?Q?IwqPeZXVSq90qDXdsuebliLat0w8/Sg5BwY8qF0YBTWrEJMmhAwovlJSCksv?=
 =?us-ascii?Q?hbhzmVcFBjcxbK7OfuUwgpjKE1g4s2gULbRICT8JyB5n5yCX5LW42pKhhTAe?=
 =?us-ascii?Q?TivgbL0epF8jNjcAJHkjCpoJOSE7+yFmNhVUsCjvWPPT90ybeVfRaPMNmmL/?=
 =?us-ascii?Q?OFB8lLcLjAYqH2xkvT1kISOJ8skKNLcjahApNDa3mHI1dMW/t8k3vSRbAEmk?=
 =?us-ascii?Q?gRnnbsYxNLQVsC1JmHZwP5obnXOv1FUuC/ya/24rru+NFkFVHJkKYaIgSTTC?=
 =?us-ascii?Q?+rc++AnxIRN1TKyIeLhxo8X8Hpewq7BqQFtbtp93JjyI2TBuO9LwhHUO6X+b?=
 =?us-ascii?Q?E+azPJBaUMf3bIylxbdd93rvFO/mKcDwU3XXa1IQZ3D24qGsiGdxmvuhHqPX?=
 =?us-ascii?Q?ifSw5vwoCxOlUx3cyCGVFeBTlPULjGtYHiF7WTzPIY9YAgMUIRgui7FRQOVf?=
 =?us-ascii?Q?W7GYDKsMi9Z4Eu0H2FhBZYzbS2fCLW/fiDLCXkjbR0mfAPPaLAefHWMfpvVD?=
 =?us-ascii?Q?OkV3g+m45otpARbUlBSwApb1KwFyORhzffg5z2kdp2RIneAvsParf6r80Q2+?=
 =?us-ascii?Q?Ew6B7U2sb8pbEgvIB/2AnSATn0oCDOE8ugc01UAiCfZmM8e4o5FcHBN8xdte?=
 =?us-ascii?Q?uWgZc6SXjhTyYfRMNeuLn6FpH/cAr8MHQCQG7IQUZGDCW4aDZ0FXAhZd587L?=
 =?us-ascii?Q?DTSLzhJzhUCEbd6et4HEOd/YfIGAxfYz+pj5ssXTgqFZVmdJmMaoMFYf6lty?=
 =?us-ascii?Q?ROK2jog5ief47uMfg8gkzLUXMOZls2BhMIa+qOnjunwDueXfzfzt7vC7HHVb?=
 =?us-ascii?Q?eUJOEHKSwCh4kzpCMBAmD/yTLQwMiHGNxZy3eV4/y4t/aPTfGd3QWXkxTE7g?=
 =?us-ascii?Q?flDFyOg6OsaF99YvKnsVvH9jkQsxXpQo4F+sgG0myHSzSbBZ2oJz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb5e150-67f9-44bf-0f50-08df337fdfe9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:40:42.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qp9a3BnLgyYGXzr/r1WorqJ1Zz/IdCLrM1LJgYsftwy4oFmyuFADzoiZ+Gxanzq8lgo/r8MQWegJF9u7XSeTNZ4nAebPtaRpMz2AWgu5RGGZMe6krCwu9Voyx65BjvY7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB191951

On Mon, Oct 26, 2026 at 12:33:05PM +0800, Binbin Zhou wrote:
> The DMA mux on Loongson-2K0300 is not a standalone hardware block. It is
> implemented as part of the chip configuration registers CHIP_CTRL13/14/15,
> which route peripheral DMA requests to the physical channels of the CMC
> DMA controller.
>
> Document this as a DMA router. The #dma-cells = <3> specifier contains
> the peripheral request ID, the target CMC DMA channel, and channel
> configuration flags forwarded to the parent DMA controller.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../dma/loongson,ls2k0300-dmamux.yaml         | 72 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  .../dt-bindings/dma/loongson,ls2k-dmamux.h    | 53 ++++++++++++++
>  3 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
>  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
> diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> new file mode 100644
> index 000000000000..df607d9ff599
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dmamux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-2 APB DMA MUX (DMA request router)
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: /schemas/dma/dma-router.yaml#
> +
> +properties:
> +  compatible:
> +    const: loongson,ls2k0300-dmamux
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#dma-cells':
> +    const: 3
> +    description: |
> +      Each cell represents the following:
> +      1. Peripheral request ID: This describes the corresponding bit field
> +         for that peripheral in the configuration register; see (
> +         include/dt-bindings/dma/loongson,ls2k-dmamux.h) for details.
> +      2. Physical DMA channel (0-7): This not only represents the DMA
> +         channel used by the peripheral but is also converted into a value for
> +         the corresponding bit field in the configuration register, indicating
> +         the legitimacy of that peripheral using that channel.
> +         Specifically:
> +         - I2S/SPI/UART/I2C: Require adjacent channels in pairs; valid
> +            values are 0/1, 2/3, 4/5, 6/7;
> +         - SM3/SM4/DES/AES: Single channel; valid values are limited to 0/1;
> +         - CAN/ADC: Single channel; valid values range from 0 to 7.
> +      3. DMA Channel Configuration: A 32-bit mask used to specify
> +         device-specific DMA channel configurations.
> +         - Bit 6: Peripheral Address Increment Mode
> +            0x0: Disabled
> +            0x1: Enabled
> +         - Bit 7: Memory Address Increment Mode
> +            0x0: Disabled
> +            0x1: Enabled
> +         - Bits 12-13: Priority
> +            0x0: Low
> +            0x1: Medium
> +            0x2: High
> +            0x3: Very High
> +
> +  dma-requests:
> +    const: 22
> +
> +required:
> +  - compatible
> +  - reg
> +  - dma-requests
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> +    dma-router@16000134 {
> +        compatible = "loongson,ls2k0300-dmamux";
> +        reg = <0x16000134 0xc>;
> +        #dma-cells = <3>;
> +        dma-masters = <&dma>;
> +        dma-requests = <22>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42f5165019ee..78622b255f88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15351,9 +15351,11 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
>  L:	dmaengine@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> +F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:	drivers/dma/loongson/loongson2-apb-dma.c
> +F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>  LOONGSON LS2X I2C DRIVER
>  M:	Binbin Zhou <zhoubinbin@loongson.cn>
> diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
> new file mode 100644
> index 000000000000..1e2907ab069d
> --- /dev/null
> +++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Loongson-2 SoC DMA Mux dt-bindings
> + *
> + * DMA specifier format:
> + *   dmas = <&dma_mux <request> <channel> <flags>>;
> + *
> + * The <channel> cell selects a physical CMC DMA channel (0-7)
> + * For peripherals using channel pairs (UART, I2C, SPI2/3, I2S),
> + * the channel number selects the pair: 0/1 -> pair 0, 2/3 -> pair 1,
> + * 4/5 -> pair 2, 6/7 -> pair 3.
> + *
> + * Copyright (C) 2026 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
> +#define _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
> +
> +/* UART controllers */
> +#define LS2K0300_DMA_UART0		0
> +#define LS2K0300_DMA_UART1		1
> +#define LS2K0300_DMA_UART2		2
> +#define LS2K0300_DMA_UART3		3
> +#define LS2K0300_DMA_UART4		4
> +#define LS2K0300_DMA_UART5		5
> +#define LS2K0300_DMA_UART6		6
> +#define LS2K0300_DMA_UART7		7
> +#define LS2K0300_DMA_UART8		8
> +#define LS2K0300_DMA_UART9		9
> +
> +/* I2C controllers */
> +#define LS2K0300_DMA_I2C0		10
> +#define LS2K0300_DMA_I2C1		11
> +#define LS2K0300_DMA_I2C2		12
> +#define LS2K0300_DMA_I2C3		13
> +
> +/* SPI controllers (IO mode) */
> +#define LS2K0300_DMA_SPI2		14
> +#define LS2K0300_DMA_SPI3		15
> +
> +/* I2S controller */
> +#define LS2K0300_DMA_I2S		16
> +
> +/* ADC controller */
> +#define LS2K0300_DMA_ADC		17
> +
> +/* CAN-FD controllers */
> +#define LS2K0300_DMA_CAN0		18
> +#define LS2K0300_DMA_CAN1		19
> +#define LS2K0300_DMA_CAN2		20
> +#define LS2K0300_DMA_CAN3		21
> +
> +#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */
> --
> 2.52.0
>
