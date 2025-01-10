Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B974214A61;
	Fri, 10 Jan 2025 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736545513; cv=fail; b=bw2JzkVeg98zwwmx/gHneRZXRTXUnR68KNnu6y63iCPUuG1vbjd1PQnPQnpOpowy5K6g8LqPjtka6FTODhVSp4OewGs8Ay8tRJZFvSuwJqnl6j/RgBk9ya5Yw2anRnSQTHdPHCtfTzi60u+HkxNuG3k6oioSbQJ8U/ocZUXpLb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736545513; c=relaxed/simple;
	bh=DYEqIlWQLe3TYd2zBH0VyWuXNFR8bqUl5CrMpANsb2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HrDRLd9TkSoOtONg6rD4c2DjUahtwuCwsKxlu7wb4c6JuVJW2OZyDKwxNEfAHae9l+rpINw3ERqa1DDlyAwREZoLwWdtq+NMLpHJSFGKlbBqb6mo0yxdMPXdHYwmwc0UkYdXJB5R5awgv8BOQUUCXn9gyzi/DfQI33/S35dSvOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K2ArFgSu; arc=fail smtp.client-ip=40.107.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K2ArFgSu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5O6HmriRF/snADLaSi4jzQrk3VVu+P29NVuUCg3LF8dsklMwfw78X4uHGrd5Lqhcp8FerIEJSRF7c3wlzo+sRM7HXTv97Kl4frqVKlQ7xjFXHyEyRqRhtTjfeaGn8f+jdTwp4y1U0untLPrJzwrVWxAOBI0COmGIwXcU/m1/VqpZxWoCw9/8olP+wYNDp7AqFkpE+2AfPwMTshhTJFSRdj32/ZjceZrtlO8jx9+sNoJuzQ1sdYK/PkqCjYZ9LWOCiVNENk3rpPuMYPB7Lekdbh+d7yOAX8w+/t4IeIRGHkEIEg9xFBRjM6kB0cuZmd5c3LrEw/OvkULubLfkSH7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AjQWM1n9gYpLvvCKceW/sgPUUpWzFyKuOgj5ytvWAc=;
 b=kWTzvp+lsL0BRhSGrJ7b8qYNu1Egxk9q4ThnAy/5wjaWHV6g+LXPcrAWT16oHBUnEsfaD79FYKiod9xOEvTiO/S7uoePcg1tVmD2Q+OliKYLsV8B5130Ew/wNvq/4PYIN3Qdfgv3cTLQUSk9xa7GZPeHxH1QQ1+GVrA9fewp02uwjr/J6Fs0EhL8td1LRMj1687EJM2o/n05/U+x26HxdctviuSfSk8sX2veUMXo0yK0Umnojje9BQrmGkCi6pmo42Tf8M7SxQdeRQ4xjUOIq+0M6uOtM5bP+q2uC5dZS7+lPJRq3UYtIKUo1BJSZmsc1/xZ8fIbuPNtzrastg2BYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AjQWM1n9gYpLvvCKceW/sgPUUpWzFyKuOgj5ytvWAc=;
 b=K2ArFgSumpQ7mcZPIvyk5fe6SoqTimy0W7L3aspMTCQzoTAwcjKzqOnDTciQdSiPj/cjbcTHdLBwHDzfq6MliaP0bBH2OgGO3iF8XnIekXfbdMMk6DR1FVU9q4a1nYze/44x5I8B5Yv31xdvGZ+MIf5wzsDYOJMhLpKSH6kZkLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 21:45:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 21:45:08 +0000
Message-ID: <21f4f72a-b27f-4389-b345-e1d9cf4c2f06@amd.com>
Date: Fri, 10 Jan 2025 16:45:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/amd/display: Stop control flow if the divisior
 is zero
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250106085755.3268-1-yangtiezhu@loongson.cn>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250106085755.3268-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: c271d6b4-f197-43f3-d182-08dd31c00d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emw0M0VYRzAzM0tYYUhaVnpPUHFCUXNhUUtlNmRnbHVsUFlGZmYxbitTd3M1?=
 =?utf-8?B?N3ZZZUdqSEZxV2RlQ0ZsZ0FBd1U1bE5lRFNVbWJCV3VyVjliclc0cXJqZHdF?=
 =?utf-8?B?eW9RYjc5OFZoYk4rNnVBQlJkYnVna1FrV2J4R2JkNzZSNEEvNzc2NjJSRFdQ?=
 =?utf-8?B?SkRrT3psRXJmR0k1Zm5rVG9EZ3QxeU11MUpiMVdpT2wrK0VPbEhHVEJVZkha?=
 =?utf-8?B?VU0zci9hSzFHVW9UVmQ3bnc3b28yWmdoY0tlcloxQW1YekF0NUlVa2grQmUz?=
 =?utf-8?B?bFUyNVRuVVhvSnpHa2J5aUQ4NzlFZXNxR0VPVllhSEhPZFJURlE4eXJrdTMw?=
 =?utf-8?B?RGkvUDcvdXBxaVN4dVpqYUxja0ZIbVNaWnNiQWlLTHlYTlJDWFdIUjZtNk1Z?=
 =?utf-8?B?THQzNnJyaGZlSGNxak1KRFU1c3Y0azc1T0Zibmtmak55Rng0NDg3MlJlUXpU?=
 =?utf-8?B?eHgvbVcxS3Y1ZUVHZGV4Z2dYUHdZOVlVQXA0Q0RvOUd5SnVwSWF0TEMvejc2?=
 =?utf-8?B?ZFBWNWJHNC9PR1BiUzNXMml6Y2hDWU12dFdqNU5QeUNqdGJIY0kwZXdxalZ6?=
 =?utf-8?B?N1pVbzNFQ0tSZkNNelE2Ni9wUjcvTDRlQStZb0Z0STA0SDZiNXh4OVVhcjZ4?=
 =?utf-8?B?UWVUTjRHbFFLMXZwZkNVV0FnTy9IK1BCcHN6bHpHckdUYTd3MGdaeG4vdVlW?=
 =?utf-8?B?c1RzdkdhU0JqNllDUnhIZW55RnIvZ1hnVVRCdFBaRUkwQVMwaGdlSi9hRkx2?=
 =?utf-8?B?TDFuaVdVbWF0YnpRRW52YldjRGdFaUkya0NSTUhremd1NWd6cVlrYkdqQ2p0?=
 =?utf-8?B?bFRMN1ppSTZ4SG9IYjYvVGFFQ3IydHNiL09KcmZrMUl6NVNJMHJscWhTcVZS?=
 =?utf-8?B?NkJodlM1a2VuT3pIK0d0QjVYcERGQXRFdDRPa0VsVlN0Y2NMY0VlR3l5Nm5Z?=
 =?utf-8?B?NVdQZWhNanN1SDJGcjVGMFFmN1JMNm11TUx1dW1zZHFEUndsNXRYb3Z2RjNT?=
 =?utf-8?B?NGhDdWMyd3MyOVdqTnlPMnNBYVRWSEhpdWlZa01IM1FVNjFuckoycWdGS0dx?=
 =?utf-8?B?alZnUlNiU2MxYVFzczRmZ3Z3WjFkSFA4Y3JzNlVSZStYQmo0TlZRQkRZTHkx?=
 =?utf-8?B?S29JV2dZTE9mR2pqN1RJMGxiKytmV2UwTGVKMWw3R3J2ei9ZbnB2ZnVYSC9D?=
 =?utf-8?B?VFZvNDJFR2NLd1dvZG05QW5VdVRFT0NVVkRMR2tqcGZ3VEtBKys3aFJ3OHB0?=
 =?utf-8?B?NGhmUVdGd3M2V2owZzEyaVNWZkFlc1NMWXR1MVFaa3RlcFUydEg3VHVDSkM4?=
 =?utf-8?B?SDU2RTBCMHV0SEM4ZHZwQUswWG5iM2hTVDMzdjNGL2JxVGxyM2VHeEZXSEY2?=
 =?utf-8?B?ZHVlU09YZXVxRWdoeWtNK1BTZjBOaUV1czZBOVZXNjRHczlTdUtpMXVoS0Q3?=
 =?utf-8?B?bTVDcGFYVCtXWlhRZkVIMmZNTFRZT0Q0ZEFOWDlDTEo4WDB0NllQVEVkaDd3?=
 =?utf-8?B?MlpaWDQ1b29ybC9KNjc2cnJwVUZ1eGdTU0NIWlVEanlOb1dYNmkyZ1JPU0JJ?=
 =?utf-8?B?VWg2WlNQa2xXTXlYaHRsQ0M0cHpES1Z1b3FSNEhHMno0eE1pclNTZnVDdnpo?=
 =?utf-8?B?M1d0UGtSOGhqV0lwWXFYZXE0czZEcUNxNGQ5WG56S0FxcXRNRDFKK3dSNzEx?=
 =?utf-8?B?TlBCelVQSiszVmxkeFhGdmROTU80eFVXTStVcG4ydlk0ZHhMajZDWkZ0R1g0?=
 =?utf-8?B?Y1d2ZjhqTWUxVjlnTzNBVXU3RVZlajg3VFZjUWg4UWtDUHhwV3Y3TTVabnpI?=
 =?utf-8?B?VTgraTJlNnZxUVA0N0pDWGx0T3FzWlh5MzZSZm9ZMkY1TjBBTTY5TWV5T280?=
 =?utf-8?Q?wjot9GCIGCUAp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5427.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEhrc2liMkRBQzNTYzBOY2piNXBkVjl1UEpLREVKNTdTa3N4aVZ1SG54QVVK?=
 =?utf-8?B?dHVBby9uTk1RVXFJWWpZZkZCVUlTcW1Uc2dMKzdTN1RPV2loSzczRzBFdWdF?=
 =?utf-8?B?aTdORVFYMXdUd1JyRE91N1kzRTBFam9Qcm5sQ2VNdlk2Z2xLeHZOblVsSVJt?=
 =?utf-8?B?YitFaTZmZVNEZ0pWTE9lMVZrNGlYR1BmNittRlUrVVh1WHVxQWpwbmNlRndy?=
 =?utf-8?B?aUt3d3JvTlhMeWZ3c0ZrUG9KUWxKTU5CZjBWeXd0WUE4ZC9Ja1ppNVpSNVAy?=
 =?utf-8?B?U1RJeThubEw5Y01LaHdpdjNpRThaTVdRVkplV0xxMnF1Si9yTS95VlRsMFdQ?=
 =?utf-8?B?aVBNWk1xQzNWcDlYR3ZRWE1wek51WnMxWnVUaDl1TWliRVRRR2c4QkNKMGlJ?=
 =?utf-8?B?blhlbEl1djRPQU8wRmpIcFJRR2hpZTlPUFpoMzNGK2ZRQ0RvaFZhbERKa1kx?=
 =?utf-8?B?b1hhVGtKYyszN0FHY0p2cmZqUXlEZWNxd09NdXR2T3ZKU3ZXTlBFdkZIOWQ0?=
 =?utf-8?B?TXI5NldOL2EvaTkxaHQ3bGxqQ1BBYkFzVkJhN3FGTkUzTkJyM2dPWGd0SFpU?=
 =?utf-8?B?b3RGSTUyODJDOGdjb2NOV09wYVdkK1E3UjhIcEVjOS8vS2Mvbmd2MStwYVNM?=
 =?utf-8?B?eE1kODc4VEs4ci91RlBkZVNNZm1SRUMxSUhmMml1VFdXdTgyQk9SUzZrYzNo?=
 =?utf-8?B?K29odjVpcE1jaHF4cGpINUxTcjlRZUtuN3MrdGNGVmhnK0dlZVl4b3pRNlJS?=
 =?utf-8?B?czY0WDNKeFVpUVIyREdsbWprNEQ5cTU3emNBaXFtblIrZUN6WFU3SjNBWWhW?=
 =?utf-8?B?TGhla3drbEQwdURQSW1JSHJyRFE5Qk1xS1J6OEV2T01xNFVCeitMcnIvUm1G?=
 =?utf-8?B?S0R5ZzZHblcvUGZtWUJpMVpBc2hPNFF3L1VFQStzbUFpSEZMek9FL3NhSUhr?=
 =?utf-8?B?SXk1NklOSWVKUjJFeVFLQnZiMGQvbGQ1d0NkV2ZBekFLODJJT3Z2aFZUZ0Mv?=
 =?utf-8?B?NTdJTUVtNTlrSjJ1dnFiTEZ0bjNPeFozcHp6ZUg4ZmNBVE5yZ1dEMWNtSWJv?=
 =?utf-8?B?emJEeXUwSkpXd3hKZGNyakdmQWYyeXFFdWlwQVVIbWgzaEJ5V1V6anFyN2FK?=
 =?utf-8?B?dHJoNklGUlM0Y2tOYkFHZld1VERrOTNsakRtZEhjQkVmbGpHMjNRLzkzU2xS?=
 =?utf-8?B?dm1NZTRMUEh0VjZJVnNNMllnZUhDcXQvLzlSckx2SVZwaHpPSnRIZkswNitw?=
 =?utf-8?B?WjhnL043UEcyakhlNmY0UHBnL29DaWY1blJkOTR0MGdQbTBsdFVTdEd3d3FX?=
 =?utf-8?B?ZTZOOHk4c1g4dXl2QXlkMWJPcTB4TDhEK3lWMXJIclR3NXJLRzk5VENkR3pI?=
 =?utf-8?B?U2NDeWJwSGJENzZxRmxTZk9DZzRucnFFRjVHNTF4aEJJdkN4L0crcWNndDZq?=
 =?utf-8?B?bGl5ano2T0dML1JrTUdnc1FzZ0lNV3V0dDI3Q3U5dHhLendJbVAzR2xCYzBp?=
 =?utf-8?B?OVJRZk1yWFlPNFJMeFh5TmM3Qnk3STIvN2hWRG03UTF1cVB2cjlzazdLL0RR?=
 =?utf-8?B?Wm9MZjFPVUVhMk0vaUo4eXF1RXlBRDFGSDBDc3JNUVlYNXl2RXI3QmZIZXg5?=
 =?utf-8?B?RGdyazdXVTlveUxKcmVOeGNBaUNuSVlua0prL1FnSXo2VHdFNDFZUGF5MW91?=
 =?utf-8?B?SjI5ZVBCYXV6VkE3SzZzZDZTbG5qSkN0VHZxa0N4UlBMYjFOc0RrR3JWYkM0?=
 =?utf-8?B?OHBaRWF2RnpsaStxY01PblhLc2kyRDg5SHhPaXBmSEJhNGNlZlJkS1NWd1lV?=
 =?utf-8?B?TEFFbHhaYk81OUFkVVIzem1OQkFiV1dlUUhnSkpwNWt2VGljL0ZFRnE3L1RV?=
 =?utf-8?B?dE5UbExuRWRMaU1CWXNtaGtRVFlwRFczZ1hkaWc1RTlPY0ZlYzZ3S2V4S2lx?=
 =?utf-8?B?SmNVUW9lbVBoOE80RWtpNTUyV0hYNDdsY1lTTlhSUVE1Yk9GbVM4UGdwVndt?=
 =?utf-8?B?cnlxY0FaUzZlNlRxTnRxbGdMaWhJS1NvU0NsZVB1dmVyVDNtTllpc21GWld5?=
 =?utf-8?B?bytDYlZZREhXMnM3RVZxbSs4YWFpdlNOREtlcFhoSmlIS1V6aFdvcnFTNmRq?=
 =?utf-8?Q?4mWqM8UDZ9q6vRTl3JhO8ipyP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c271d6b4-f197-43f3-d182-08dd31c00d21
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 21:45:08.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEJxpZXgyWewvGzP5WJIy3kTsSCx68JLh6PZz8y6iVrUWlW6vxcFAeAF2iMVdXZHXKWjZJ7vxtopGssdnRXpCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574

On 2025-01-06 03:57, Tiezhu Yang wrote:
> As far as I can tell, with the current existing macro definitions, there
> is no better way to do the minimal and proper changes to stop the control
> flow if the divisior is zero.
> 
> In order to keep the current ability for the aim of debugging and avoid
> printing the warning message twice, it is better to only use ASSERT_BUG()
> and SPL_ASSERT_BUG() directly after doing the following four steps:
> 
> (1) Replace ASSERT() with ASSERT_WARN()
> (2) Replace SPL_ASSERT() with SPL_ASSERT_WARN()
> (3) Add ASSERT_BUG() macro definition
> (4) Add SPL_ASSERT_BUG() macro definition
> 

Patches 1-4 create lots of churn across the whole driver for little
immediate benefit. We should be able to do patch 5 without requiring
all that churn.

Harry

> This version is based on 6.13-rc6, tested on x86 and LoongArch.
> 
> Tiezhu Yang (5):
>   drm/amd/display: Replace ASSERT() with ASSERT_WARN()
>   drm/amd/display: Replace SPL_ASSERT() with SPL_ASSERT_WARN()
>   drm/amd/display: Add ASSERT_BUG() macro definition
>   drm/amd/display: Add SPL_ASSERT_BUG() macro definition
>   drm/amd/display: Harden callers of division functions
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  8 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    |  2 +-
>  .../gpu/drm/amd/display/dc/basics/bw_fixed.c  | 18 ++---
>  .../gpu/drm/amd/display/dc/basics/dce_calcs.c |  2 +-
>  .../drm/amd/display/dc/basics/fixpt31_32.c    | 28 +++----
>  .../drm/amd/display/dc/bios/bios_parser2.c    |  6 +-
>  .../amd/display/dc/bios/bios_parser_common.c  |  2 +-
>  .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  2 +-
>  .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   |  4 +-
>  .../dc/clk_mgr/dce110/dce110_clk_mgr.c        |  4 +-
>  .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |  2 +-
>  .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c  |  2 +-
>  .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |  8 +-
>  .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c   |  6 +-
>  .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |  2 +-
>  .../display/dc/clk_mgr/dcn301/dcn301_smu.c    |  2 +-
>  .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 10 +--
>  .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  | 12 +--
>  .../amd/display/dc/clk_mgr/dcn31/dcn31_smu.c  |  4 +-
>  .../dc/clk_mgr/dcn314/dcn314_clk_mgr.c        | 14 ++--
>  .../display/dc/clk_mgr/dcn314/dcn314_smu.c    |  4 +-
>  .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        | 14 ++--
>  .../display/dc/clk_mgr/dcn315/dcn315_smu.c    |  2 +-
>  .../dc/clk_mgr/dcn316/dcn316_clk_mgr.c        | 12 +--
>  .../display/dc/clk_mgr/dcn316/dcn316_smu.c    |  2 +-
>  .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  |  2 +-
>  .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 18 ++---
>  .../amd/display/dc/clk_mgr/dcn35/dcn35_smu.c  |  6 +-
>  .../dc/clk_mgr/dcn401/dcn401_clk_mgr.c        | 10 +--
>  drivers/gpu/drm/amd/display/dc/core/dc.c      | 24 +++---
>  .../drm/amd/display/dc/core/dc_hw_sequencer.c |  4 +-
>  .../drm/amd/display/dc/core/dc_link_enc_cfg.c | 12 +--
>  .../gpu/drm/amd/display/dc/core/dc_resource.c | 62 ++++++++--------
>  drivers/gpu/drm/amd/display/dc/core/dc_stat.c |  4 +-
>  .../gpu/drm/amd/display/dc/core/dc_stream.c   |  2 +-
>  .../gpu/drm/amd/display/dc/core/dc_surface.c  |  2 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  6 +-
>  drivers/gpu/drm/amd/display/dc/dc_helper.c    |  8 +-
>  .../amd/display/dc/dccg/dcn20/dcn20_dccg.c    |  2 +-
>  .../amd/display/dc/dccg/dcn31/dcn31_dccg.c    |  2 +-
>  .../amd/display/dc/dccg/dcn35/dcn35_dccg.c    |  4 +-
>  .../amd/display/dc/dccg/dcn401/dcn401_dccg.c  |  2 +-
>  .../gpu/drm/amd/display/dc/dce/dce_audio.c    |  6 +-
>  .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  |  8 +-
>  .../drm/amd/display/dc/dce/dce_clock_source.c |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c |  2 +-
>  .../gpu/drm/amd/display/dc/dce/dce_i2c_sw.c   |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c  |  4 +-
>  .../drm/amd/display/dc/dce/dce_link_encoder.c |  8 +-
>  .../drm/amd/display/dc/dce/dce_mem_input.c    |  6 +-
>  .../amd/display/dc/dce/dce_stream_encoder.c   | 10 +--
>  .../drm/amd/display/dc/dce/dce_transform.c    |  8 +-
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |  4 +-
>  .../gpu/drm/amd/display/dc/dce/dmub_replay.c  |  4 +-
>  .../dc/dce110/dce110_timing_generator.c       |  2 +-
>  .../amd/display/dc/dce60/dce60_hw_sequencer.c |  2 +-
>  .../drm/amd/display/dc/dce60/dce60_resource.c |  2 +-
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c |  2 +-
>  .../amd/display/dc/dcn21/dcn21_link_encoder.c |  4 +-
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  2 +-
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c  |  2 +-
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  |  2 +-
>  .../amd/display/dc/dcn31/dcn31_panel_cntl.c   |  2 +-
>  .../display/dc/dio/dcn10/dcn10_link_encoder.c |  4 +-
>  .../dc/dio/dcn10/dcn10_stream_encoder.c       |  8 +-
>  .../dc/dio/dcn20/dcn20_stream_encoder.c       |  4 +-
>  .../dc/dio/dcn30/dcn30_dio_stream_encoder.c   | 16 ++--
>  .../dc/dio/dcn314/dcn314_dio_stream_encoder.c |  6 +-
>  .../dc/dio/dcn32/dcn32_dio_stream_encoder.c   |  6 +-
>  .../dc/dio/dcn35/dcn35_dio_stream_encoder.c   |  8 +-
>  .../dc/dio/dcn401/dcn401_dio_stream_encoder.c |  8 +-
>  drivers/gpu/drm/amd/display/dc/dm_services.h  |  2 +-
>  .../amd/display/dc/dml/calcs/dcn_calc_math.c  |  6 +-
>  .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 18 ++---
>  .../drm/amd/display/dc/dml/dcn10/dcn10_fpu.c  |  2 +-
>  .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 14 ++--
>  .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
>  .../dc/dml/dcn20/display_mode_vba_20v2.c      |  2 +-
>  .../dc/dml/dcn20/display_rq_dlg_calc_20.c     | 54 +++++++-------
>  .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c   | 54 +++++++-------
>  .../dc/dml/dcn21/display_mode_vba_21.c        |  2 +-
>  .../dc/dml/dcn21/display_rq_dlg_calc_21.c     | 54 +++++++-------
>  .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  |  4 +-
>  .../dc/dml/dcn30/display_mode_vba_30.c        |  4 +-
>  .../dc/dml/dcn30/display_rq_dlg_calc_30.c     | 56 +++++++-------
>  .../amd/display/dc/dml/dcn301/dcn301_fpu.c    |  6 +-
>  .../amd/display/dc/dml/dcn302/dcn302_fpu.c    |  2 +-
>  .../amd/display/dc/dml/dcn303/dcn303_fpu.c    |  2 +-
>  .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  |  6 +-
>  .../dc/dml/dcn31/display_mode_vba_31.c        |  4 +-
>  .../dc/dml/dcn31/display_rq_dlg_calc_31.c     | 50 ++++++-------
>  .../amd/display/dc/dml/dcn314/dcn314_fpu.c    |  6 +-
>  .../dc/dml/dcn314/display_mode_vba_314.c      |  4 +-
>  .../dc/dml/dcn314/display_rq_dlg_calc_314.c   | 50 ++++++-------
>  .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  | 32 ++++----
>  .../dc/dml/dcn32/display_rq_dlg_calc_32.c     | 58 +++++++--------
>  .../amd/display/dc/dml/dcn321/dcn321_fpu.c    |  2 +-
>  .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c  |  4 +-
>  .../amd/display/dc/dml/dcn351/dcn351_fpu.c    |  4 +-
>  .../drm/amd/display/dc/dml/display_mode_vba.c | 12 +--
>  .../display/dc/dml/dml1_display_rq_dlg_calc.c | 74 +++++++++----------
>  .../amd/display/dc/dml2/display_mode_core.c   | 14 ++--
>  .../amd/display/dc/dml2/display_mode_util.c   | 12 +--
>  .../dc/dml2/dml21/dml21_translation_helper.c  | 10 +--
>  .../amd/display/dc/dml2/dml21/dml21_utils.c   |  8 +-
>  .../amd/display/dc/dml2/dml21/dml21_wrapper.c |  8 +-
>  .../lib_float_math.c                          |  4 +-
>  .../dc/dml2/dml21/src/inc/dml2_debug.c        |  2 +-
>  .../display/dc/dml2/dml2_dc_resource_mgmt.c   | 50 ++++++-------
>  .../gpu/drm/amd/display/dc/dml2/dml2_policy.c |  2 +-
>  .../display/dc/dml2/dml2_translation_helper.c | 10 +--
>  .../gpu/drm/amd/display/dc/dml2/dml2_utils.c  |  6 +-
>  .../drm/amd/display/dc/dml2/dml2_wrapper.c    | 10 +--
>  .../display/dc/dml2/dml_display_rq_dlg_calc.c | 62 ++++++++--------
>  .../amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c |  4 +-
>  .../drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c  |  8 +-
>  .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   |  4 +-
>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   |  4 +-
>  .../drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c  | 24 +++---
>  .../drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c  |  2 +-
>  .../amd/display/dc/dsc/dcn401/dcn401_dsc.c    |  4 +-
>  drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c |  2 +-
>  .../dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c  |  6 +-
>  .../hpo/dcn31/dcn31_hpo_dp_stream_encoder.c   |  4 +-
>  .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c  |  2 +-
>  .../display/dc/hubbub/dcn10/dcn10_hubbub.c    |  4 +-
>  .../display/dc/hubbub/dcn20/dcn20_hubbub.c    |  6 +-
>  .../display/dc/hubbub/dcn31/dcn31_hubbub.c    |  8 +-
>  .../display/dc/hubbub/dcn32/dcn32_hubbub.c    |  8 +-
>  .../display/dc/hubbub/dcn35/dcn35_hubbub.c    |  8 +-
>  .../display/dc/hubbub/dcn401/dcn401_hubbub.c  | 10 +--
>  .../amd/display/dc/hubp/dcn10/dcn10_hubp.c    |  4 +-
>  .../amd/display/dc/hubp/dcn20/dcn20_hubp.c    |  4 +-
>  .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  |  8 +-
>  .../amd/display/dc/hwss/dce110/dce110_hwseq.c |  8 +-
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  8 +-
>  .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 22 +++---
>  .../amd/display/dc/hwss/dcn201/dcn201_hwseq.c |  4 +-
>  .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 24 +++---
>  .../amd/display/dc/hwss/dcn31/dcn31_hwseq.c   |  4 +-
>  .../amd/display/dc/hwss/dcn314/dcn314_hwseq.c | 10 +--
>  .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 18 ++---
>  .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 10 +--
>  .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  6 +-
>  .../gpu/drm/amd/display/dc/irq/irq_service.c  |  4 +-
>  .../display/dc/link/accessories/link_dp_cts.c |  4 +-
>  .../amd/display/dc/link/hwss/link_hwss_dio.c  |  2 +-
>  .../amd/display/dc/link/hwss/link_hwss_dpia.c |  2 +-
>  .../drm/amd/display/dc/link/link_detection.c  |  4 +-
>  .../gpu/drm/amd/display/dc/link/link_dpms.c   | 26 +++----
>  .../dc/link/protocols/link_dp_capability.c    | 12 +--
>  .../display/dc/link/protocols/link_dp_phy.c   |  4 +-
>  .../dc/link/protocols/link_dp_training.c      | 14 ++--
>  .../link/protocols/link_dp_training_8b_10b.c  |  2 +-
>  .../dc/link/protocols/link_dp_training_dpia.c |  4 +-
>  .../link_dp_training_fixed_vs_pe_retimer.c    |  4 +-
>  .../amd/display/dc/link/protocols/link_dpcd.c |  2 +-
>  .../link/protocols/link_edp_panel_control.c   |  6 +-
>  .../amd/display/dc/link/protocols/link_hpd.c  |  2 +-
>  .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c  | 16 ++--
>  .../drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c  | 14 ++--
>  .../drm/amd/display/dc/opp/dcn20/dcn20_opp.c  |  2 +-
>  .../amd/display/dc/optc/dcn10/dcn10_optc.c    |  2 +-
>  .../amd/display/dc/optc/dcn20/dcn20_optc.c    |  2 +-
>  .../amd/display/dc/optc/dcn201/dcn201_optc.c  |  2 +-
>  .../amd/display/dc/optc/dcn30/dcn30_optc.c    |  2 +-
>  .../amd/display/dc/optc/dcn31/dcn31_optc.c    |  2 +-
>  .../amd/display/dc/optc/dcn35/dcn35_optc.c    |  2 +-
>  .../amd/display/dc/optc/dcn401/dcn401_optc.c  |  4 +-
>  drivers/gpu/drm/amd/display/dc/os_types.h     |  7 +-
>  .../dc/resource/dce100/dce100_resource.c      |  2 +-
>  .../dc/resource/dce110/dce110_resource.c      |  2 +-
>  .../dc/resource/dce112/dce112_resource.c      |  2 +-
>  .../dc/resource/dce120/dce120_resource.c      |  2 +-
>  .../dc/resource/dce80/dce80_resource.c        |  2 +-
>  .../dc/resource/dcn10/dcn10_resource.c        |  4 +-
>  .../dc/resource/dcn20/dcn20_resource.c        | 30 ++++----
>  .../dc/resource/dcn201/dcn201_resource.c      |  2 +-
>  .../dc/resource/dcn21/dcn21_resource.c        | 12 +--
>  .../dc/resource/dcn30/dcn30_resource.c        | 26 +++----
>  .../dc/resource/dcn31/dcn31_resource.c        |  4 +-
>  .../dc/resource/dcn314/dcn314_resource.c      |  2 +-
>  .../dc/resource/dcn315/dcn315_resource.c      |  4 +-
>  .../dc/resource/dcn316/dcn316_resource.c      |  6 +-
>  .../dc/resource/dcn32/dcn32_resource.c        | 20 ++---
>  .../dc/resource/dcn321/dcn321_resource.c      |  6 +-
>  .../dc/resource/dcn35/dcn35_resource.c        |  2 +-
>  .../dc/resource/dcn351/dcn351_resource.c      |  2 +-
>  .../dc/resource/dcn401/dcn401_resource.c      |  6 +-
>  drivers/gpu/drm/amd/display/dc/spl/dc_spl.c   | 12 +--
>  .../gpu/drm/amd/display/dc/spl/spl_debug.h    | 15 +++-
>  .../drm/amd/display/dc/spl/spl_fixpt31_32.c   | 32 ++++----
>  .../drm/amd/display/dc/spl/spl_fixpt31_32.h   | 12 +--
>  .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  4 +-
>  .../gpu/drm/amd/display/include/fixed31_32.h  | 12 +--
>  .../amd/display/modules/color/color_gamma.c   |  2 +-
>  .../amd/display/modules/freesync/freesync.c   |  4 +-
>  .../amd/display/modules/power/power_helpers.c |  8 +-
>  .../gpu/drm/amd/display/modules/vmid/vmid.c   |  2 +-
>  203 files changed, 961 insertions(+), 947 deletions(-)
> 

