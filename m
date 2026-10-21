Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792595143;
	b=nyvMsqAomGVibqeO7i9/9Ctkr5amepg32KHLdWxV7hCAdsdH20r0m65O9FXvVDoEIxRX
	 +JQ8l28+28rbiR+zykQNXPWsJpM4Jm4gSPTJ6RTEtDMo2MUMryGg/F9vCsBI/y/uU9Iwh
	 esCYqbZqr68zG0LErz2BelJPYlCxh+LUmhwsQhR25VsksX1I82wt04B4oYBPxMYbp0p0x
	 4yFZajgEPhyjHSqqtl+rwWeZSjDdxflBkheia+3xdMtO9+FPkF9iNGPqDkwKr5hGxcqe0
	 p1O6OG52gSAWE1u/HA+WLL8scCAXDvBH3zuGzL0bHglrgPjjIqVIovRwHOAnNP2oH3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595143;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GJuliuFl6g78VZEwGc8POKZ6GQjPa0wi2WXPUQOUbnU=;
	b=SGZF2tdZBz3OEsFHP7MfuJ9+FeIuYm64hsrqHavqVV+Rru6MS7hZ/yjMUzJ/RM17VEUg
	 GkmJEOzUKMwagGKIfxs6C+IHYHYZDkqHvC7uEPBwth1KIpb73OTsJ2fRw/o/XgBGPsDGH
	 mJk13AOjxbAQ8I+cxwQD67No/tJmw3BS2W/LDUbKYkiThaamNDth41A0aEThl7D+D8LAG
	 m5vysAjh4+kMCiYfAVKt3TKtl6aZDhuTSmyn5qZ9mSHtH02/kkN0dyZJK+VujnhmWj1Iv
	 9u4xlT+x0Wei4DtJZH5SXiyX8Rer/h53BaedsMTS2laidUxAl9jfL0BdOzg4gCJxNYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FwnwP7Yk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D99606A319
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 15:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D99606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FwnwP7Yk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUeiRJ7Q/dTXht85XiGR6nF+A3uTK35wDhqLHnHdTZAJ4eL2zAu5AVkhqnBugpru870Wi0lvibNJlNCoWDXzN1prphFgXvYyT+EqnOprn/eJtPugIgJD4uE0iOV08lF6vUzCRJcB9g7h4x1ERe86vyAexZjgltBY3OpB8c9k5iLY/U4q2qz7eFpiZRNySg+70xe/SCxCQelf4kK65wCJRWd7pE4BXiiH/6l2wHcuI2IuOU7X54dMCOB+U2b+o9hOnOvw/njbIuI4mwUD5J1Ct9Ysei1PkmA4TdV+Rf5SoF6tDEgENXlv515aaUjlXqJrWP48gZHCCjYTH5Ax25tdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJuliuFl6g78VZEwGc8POKZ6GQjPa0wi2WXPUQOUbnU=;
 b=sWoS+07BdhwNkGluyBzZFGg/7Xu99aocOR7WaOekV/kpk2kko+uZwAEkhx3wIJySO+2m0nSvKHjXLANR5GXgWvrQMP+gsKFbkJ0uQcYVSgg29OzdRnyuYflSXlAp0kj2+V9SgWvXdSTGtypSrqDPdkiFq3HenLoBGjt0S6B17R0uC3i+SYsrHYJX7Xve035FM9+jZmiOqhRn7RCwiI5H5WBeqw9tddwpH5a2P1hvHzOgrsbw9A35KVVBK8inFT3QCYXn9wHLrc7iOUJ+XwePe2E3bJWMPd3ZoJwmNXpCU4cB5kegTQB6D/otCnTpXyNwzRrWroii1J9cT2nnFAz21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJuliuFl6g78VZEwGc8POKZ6GQjPa0wi2WXPUQOUbnU=;
 b=FwnwP7Ykc1qtd+/eN1+TgCbbfE0QxfJaW1gu/gWtQr/9Q0YYZEaQJL7JYQjSTXXwxtHrJT/XrdWCN5AykiJLf/lzBNsaRVB+2811mfPpkdEcm8SY97XFmJ5hV1GwQmmsDQdQ2PHTsf8Dk78UMzHPClCWWn9NZJe538w84hlN8aN7N/DVgfzQ8b7BHyJ4HCIlxe0piqQEzaviRdyplJo58c/tVZ0CikYsRyu52S4UlKMH5McCCGHJ7PTIa+rWNUDVEObDd8Yis0PwpgBzuJB6m4kvMuhqpDIopiu8X7hfU/rsFIZp6L2RuBCF2uRH2U0ipR+TpiHvsyVqeFGoklgk2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMZPR04MB086416.eurprd04.prod.outlook.com (2603:10a6:20b:7c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 15:05:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 15:05:40 +0000
Date: Wed, 21 Oct 2026 10:05:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA
 mux driver
Message-ID: <atjUuos9UhJsWU85@SMW015318>
References: <cover.1791535540.git.zhoubinbin@loongson.cn>
 <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
 <atEHYLnJ5GTr1-ae@lizhi-Precision-Tower-5810>
 <CAMpQs4Ke44d=ijRPbmZM5FZ0YReRH1U4jFMA=RPKU1VNLsNv+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4Ke44d=ijRPbmZM5FZ0YReRH1U4jFMA=RPKU1VNLsNv+w@mail.gmail.com>
X-ClientProxiedBy: PH8PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMZPR04MB086416:EE_
X-MS-Office365-Filtering-Correlation-Id: d3424eca-7e18-451d-c294-08df2f84c58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|6133799003|18002099003|10067099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CEpd9GD4ItvZGBRet9vA22MIdNR/Auel0GSXnAnLKTkJkOHYtl9yFZT/Hk1i4wnMesCnAHmU2jqhdFXpEDAUb7/+P2p71aHRfHO/bx+z+aO1EgAzFbQJUKBPmBmXwFxHk5hENa+bJobSdwYfGSI3hHhdxinaVYJ2caGmflHN1h/t6X9GTEVfWr+NenNMpR3CjRyQAhL8kOBdEWJVVyCSHZS4LR70EiW5H3HvzpERLP9YKbv/eNC58lZD0JTn2X1SFcUBN0uzZvDx0NNuLMDyoqhfmozJ0t+o1w8A9Erf4DLP60l3yTByYODe79gGhu8thY2tItHUUFyP3R/P+gZyfZL6QbNAAeWI/qEE4wpMleoPDrb8hIHvE0bfc2mKBqyG1I6PxmMDwiDTcHUTF1nNMoFzbkR944kYOiVcxoztR+OY8SWKpbcL58e+w7bta0MYbUbUw04QN62xHwANWNRROxvJm5/E1hnfynTcxc61RX2tXxoY4H5N2jYEtL3V3gs0HAq6NUOKE/0nKGntpmQ4H7t4pcEGZDky+vGsg9oRgyN1Jovi5gbdn1zKzaksnAmpyiHLJj7T9fB/Cf7l1hqoglKBqfX1Dwi/tPuva90JfUNI0Rt0jllBmSqBm+Rs9X3AzCzyD/rokDGhRhWWMyZDbGyn8RRl2wUTaBk7EU+Avog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTNqckhwUmpZd1R0UlpmeWU4SUkwOGx2a0dXblZkaVNZeHhVcnFkeHlJT3Vn?=
 =?utf-8?B?OFBmUXNiYkJBK2pBdHhsS3VHTWY5L1lUTS8zdGk3MlV0R29uaGZKWnRlRHVQ?=
 =?utf-8?B?QUJGdXBIcVAwbGR3TTJGWWpCRVI1R1hJWnVCcFFIb0wxblREcWxOYUpvQWxJ?=
 =?utf-8?B?VHhwQk9qMWdYNzgvalFxNjl6S3ZTRWpkZmtHZDBUT3dleThBUTRxYytSZ1R6?=
 =?utf-8?B?SGZsTDkwUkI2aldCRDQ3c1NUZFhrTFVSTUhiV1dSQSt3ZUNjOXZaMmlOZ2pl?=
 =?utf-8?B?cDFodWFlZXlsdnRDM2F0YmQzSXNLdG85NUNRWFExalFSQUNGaTFRZlc4L0lL?=
 =?utf-8?B?aVVjQVFuWW5LQm5EckUzaUFYcWVRZUJoZnFqa2xieXc2L0pDbVErVFFTK2Ju?=
 =?utf-8?B?RVFsYTZZQVpMUU9sU2RyUE9vOVg1Qi80c3FTMDFQNHlycFdDYWpJWlFPbk5Z?=
 =?utf-8?B?UkpTSW5FUWZUUDNGbWZBRzh5ZDdFRGYrK1ErVU0rNEhPTkswZHFpeE5XVHI5?=
 =?utf-8?B?eVg3VjRZK2hzLzVxb2JMc05VN0xTeW01SWpCMWg3RmMvd0xoQ09RcHpoUkZv?=
 =?utf-8?B?VUVnRytlTDM2OW5YRnBrWWJkbUR1VHFWTWRHOWNLVXN3LzltQU0rNjVaeFcr?=
 =?utf-8?B?Vldodm1BZEhtbFNBeGZvNVpiRXJybXkxMUc2VGREOUs0OW9jdlRmWlBudzcv?=
 =?utf-8?B?UkVNcFQ2ZlAxUVR4cVhWQlJkUEdGV2lUamQ3T0k2N1crVXM4NXczbisvdzZq?=
 =?utf-8?B?MVAzSzZpUnRrbGprSC9lQmlSN2xTdkJod3Q3Nis1eHJycURJVDlXRXZBakxF?=
 =?utf-8?B?MkU0djI3ZnRrQm1seFFwQnVZbkZTRGZkY2xkWlFOM3gvQjdvaDAyOWNDUHBF?=
 =?utf-8?B?RmQ0VVE2cFpYMWJlTFdUU2libEpqTTU5UEIwUjM2RzV1SjlvSEJMWlJ0aHp5?=
 =?utf-8?B?aFppdCtqNHovNnVycldYakoyYWh6eE1KZ0w3TWd2MlZyM1o4QkhVVWV6T2RF?=
 =?utf-8?B?M1IxbDJHMVdQNlBHM3ljQWMvczRUVHhvZDR5eDhMY3pETWxRVzlVS1krMDNP?=
 =?utf-8?B?QW5NVVIyclpsc1o4c1o1SC80WEhWTFplVlFaM0pqY0dwTGVWdjd6VmQrSHJi?=
 =?utf-8?B?Q3VrcFc5ZEMyMXlFYUNDYjEzQk1Rb3dmdVdIRi90b3J1S1JHeFkrNVUrYllp?=
 =?utf-8?B?T0RzQkd3NDNDd0l1bzFwanhmVDBEUHg5eUZSdkNtUGw0ZDkxRUIzMStsZ1Fp?=
 =?utf-8?B?MzBBWGFTUUozdXI4S3BDb0tpempzUjV4Z3Rlck45eFFpMjZZZDIyYkkyejVF?=
 =?utf-8?B?dlp3dGZMVmt4T1RNN2xuVXlGMnlMczhDOGY2b1hYREhkSk1EZHc4VHVHZW1a?=
 =?utf-8?B?Rnk0RytaTGdPNXpHdzcxVi9GeHUxSG1EalVtVEZkM00rNFVYb2tMa2JRNCty?=
 =?utf-8?B?Q2loa1VjcFd3cmxSTGxtb1ZaMlUwSzF1d2ZhT0owcGtyVGRORzU4YWtVRjVS?=
 =?utf-8?B?NVBEQlU1dTdYbjRUdldUMVZtQWVrSUVMVzNraEVQOTluQjlqZzQyV0Jwcml2?=
 =?utf-8?B?UGNTb2QvT0VvcEhxaVBUUWJDQ0JpSy91YTBnVmptSGo1TmF6RkMwL3FGNjBU?=
 =?utf-8?B?ci9wWU4wRWh5ODVhRXA1UE45R0dBa3p3TTZMVUpob3YwdldLQTlEazFCNlpN?=
 =?utf-8?B?SFh3SStIUmIyQ09DRTQ2TllUK1RoMTF6VWdKdnJNRzZKaDBISm9qb0RDRnNG?=
 =?utf-8?B?eDlHRUZMQmRtNEtFeUNYRDN2QlJSRGZYNE8rbTZmNys1SWpZWDRFcHpNZDVK?=
 =?utf-8?B?M0JLYngzZ1RTUDVGdkZxMmEzZHg2d01lL2ZrQ21od2t5ZlZubE44RitlbFIv?=
 =?utf-8?B?eUNqQllXaUxKLytBbWdzeWhmRUhsN3VrSGxmVGU4bGRpSCtlZisxWG1oWFRl?=
 =?utf-8?B?N2NpVFg5aXE3SmluL3pOQzdmRDF3eXljOFV4Rnh6NnZRTTNmN2F4azl0UDdS?=
 =?utf-8?B?TWlzaXpJeWVkUXZ6K1htcjE0TWd0WVFOUjl6MTV4UG5yUzZTd0gzMkQ0emNp?=
 =?utf-8?B?SHlzNkdvRDhjN0FsbWNPVGZ6a0dYME9ISkpaNE1ta2llaTdPZkMxcUo0NGll?=
 =?utf-8?B?ek5RbEV5TVFpcTUzdEp3dE9LTUIrUjIvRDdVR2RlSUF3eUM4MHF6WTFNQXI1?=
 =?utf-8?B?aWNqbTl2b25Wbmd5c2tSbXBDelphc0RhNnByTHRUcnJURklKcHNOZkxGbXhB?=
 =?utf-8?B?MEdmVzRxOXVES3pEZzhvYXdQN1l2MHlybDNlcWJWVHlmTENNSktBRmpsTlhJ?=
 =?utf-8?B?LzVYNWxJODM3ZitLdWU3eDluL0t1RjNEbFhSN3pkKzdjTURQcHg4UTdXbEhL?=
 =?utf-8?Q?N3VLCQdmWlsA30DQal4f/jvigtrPIgmmho7AK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3424eca-7e18-451d-c294-08df2f84c58e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 15:05:40.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAf2FtRqR7ZcWNTfmcgH+EYVwHpmRHu3J2zjx7GzY3lonqGBeZNJMcV1urEQwCqg+VLiDAku+q12OYENugnjgJ9dyslns9d6OjR3tTn93947b++/gS7ldvuagDsa04I5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB086416

On Wed, Oct 21, 2026 at 05:34:29PM +0800, Binbin Zhou wrote:
> Hi Frank:
>
> On Fri, Oct 16, 2026 at 1:03 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Fri, Oct 09, 2026 at 05:19:34PM +0800, Binbin Zhou wrote:
> > > The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> > > implemented as a set of routing fields in the chip global configuration
> > > registers CHIP_CTRL13/14/15, which select which physical channel of the
> > > on-chip CMC DMA controller handles each peripheral DMA request.
> > >
> > > Add a driver that exposes these routing fields as an OF DMA router. The
> > > router's allocation callback validates the <request> <channel> <flags>
> > > specifier, programs the corresponding CHIP_CTRL register field, and then
> > > rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> > > controller's xlate is used.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  MAINTAINERS                                 |   1 +
> > >  drivers/dma/loongson/Makefile               |   1 +
> > >  drivers/dma/loongson/loongson2-apb-dmamux.c | 398 ++++++++++++++++++++
> > >  3 files changed, 400 insertions(+)
> > >  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 78622b255f88..0b0c6ea41c64 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15355,6 +15355,7 @@ F:    Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> > >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> > >  F:   drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> > > +F:   drivers/dma/loongson/loongson2-apb-dmamux.c
> > >  F:   include/dt-bindings/dma/loongson,ls2k-dmamux.h
> > >
> > >  LOONGSON LS2X I2C DRIVER
> > > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefile
> > > index 48c19781e729..271fd38fa8f2 100644
> > > --- a/drivers/dma/loongson/Makefile
> > > +++ b/drivers/dma/loongson/Makefile
> > > @@ -2,3 +2,4 @@
> > >  obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
> > >  obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
> > >  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-cmc-dma.o
> > > +obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-dmamux.o
> > > diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/loongson/loongson2-apb-dmamux.c
> > > new file mode 100644
> > > index 000000000000..01bd3ce4ca25
> > > --- /dev/null
> > > +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> > > @@ -0,0 +1,398 @@
> > ...
> > > +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u32 request, u32 channel)
> > > +{
> > > +     const struct loongson2_dmamux_map *map;
> > > +     u32 reg_val, route_val, high_val = 0;
> > > +
> > > +     if (request >= mux->config->num_maps)
> > > +             return -EINVAL;
> > > +
> > > +     if (channel > mux->config->max_channel)
> > > +             return -EINVAL;
> > > +
> > > +     map = &mux->config->maps[request];
> > > +
> > > +     switch (map->type) {
> > > +     case LOONGSON_DMAMUX_PAIR:
> > > +             route_val = channel / 2;
> > > +             break;
> > > +     case LOONGSON_DMAMUX_SINGLE:
> > > +             route_val = channel;
> > > +             if (map->high_reg)
> > > +                     high_val = (channel >> 2) & 0x1;
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     guard(spinlock_irqsave)(&mux->lock);
> > > +
> > > +     /* Write the primary register field */
> > > +     reg_val = loongson2_dmamux_read(mux, map->reg);
> > > +     reg_val &= ~map->mask;
> > > +     reg_val |= field_prep(map->mask, route_val);
> > > +     loongson2_dmamux_write(mux, map->reg, reg_val);
> > > +
> > > +     /* Write the extension register field if present */
> > > +     if (map->high_reg) {
> > > +             reg_val = loongson2_dmamux_read(mux, map->high_reg);
> > > +             reg_val &= ~BIT(map->high_shift);
> > > +             reg_val |= high_val << map->high_shift;
> >
> > assign_bit(map->high_shift, &reg_val, high_val);
>
> I think `assign_bit()` here is not quite suitable, reg_val is a u32
> (returned by loongson2_dmamux_read()), but assign_bit() expects a
> `volatile unsigned long *`.
>
> How about adding a helper function:
>
> static void loongson2_dmamux_assign_bits(struct loongson2_dmamux *priv,
>                                          unsigned int reg, u32 mask, u32 val)
> {
>         u32 reg_val;
>
>         reg_val = loongson2_dmamux_read(priv, reg);
>         reg_val &= ~mask;
>         reg_val |= val & mask;
>         loongson2_dmamux_write(priv, reg, reg_val);
> }
>

Okay, if only use once, old code should be fine.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

