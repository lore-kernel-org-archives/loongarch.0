Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794582642;
	b=lqG6cU7y2G7+1su+DZIiI9OPcPTzGurXvTDPmENUKaoDH8ZoR6+wmelJ/v0Zl8CRsciK
	 UK7uQT+D/t0aKT9veZyOVZqCOy4EmNzdLaxJ3s9aVL9kckOpwSEIqD1Nz/Uq8zXAPbbWT
	 0rP3w2pPyjjRt84rUdSXBtvrjmzOv6q0+FrlsR5ZcMNj/TUIN6hTdlMV/mRAQbhei685j
	 NjZRwqIFFJM7PFzZwg4vqpQ1gP6XCABzKyx2/jyKmw5lXZR3aJVP5qnCrmKq8T/EwpKEs
	 MzoQEL2xIWiXpxyZErXPKXWxWjbUBUbWcKAh8ktCJxDOMDFgnlcrZSuovedX1O+jNyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582642;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=d3MlzJ0uIkHEPuV/MDaEVOSGVxU9w1A1SWq88pQja6Q=;
	b=RKO9s+YL9nrgl3tBrqyqp/dZB9KPRQfUQLawxWXIhgZYS5nbWvzs44BC9KnyOfA3iPli
	 bfSvA9rDrbwV/asR5nTykEfUKcF6abB6trlnqssni+3HNfOPhaMN/RZykL5mcfl41IGx4
	 eqSWWTDVFKo+nxc4FuEtuYia+zEFuaxLVOaRJQ1RoIbx9UiFF2Yfjxgl8DTQEo+MxGPoe
	 Vv3kQQuW5iqueMWrv8VLwbvCg27cORqkhOsNzttDWj7Pp9V6Oe0n9p3Mh+fc/E6i/AnL5
	 RzSusrMtGwccU53VWHeWFX7Wbk6boVNL9Gfim/d4jr/umnO9MxJPtbfTHGMzO4cTzFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MKr+rhOT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.31
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4D606A32D
	for <loongarch@lists.linux.dev>; Fri, 13 Nov 2026 15:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF4D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MKr+rhOT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryI+vMEkg4+NpvRWXAb/NFdouXhh3XuV4uuQ1Ls0O131Zf+ajmDoHO2DT3QpUYRT3hofLVVfkOqrpMZNIq+vzNOSNMuUm1j4QrAh8ZD5wtR7MkuwYfydHmNqUNN9PJXUI6uRA69PJp3RLEnDbEOpxtfTYMVkhHm/0iZaOeU9G+CP/g5vS4NxxwORMz05pFpdxs6fK1BvKj2jZgdT3/rzc+qB5ZC4FC7jizum3XWqo3CUwtIMhOOrH15vDusm/uOHMxiCC58eGtPqQqFMtqF5uXjmkrFwnoYmO9UP2YgbZIakhrmXDJDbr6PvA37fWNbP2eBHbCbeMoVRbnXq7uBPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3MlzJ0uIkHEPuV/MDaEVOSGVxU9w1A1SWq88pQja6Q=;
 b=JtqOIj/B6qx0GNYnMp89xDdtKG5LR1pwRNN1pXo84ZOX71FetOEZ0JhkkFp8mo7oZSIG+HE8soUqhlYeY2aoO38E7ElaBEmTMq/Ma6H6PDme1NFcXG0r41EM1MDZuWrgfsn93idOVj9Ze+ray/1cIzWIKL02FS0A3fuHWCD7QmNek2KWg+Bzpf7fRYbG327dIcW7AbsnVuGxW7+1j9FrNGqWNslZVE6qjFrVcn+taoui1XsU0a8EU6Wt4N4/68I/5jg6fx7JXvfIgdEKWL6+gQSsYChb3W+bbudXHslU51kQvRjx7pyKYXPjnreyTpAo9BChoDk/Fusa7oxWoh7ZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3MlzJ0uIkHEPuV/MDaEVOSGVxU9w1A1SWq88pQja6Q=;
 b=MKr+rhOTyhtpU462NPf3m45gQJmgfGByemDK+3Mc9Qv3CnYawkFwvP2WaQiiy6ABlsKHAzgFFE3zm3wkGfM3uO2aAHNtzIO0pVNnTSC6ERUo7VgXexLUU9yeToKD7jkM/PmgOferhm0Q2blY04f1k+CDJWxBMr+MN3SSEyttxuGuF5VubrUZO3H7K+NjaHQVeBNiVhjSDexBOV1zbHeq1UvGovYJ/apAeIZvrldj24ZU3knc2nqH8oiOE+gLcd4qTC1W8XRbhseUkSTXiMndM5q/5nnQG2UTyypaC3CWC4AM179uLKoc7YX/2ltsYE0oI9vtEtUXkmGnA5jRlfophg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV3PR12MB9332.namprd12.prod.outlook.com
 (2603:10b6:408:20f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 15:10:30 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 15:10:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 05/10] efi/libstub: arm64: Use struct efi_image_info
 to access image properties
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261110121731.2728824-17-ardb+git@google.com>
References: <20261110121731.2728824-12-ardb+git@google.com>
 <20261110121731.2728824-17-ardb+git@google.com>
Date: Fri, 13 Nov 2026 11:10:21 -0400
Message-Id: <179458262196.3625095.3933294651326649989.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT4PR01CA0299.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::14) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb53606-0d92-4e51-b3b7-08df41983ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|11063799006|4143699003|261102123227099003|261022115727099003|261021121427099003|56012099006|261022075727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	qFUd7+7TvFqGMKwH72bsJwqncKG/8Md+n3p4pF+zQVM9etl9t6mxG8HfbPDr4cetoLcT9ugeDc+29vOkf8s6yk6EFshk8I83RGa4wCTxCyMYHoNUSp6y6qiNc5ZmTXcbow0EyjW7Msl4KssRuzaRDP4RBcrcfn8tSBGKcTR4sDIzOoTQi7v+i/Z//ZzNZR12cnLulLH7xXETKgZPpUpYEq1/uoLsmR1o86RDHk8HKowzmkKx0LDssWHLryjzZeIQd1hwnzGBFnhRAKYCI6Jdq6FsnNTTNXJsizoIRE0MyoAKC7qoCtXmHXWhG0oysf5KDYiTsZECx+Q5fvU1TFCX9p7frlDfIvlddfRlAVu7PKji3XDXFB3Gbskos+1H3pWzAXh/gtM0a0BwN7mDC+1qGmtVuIt11MPKnRj/4ovTmoLx3FmC5dKW8S77ZNfto03p3J0+qW5RH01hqpq0fmVVEUjYRnPN3Xjcndh7QDx0aZhhu9XNGkNeSbqym8oWjochR220k6wxIIRVAI7B69wGT+mxtNdp9NwvSLMWFV2C1s01O7MkOUAlyamQZu+0epY0uOWTAocaVJ2Xijymy3hdYbvHf1/XxYiLRDns9f5d3uIrRbfekH/vQw0wCEpLnJuf/91IZXiQYjoQpqJAWzHGjz7pH2lxvZwq5v+6JGPy0pE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(11063799006)(4143699003)(261102123227099003)(261022115727099003)(261021121427099003)(56012099006)(261022075727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R29YbS9LSkdsMzc5WEV1MDh5UUhidlhBWm5oZ3ZhRW93M3pTMFh1eDZtWi9Y?=
 =?utf-8?B?R09xQ2NOeEovRkR6TjAwdUY5RGErNWJNazcrdG1WRzlmYkdMaDBjLzFBMTZm?=
 =?utf-8?B?UGlwTTBmWkUzUE5hTFZOTDM3aUlPMUVwQW1CN1ZnKzU0Mjh1OHgweGRZZjFW?=
 =?utf-8?B?OElGTEp5Z0RwRStQSEpaR0NDcGpDMUdBUFl0Q2c1ZGxFUTNvZExCR3kyOVRN?=
 =?utf-8?B?d2pJbmZXTmJua29QVlBlMkFLaHBXVWFjMm9DMFRkVHdLS3dYc3V6TStqUkZP?=
 =?utf-8?B?Nk5lQ0pUWldVL2NpNFI5R2ZqUnczaEZlUXZ4cWNaa0VLelZzNWJldWZxTkVQ?=
 =?utf-8?B?UWhKYUtEQ1ZQK0QwdkdGSDg5b3hTT2VTa0lkMFpWa1Q1UHVDTmNVcWhvVEgv?=
 =?utf-8?B?RktuMlhDbUFTRTNBdTVETkZoVDFDZk1EaEswdjlFVmxpOXBhMFRoR2FDUy9Y?=
 =?utf-8?B?YjFXclRSNVBGNjFyRFVHQXVCNE9GSVFzd2JSekJGZ3NyOVZKMzM1UlhjR3RC?=
 =?utf-8?B?Q0pUNkhKZ3I2elVESXhmNW1hTU1OMS8zaHREWUpDOWRpR1E3aHdrWHNEbGs0?=
 =?utf-8?B?T0hibGZ3MDFXQXVKNVBwM3BSQUFUMlA4OWdVMDBKTklQMUdCSUhDS2Z2T0FC?=
 =?utf-8?B?OHNiU3NsNTZpK3ljUy9BMndVSUtoUUZIejRCZGduTHA2NFhTZ3dlc2dDQnFW?=
 =?utf-8?B?V0s0ckkwSFppcHY3NEk1ekVaUnVpWkh1aXg2VWY0UlJlQzFyTXM0bEFaMVpp?=
 =?utf-8?B?V3BEaE9hNlBWeTJQQi8vbFlVcUR5d1NvaXFNeHFQVGJweUozZGVuTi90T3Bv?=
 =?utf-8?B?cVN3bkgxcWNiSlNWenpZVkRuZVpMSkdoVFJhdFFtbVBTNFRRZ0UyQWo3Q0tS?=
 =?utf-8?B?T2c2Q3I2bmtwQU5zeGtrQU5RUmc5K1p1MUsyUUQ2bmFHVzdRUDdwMmZZUmhh?=
 =?utf-8?B?cGdpUjhaR2djSDNpVUdva0RyRDFVaHdKWmdTS2ZFTlNtbnJjaStqOWt3WDh2?=
 =?utf-8?B?Q1A0WElGTG5zRkNiLy9jQllOT1B3Qm11aVpkMWF6YjVoUHo5MFJVYjBkdDZG?=
 =?utf-8?B?bCtTMjBBU2hFdldrWERyOWFWVlB6NFJneXNJbHhWbXBqZTRJY3pFdEI2dVRt?=
 =?utf-8?B?SHVKYjROckNxWnZJUVlVTi9FTDJnYlV0ZDV1NnUrNTZldnh4Nkd3cE1vVzJY?=
 =?utf-8?B?b2l2Y3ZCa3orZ3crUUIwNDJwUU5EZU1lMzh5aXJTUyt4WDZaWTJIbDVkSFFO?=
 =?utf-8?B?NWJrZjBjZkNMcUdjRE5nMEpHanA2WjVtVVB2TFQ3VnJmckgrQjlvUmpnODMx?=
 =?utf-8?B?cEdIc0dBOEtGSlZIa2FLWjkvc1pyWld5YXlCZ25ONVFnSC9WU05BcEF6N0tT?=
 =?utf-8?B?RVM0K1pVNjZvNFJpcU1RVDNyNUtxREhqTXcvUWtrT1lLWGl3K0h4b1pOQTBF?=
 =?utf-8?B?TVRmRTlENzM3TmVsaEN6S3lmaW0zZjhwSGwycFNjWlQvMWdGNHQzMC8xWnNJ?=
 =?utf-8?B?K3ZvVnhFckRMczBoTGdBbVpTVFdLc2pHVklYTUtPaTl1eWF3NTBxbWppN2Z2?=
 =?utf-8?B?dS9oME1jVUtwcGMyK0dSYTZsQjJNVVlJL0J2TTZpM0x5R2FnWW1wZi9VNURJ?=
 =?utf-8?B?RTRqcG5Kby9XQWJmN2ltYUtIbnhXU2Q0dElZTllnUGwrTHVYM3lIblBEaG1a?=
 =?utf-8?B?MENCZjJTMytSQkpGSWNXVkZHWEthNzhsYlErNXM2R1Rsc0xIa083QVdXc3NC?=
 =?utf-8?B?R2svQS85WHhTNExVT0J1aFh3U2dKQ2R4akRaMGJhT2xNMUxMKzlOK0s4ZTd4?=
 =?utf-8?B?TFRKRnJlSzVoVVRjVnI3QUNsc1VWNHBaM0xDVjFaa2J4d1cydVpJVzFkV2NY?=
 =?utf-8?B?Mml2S2NkQzNNV1FhTjdOOENQVnlxRkkyZnhYZE94dVBYNVZLaEpPWjdYekh3?=
 =?utf-8?B?cnpaV3VzakZBaHE0RTcybDY4dG04RkRqeDdwRUlzc1RKZkVRNjBoaVBUdkhr?=
 =?utf-8?B?MkEvSmhFWUhLQTZrWVc1ZXZyZHdPZ21ybmdYQm1tM1BGeVpyMk9DVWw2b0Vk?=
 =?utf-8?B?WEJLZ1J3V0RIN3JKQUhrY21RK3ZHTUJhWW1RY1Fyb1RsNXVXNVArM3FmT2Mr?=
 =?utf-8?B?d0xoR0ZUVkJOVC9JTjdpZld5N2JyUExTMnZIVXBZa0NyUnN3YkcrUXA0eXN1?=
 =?utf-8?B?UFpyc3p3b3lxckFXbkUrckovNEpvZUcrTG1MNjZ4ZjlITWJRK0M5dGtQWkQ0?=
 =?utf-8?B?UnFhdDhNelNCNVZnRHVoYS9YN0daVW5VYnVhbm5SM0ZuNHpTRk45dTkwQUJs?=
 =?utf-8?Q?bp882ZKPMfA/XmfuH5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb53606-0d92-4e51-b3b7-08df41983ed0
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:10:25.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VipP08AWmyEzPL8smi9zV58JHu0/3CvacFHYakai/Vs1cHSwPqiuO7oVA1uTN0HH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332

On Tue, 10 Nov 2026 13:17:37 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> Instead of exposing individual symbols to the EFI stub explicitly via
> the linker script, use the generic struct efi_image_info, which accesses
> the original symbols via PC-relative references from the stub itself.
> 
> This improves code reuse across architectures, and makes it easier to
> add new references in a generic manner.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason
