Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B7F347B4;
	Mon, 13 Jan 2025 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782142; cv=fail; b=O23orZ9TAaraPTQNowKH+EANSm40DSZ5sNkTN+Dmg8jq3gFHoV4DomVUoD1ga7HHQ29hSEl/O5SH3j0490t1Iq1DGTg+v6o8Fd5s7Dn3j87y541a7uhyfMG5zCed4k2c1conKt4JJ8aNejrlRmdV5TkVJ9cD4EXzGpErn4llC/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782142; c=relaxed/simple;
	bh=e/AFcTY28TSvu7hM9G9E1dEDsI8YmpOATTIcXNF6JuA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t2qpfDdHdOyxF7UIs1WmcyD1a0h9IQ200S42KWOeURwH7pqSMRpadjl1u2iCb3aGgoUsbjASxwRAAc262VcthA1klHzv1Ap5I2S2FAs2hl+D/J25PPbbMGYpW/0VB4AYQ+QnTNvacpAjgU9zZOeP3tlJ+p/BTwMWfx+OKZVERDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1XKu4+38; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1XKu4+38"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4R5/3VO3Lej3tv24TXWTQDit7s49NG8T6jUHQKQvRVlW7xnC4OG5swYJz2EegkLzhSO2H0nhEvbpKGlE2ZE9QS0WGf/zZc+J75ZkvM7C8jqzNVvEGibwAI6cSJPOgPogCNfCKopobhG/ysfB4Q87TGfx1gkcoBrqyNoMqmTFYZuVK0A3czOTYEpl1jTWvfMr3DvNozW2wAg3AjmtZEeIcWGdMr+WRAaZ2GQFFpDBnZR4uCldrhdfwCncGxR+BW65Ir10+7Y2TsO/iSp1iCJa3EXrMB/WtVJ8mTy8WREvh+6I0oMpSTeGsySZ6gRNpvo2CadB3cAVcYpoCShWZSz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtRlJFS+kUOs5ZneDE5YjJHEUxuPuoDuxfYweFddvcY=;
 b=LUZAJRtIEsjoXuR8o8xQvdJ9TQoZmx4I3PXyTiHioFTcsoR6idM4FszO7XvpFphYJWvS6pMCWp8REzkeBwItPIJ+20eroQ5de7IZZydemOY8J8v0AVmZmDeILw//2BJ6r4JdWVHtcCAZCObSsJjBr6rYsyfLijkmXvs5Prrn58F4FkA6FOm6SZeqHCQoJpAYkLq7UZbFlPbpHOvScoUsL4V63PDb9UXteg9MHMtz6FJOtfM3SrnjroQvz7cOzhad3c0sJJbeswzxL865KRckRFkewfyLw5XoqhsmCz8t7qI2BFJ6/VgllQ1pt4pwcFyTVkDZ+5FDw29f7NwuMW7HBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtRlJFS+kUOs5ZneDE5YjJHEUxuPuoDuxfYweFddvcY=;
 b=1XKu4+38EGb/N2inPRCO++S9jVJbfTwgqJ1sazOolZ7/ay5Cvb4mY/MBTTH0Y7SvHZ4Unr4j0ga5lqxFREAOquYUtbx0wK+fUFjpQvQPXGrQ8/BEJkoYs0xskoJkKjVRYavMZHWdi156y0TVB/5d/mQUBWMZ6/61SPg0MazG8js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:28:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 15:28:56 +0000
Message-ID: <8876844c-8126-485d-8e5a-f984bda7241d@amd.com>
Date: Mon, 13 Jan 2025 10:28:52 -0500
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
 <21f4f72a-b27f-4389-b345-e1d9cf4c2f06@amd.com>
 <97d1f078-981d-ed10-7e6f-a9e177298b2e@loongson.cn>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <97d1f078-981d-ed10-7e6f-a9e177298b2e@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0225.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bffc35-afc4-43e5-751a-08dd33e6febe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlIxTUtPVloveVMwY3dtaVgzbG54Z3JxNm9HNHpEUU9SSWNyaWp3VVJGRlln?=
 =?utf-8?B?RGJNbitTYUc0WHRSS0hHTkFjaVBDQmQrTjdqa0JTUHBwQlowcVpzMEpmdk9M?=
 =?utf-8?B?azNvd2FudUx3VHg1d2Nob2MvSU9UdnNVQkhDSllNdlJiQm1OcG4xV1VWTlhM?=
 =?utf-8?B?T0NlTEw5QVUzMmk4VnRLc1c1bnN3Wjl5TUtGZzFzZG53ZkUyekVtOENGRksx?=
 =?utf-8?B?MUVybmt5Q1RvNTVFVCtjVVBycmVEZW43OStraytMQ3NTSEJmcGNwU282ellG?=
 =?utf-8?B?aVpWMG54blBCMUVMWlhUTUFDc0RZMUdWYi9FbG1SUTJRMFNIOXVKNnl1M0dt?=
 =?utf-8?B?MlgrTTBzMnFqdlJ1UXFLS2RtbGIwNTBIR3JuckFyRHdIWHQxdU9Ddk44NHRz?=
 =?utf-8?B?WnNZQ3RVaXhtekU1N2dnc2ZwSFFQekQ0REtCd1QwNUFPM3FjeExDZWl3ZERT?=
 =?utf-8?B?QkpGWmsvK2hwNmdaWjlBNXFESXBIK3VOdGpoRlF3QUhuU21xM0tCTGZyVloz?=
 =?utf-8?B?MXJDU1RJb0ZNMWJhd2daeFpGRlpqcVEwWitrMWg5L0ZXOHNLWFA3RTRneUtI?=
 =?utf-8?B?K29FT05TZXVNQWZyVExvVXVrN0VNYzZMdTVIK0lKMk9NOC84LzBaT3pLMjlS?=
 =?utf-8?B?QmRFN3N1UkFwQTdwb0FjY2EwSzJzNXY3OUI4M1lxNlFxcEdqTEN5QlczaEVW?=
 =?utf-8?B?MjNtVWlSV0w2RlVxVDg4Um54MUVac09yK2lUUnBSSTN2MHowRkRjN25kRTN3?=
 =?utf-8?B?SVNudEs1RUc0OTlUbzFrTkxwV1dkZ0pYWmN3dFdmT2VSZXFEQXc4VDBVeTQ1?=
 =?utf-8?B?SEtQMkVia0xVckZyNG15VHdiQ29BNkYwRnJnRGtpSWFIZ1RFeVJ6dGoySHZE?=
 =?utf-8?B?eEVwaEVzZWNnZEFQM2NINkpLSFFyVlhacHpUR1JjbkVKblU3eUkrczF5QnF3?=
 =?utf-8?B?VnlzYlhzQWlCTFZUcDM1M2UrdjJvUktmMXhNUlJoVU1kMkxYcFBFWUJNaU1K?=
 =?utf-8?B?eFJrK3NaaFUwc1d4SEVrYURhNnRpUGg3R3Z0L0hrK3gvYTd4NXpkZFQ0U21K?=
 =?utf-8?B?cEE2aVlVdW5OYTZPd1NWYlJTcWRaTDRZNjRrMzhwcEFvdHJjZWwvL2F3dS8y?=
 =?utf-8?B?VGgzSW1pYXZWUVR3ZGpsTHhRc0pGY0dheGhRbU0zNDQ2WVh3OWtHN1lhenVY?=
 =?utf-8?B?TzNXbTNpN3FXbjc0SzdMZk45MTMrZnk2NFFuaUJ6RVQ1K3pWRkNqY25OZ1lL?=
 =?utf-8?B?b2thNzJLT2ZDSHp5aVJmMmpqNGc1OTA4R2VUOUFEUWk4Tm5SZHBFUjg1d1pT?=
 =?utf-8?B?YVlyNFNjTjFqYzRUSTMrcGw2WUpoRUhEci9BLzd0K2dPeFhFL2gvYmtGWUJN?=
 =?utf-8?B?N01wTnRuaG9Dai9iVmVyamJJREJjQnpTWTgyVlBkQzVHckdoL2s3V2lyazV0?=
 =?utf-8?B?bjNKUktFMWdueklhZ0RjZDBPbGlKT1BOVEl4ait6QmwyWTNFd204VnY5REs4?=
 =?utf-8?B?T21HR1g1NEcvOTdyUk5FdWZXU3dWUHhtU1hkUC9nT2JlbGxDMkRteDNpQ3Bs?=
 =?utf-8?B?MU9BSDBrNjlrUFpzRW45WmhhdnAydE0yQ1c3WTZ6R1EwVkhrRjUyNXVOaDZ6?=
 =?utf-8?B?UTY2aVpYUzZ1eWZEWVhtVCtQemdNbFkxUGJGb3RtL0lmUm5wNUhCbEV0VWhD?=
 =?utf-8?B?L2c2SlBWbnRPWkNOanZOM05pQXdaSHUwa0pEcS9RcnpRWWZ4TGt3N3JXcU8x?=
 =?utf-8?B?YVdZQjFRaDZsL1gxMkRjN2oxc0VRQUVaQTFvUlArMVZCR0dhVk9pTzIxc2I1?=
 =?utf-8?B?MFUzWjFuaEp1UTM2UVhNbHZoZm10eXBvcmRJbTFkamVxWlI2bWhXcFFNQzR3?=
 =?utf-8?Q?dAdqfPbjTLsZe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5427.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1JibmNvTk9rWVRoNUptWFJ0K1FOVEMweWh2cEhxa2hraUFaNDZLVGdES0ph?=
 =?utf-8?B?ekVpaCt6WURCcllYMXhCdDRxeDVLQkhWUTJIT0ZyN0ZvZEp0eVhqVUlRa2x5?=
 =?utf-8?B?aDVVa0lHbUxucThrdE5vR1lwZ1VyQmNtTVBaZC9sSlNPWmhNeCtHWWdiOHla?=
 =?utf-8?B?V2xlU3BaaWZTMzkySTd1QnU2dnZCbVFwZDN2aTlqaWhNdTg0d3ExaXBRMW9I?=
 =?utf-8?B?UnNxWGpNWVoyd0x4ZXdQdUlPTTNXN3dQU2wweVdxanhETmhRa1Z0ZThjLzdI?=
 =?utf-8?B?eFEvOGI4YmUyUE41K1lBemkyKzNHSSt1MHB6K2xQd3hhWmttcHdLTVhyaisz?=
 =?utf-8?B?bldwS2xHanNKSmk2dE1MVldyc0g0bm53VXpXWDkxN3lnSkdnUlcwem1WbFQx?=
 =?utf-8?B?TFhJRTVTcVBYdUdZN2NrNkdoOUtlWlgzbkxEc0gyMmtGYTloQmhKMHBpNEdT?=
 =?utf-8?B?dnlNU3JNSlVrcmphN2MvNlZqdU02c1hydnJnMXhkMzcvR0hRUEltbXI1ZUpI?=
 =?utf-8?B?MzN4TnY3RVJmWldFZVRZbzduVllTdnRINFlqeFA4RDBuSDI1VU5RYnRDVEF6?=
 =?utf-8?B?c2ZhVW82WkdrVDZSUWt4NU80bExSUVhmdGo1M0pGeUlXS29OZnJFWERvb3or?=
 =?utf-8?B?dHlkYkZPN3EvRUFTSlFHZU9pbngwNmpCOHdmWXo5MWRzUHVqdkY1UXhJem9n?=
 =?utf-8?B?N3N0QXNaVVk3VXBJR0w1VVZuc3ZEd3lrQXdxMEtWbmlNRm9QaVlhYzZFbjZO?=
 =?utf-8?B?d1IveEw5NHJWUjFvL2FhL09sV3VPc0hUaFdNenZwNEpjMGw1SFdtK3dUUGlo?=
 =?utf-8?B?Qk91R3RkaHlKVzZqN1V0K0ViWWZPL0lPbHJNUi9ROG9HTE1uQStDV1RDY1JV?=
 =?utf-8?B?blJJK0N0QmNvOHN4Y1FaTjIvS3MxTUdLU21jY0NEZEQ5RXRZVThVemxnU1Fw?=
 =?utf-8?B?bEUvS25raDFncjlQTTRuOWxYTTNqK3NHVC95Vmt1cHEyKzFjNG5peFBaU09v?=
 =?utf-8?B?U0d6bjhBRUd2WXF0YktuUlNRQ004Qm1jRnZTMndnS0xsdWJyZkZ5ZStweW4v?=
 =?utf-8?B?NFFaNDJjWEd5RUNkRjZ2bVdOd2hhajJSMEFXTUVHNVVKeGZINGJXRDlBbVY0?=
 =?utf-8?B?b2hRc0lLVk9vVkZQeDl3NWJZbTIxdEloZ1h6TWRnMHkvcjRnSTFkcGhDa0xi?=
 =?utf-8?B?dThDMXNWZ28zSDQwK1hITWJzVnRmZFJoeTVEZU5sUVF2dDFsYjR5UlNUQk51?=
 =?utf-8?B?dmE2TURSSm04L0hMS2tiL2Jaby91SlVIRzZ1UU9EUmNTZjg0bEpKVkZ5N0x6?=
 =?utf-8?B?Qk9hSWhzMlV6Sm16S1ozOW1DUkNONkcvc0cvQlh1cjc1VVFtOStBeDZiVHBq?=
 =?utf-8?B?MlptaEd5aTUwTElQalFzQ0Vwd2xoc3FSbFV4MGlxZXNqbXFBSFVSL0R6QUJY?=
 =?utf-8?B?T204dFBLb3Vxa252d1JRYkNqN2xacXJndm5jbzVvRk9QM2p2YlBUWWw5eUpR?=
 =?utf-8?B?YU83Szg4WDFSdG5TMHlqOWFUY2Qzc1FTdEJDUVRmMCswSlBXem1VV09tZ3Zk?=
 =?utf-8?B?RFBxUWtZeGNQMFNJTUZvYzFEczRvZWFWWG9CTjVQS0Q0YWdTdVk4TjJwb2Nz?=
 =?utf-8?B?T3dLNzRUOVJkNDdxL0Zhd2tZTEl0aTQ5UURFdkJWS2pad05uN2xtZXMvOWx0?=
 =?utf-8?B?R3pJNTZ3Wmt0UituaWJQNG1LSmZYMUVNOXE1eFNZQ25KWEZnUkRla2hCaXNr?=
 =?utf-8?B?aW9WcTJMZWdUSmtndWRkTUFtdU9lV00yMXNPaGhKTHF6SXNyUlMwT3pOdzBm?=
 =?utf-8?B?bUJKNVV6THZVTlp3Ymp6NGdWeXlZT2Y0ZHMxaWpxMGhnZGxBcDlIY1BuaGIz?=
 =?utf-8?B?SUo5dmkraXNET0xLcDk0cWY3UHZnZzIxZnN5dmxXajNqMENBa0UybXZnZFlM?=
 =?utf-8?B?UE4weFdSRk1aWFdESFZxTVQzMU5RdElqYVVTdzdkczF5ZHNTM2Yzek9hRkU5?=
 =?utf-8?B?T0pYUEdIYXFFR1JicmFOOGpaekJlUjFXbVI0cmdVeXk5VFFJci8rSUNsY2g0?=
 =?utf-8?B?RDN1aERyM0JNNzVhdVVhbDNnV2YzTzE0THBQTE9lRk1NT09vQXd2ZHM3UWpu?=
 =?utf-8?Q?s/qdq9Bb0qYhkwaTNjT0+mNo7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bffc35-afc4-43e5-751a-08dd33e6febe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:28:56.7392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwXKit6JmxccNGhO1JAPVcndyumZnlWBs9lVWM6jOmE3+ssRcEsc1bEeT5dj1HDpy8Cfxd1EXgOauGOH9RpZbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071



On 2025-01-11 02:03, Tiezhu Yang wrote:
> On 01/11/2025 05:45 AM, Harry Wentland wrote:
>> On 2025-01-06 03:57, Tiezhu Yang wrote:
>>> As far as I can tell, with the current existing macro definitions, there
>>> is no better way to do the minimal and proper changes to stop the control
>>> flow if the divisior is zero.
>>>
>>> In order to keep the current ability for the aim of debugging and avoid
>>> printing the warning message twice, it is better to only use ASSERT_BUG()
>>> and SPL_ASSERT_BUG() directly after doing the following four steps:
>>>
>>> (1) Replace ASSERT() with ASSERT_WARN()
>>> (2) Replace SPL_ASSERT() with SPL_ASSERT_WARN()
>>> (3) Add ASSERT_BUG() macro definition
>>> (4) Add SPL_ASSERT_BUG() macro definition
>>>
>>
>> Patches 1-4 create lots of churn across the whole driver for little
>> immediate benefit. We should be able to do patch 5 without requiring
>> all that churn.
> 
> Do you mean to drop the first 4 patches and only do the following
> simple changes to replace the current ASSERT() and SPL_ASSERT() with
> BUG_ON() directly without considering the aim of debugging? Something
> like this:
> 
> --- >8 ---
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> index 88d3f9d7dd55..ec6b194fb093 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> @@ -51,7 +51,7 @@ static inline unsigned long long complete_integer_division_u64(
>  {
>         unsigned long long result;
> 
> -       ASSERT(divisor);
> +       BUG_ON(divisor);
> 
>         result = div64_u64_rem(dividend, divisor, remainder);
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
> index 131f1e3949d3..a91dbd076d13 100644
> --- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
> @@ -29,7 +29,7 @@ static inline unsigned long long spl_complete_integer_division_u64(
>  {
>         unsigned long long result;
> 
> -       SPL_ASSERT(divisor);
> +       BUG_ON(divisor);
> 
>         result = spl_div64_u64_rem(dividend, divisor, remainder);
> 
> or keep the ASSERT() and SPL_ASSERT() definitions as is, just add
> ASSERT_BUG() and SPL_ASSERT_BUG() definitions, then replace the
> current ASSERT() and SPL_ASSERT() for the two places, that is to
> say, drop the first 2 patches and squash the last 3 patches to one
> single patch?


I think the second one is better, so drop 1-2 and keep 3-5, basically.
It's fine to keep 3-5 as separate patches or squash. I'm happy either
way.

Thanks,
Harry

> 
> Thanks,
> Tiezhu
> 

