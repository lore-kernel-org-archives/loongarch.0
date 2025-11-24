Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010007.outbound.protection.outlook.com [52.101.193.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F057E571;
	Mon, 24 Nov 2025 05:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763963616; cv=fail; b=CH3JbbHhiv8VgNoGkg//Qga9d84I3U3qUw/03hyq9dVsfboaBELLCcK7TIDZAWG6lCO7vJy4xev9fVfF71dEMXO0ifZStWz6DENAV+aTJC/jW35sR5PgIQSkDLPGYENvqjS1KPtmcLKToPC+ftWlur3oSCWLY+C80v4su7Tu6x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763963616; c=relaxed/simple;
	bh=CBSyh4WE6i0R0PI93ijdBEDkpL57tAzn3UcM5G4E9Rg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZUOhznUzNgY+WnGS86VXsc0aOVL/nXa1VkVtfDaPEdbyTsqWtFLV3Cc4B2t0w8YEhPQokvlL97JccHCdqzXIRNn9QLso6nH6EpCtEUuTEb3rEHZosCKJ3AcZvYSkVbXqlJJPKUwvD7+XM/MA12Vv9M5yHjUHJpiJmaQxEhRFrn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oOBieRPx; arc=fail smtp.client-ip=52.101.193.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oOBieRPx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqcqKc2S0zMxg0wQx8s6b8oq4TeUiC4QhEksSsvsKDRDviPyBqX28xfQQoAF6JjO3UCuz7AZGYzYr4KBqiPQcnAih5YMvyOqPziZcZM+CXibij1MRITpq9yzOmQ82/USVp0zzDWzz9LyGEnqsd4flV6bmpBFDbsTfCxMwPblu53CJQYaf/Usd8nIb7zjDbTNrwi0+LHzG1LJHxjRO5ieFMKx03CdbuKP41kmCRJoK+uotUSaLitVkBSa3/sqZrT+cazHFwxQv2tO73Zhv5AoLfD1zD1ZqbyGYbg4TE+YX78KaVk4N5/TrfvO7DSZCNLI/m/vmkqqsRMyVQBuznHXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C8SzJmJ8JsYwes7CATXTwC1TAyUKbZqh0f/opzH9Aw=;
 b=asXrVBsgDEqUGNEgoPka6XFUb5ZBsigNHWE+E4xlva8j2IFUQbvJge0oeXfjOcwsc+fhSZ7qN+cX+gJ1iDJzQqx58515g/HBjC84mCRRH3WmkQbtRcouIHNRocLaT2L4WXE+nvLOGiuIbHriPW65+n17/mY7EOXhLH8yWpncMQrWTiYpyjVNIDv6SERQbJZgTJ2Qcjkj5D320wkH4RKNzNRYp5hosVJUQHEN5NTsqi/YDi5Em9dIDMvr1hEoRWg0q0EyYdZxcp7fz0LyX86Cj+bzjk7nWuK6gTDTjHGIQtw/sLPqVphZ4jqNy1bcqKrvzvyI5J+nO6JW6ZAxPlpchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3C8SzJmJ8JsYwes7CATXTwC1TAyUKbZqh0f/opzH9Aw=;
 b=oOBieRPxgmUE6aZ4GtpZpbvCIfNKT0EXQW2wSan86l8ZS8JYGZZ7QPUImCVcdsFI7Q7DZQ74E3ZhdRzyLXUsg8HYiArWQ9EvFBnA8k0xxLAiNRCwHpQlRFAjCSptEopELe3uG6hqhIX4l5A6YJTwIaD8xuCSeAbJZTKQdsdzSvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7458.namprd12.prod.outlook.com (2603:10b6:a03:48d::13)
 by SJ5PPF0170DF9F2.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::985) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Mon, 24 Nov
 2025 05:53:31 +0000
Received: from SJ0PR12MB7458.namprd12.prod.outlook.com
 ([fe80::83e7:e6cf:26ed:2f3d]) by SJ0PR12MB7458.namprd12.prod.outlook.com
 ([fe80::83e7:e6cf:26ed:2f3d%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 05:53:31 +0000
Message-ID: <30d886b1-510b-4d65-a3bb-8c49a1c4a3a4@amd.com>
Date: Mon, 24 Nov 2025 11:23:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 2198/11041]
 arch/loongarch/kernel/switch.S:28:18: error: operand must be a symbol with
 modifier (e.g. %pc_lo12) or an integer in the range
To: kernel test robot <lkp@intel.com>, chenhuacai@kernel.org,
 kernel@xen0n.name
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <202511240656.0NaPcJs1-lkp@intel.com>
Content-Language: en-US
From: "Garg, Shivank" <shivankg@amd.com>
In-Reply-To: <202511240656.0NaPcJs1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To SJ0PR12MB7458.namprd12.prod.outlook.com
 (2603:10b6:a03:48d::13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7458:EE_|SJ5PPF0170DF9F2:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c6e21d-28d8-4c5d-ba4c-08de2b1dcc14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnRRVUYyV2NuSDNwOCtVbEtGMzdENTVaSXE4UFVGZ3hCdkxLNDdRTXdMNmZv?=
 =?utf-8?B?UGdXZXliWi9PdDZ5eVdwSGd0UjRyQ2ZsM0hxcTkyM2ZXY2hnc0ZrTG1ycngz?=
 =?utf-8?B?QjJpMlZPUnFhaFRXei9ieE15VkdrdElxQ3BETXRVM2RUc1RSeXUwZWd2YnFH?=
 =?utf-8?B?b0ZEY29ZdW9qd2xHRU9ReWtjM3R5dTBabmdSWUpEdDhoMUROVWhIWnEzZmVw?=
 =?utf-8?B?YnIyZm42bGdmdEJ1SWVSclhoUXNQYVJTenhNSm9VQXBNamp2eC9tWktlSm1h?=
 =?utf-8?B?UGU1blJIYmRlUm83c3UxUTZMblEybU8zbzlBR1FnSlpxOVRidHNSOWk3M0Ju?=
 =?utf-8?B?WXNIUkUrQVAzYXZjL0hNUFZjeGxZVytTdVZ0YkRwc3NqTndwSjE4UVJWMUF6?=
 =?utf-8?B?ODVwVkVrdHozUDAvd0ZiNi85VjBJTmxsOU90NDJPRFI5Y3lYamhOMWZGR3ZQ?=
 =?utf-8?B?S1RSMHlFbktjK25iMTA1VzFrWms3TmNQa2JhUEZvVnRqQzRaaU9Nd1NESHZ6?=
 =?utf-8?B?ZTZUalEzbVpjYnpnaWs3TFVrQ1JwN3p5dzFSYmFBM212c0pESGFaUWNLS3Vo?=
 =?utf-8?B?ZUFxZDlRekd5Z0JCYnQzcXRMRTZpeVREZmpXRHhmVVJDWjlQbHRqQW1vR0V1?=
 =?utf-8?B?RUgrckRtNVI2TWF1anI1Ly9qNUtERWZPY1QzbXhMMEtGTDFCTlRTUmxHUzhD?=
 =?utf-8?B?ZWhxN0g0Y1pYUkQwZHZZbXVFazhYd0hvekxNQTl0QXNEOXRCbWpta2pienFJ?=
 =?utf-8?B?aEM0L3JlTEpPQVJMVEx4N3dnRGtRRzMxRHFlWitSMVdBaEdlZ2FwQ1NNQ09k?=
 =?utf-8?B?bm1OdTU3ZmJpNGtSTlF6Wk8yQXFBbURWUktJVGRkRXYxcGRJSHBGazM5OEZs?=
 =?utf-8?B?bXBBbkRCM1dJdzNZSyt0ZUFYaEwwSU9YNVdlaWxzbUNVSHJqMHNHWTRwRlpT?=
 =?utf-8?B?NHdzbDVQU3JyQWhxbk54VVQ5NFhVWEhEenh1RithUnllZGJuQ2J5R0ZLYXBv?=
 =?utf-8?B?ekM4U2R2elFxVmpGRjM4empVS0F0cHlXVGUrSDNmQnQ1cTd4VVZJT1ptZ21U?=
 =?utf-8?B?RFhKYXdpZHFLcGRGWDU0NnBsNnBPOTduZXZoZnB6Y1ZMNkRpeDNiL1IxVFhm?=
 =?utf-8?B?c004a0lHdEV6T0s4T3Y3aXMrTUhwdHhPbThpeUNCN3E3RlQ2ZjhEREl6MG5I?=
 =?utf-8?B?V2ZETEtnUlF5WjdOdG51NVdFVEVmeEZXYUY5dExYTjc1VFNlTzV2cHo1TEVE?=
 =?utf-8?B?dWRWN04xZEFFd0pPYUpyTjZXeVozV3FGOUlTTFAydVVBVjcrbnRoajhQREUr?=
 =?utf-8?B?Q2ZwVmU5YjVoeTMwV3lYUnVLVHRkV0tRTlNYQnQ2UEhZRXc0b2VKRDMwYUpW?=
 =?utf-8?B?M21OTWthR1pJZHQza2dFem5JdTVhK2hDRGE3WUZFVXV6OHRMSDlWZU9JaFpI?=
 =?utf-8?B?K0hBV3VRN2RUcnVFZkw4Zys0MFd6SG9ERVFQa1JPVjJON0I4SUg1bEoyYjR6?=
 =?utf-8?B?RWlhZjNGdmhJZFJ1VGZ3b3B2T1FJWDlWUkQ1b0VQM2hRUWU4dUE3SHBNdzBJ?=
 =?utf-8?B?eTdFazg3V3R2SE4xb3NSYjB2L3BLamxvWTBjUEkwdGFERUpFclVFSVBPckk5?=
 =?utf-8?B?anVTc2RVWEMrTHVMYTFsT3FFcXpIUmhqbmFDZ1Rzb1hmOUdhMEFOVTQ3dDRO?=
 =?utf-8?B?aFp0RkpkdFVpdjdvSGFhaU9laGV6VVVOWXBLZmFGTWhGLzNZalE5TS9ubDlJ?=
 =?utf-8?B?ejEwZGE1R3JtaDUwUWlQa0E1L1hOQXloTnNuK0wzbDlWTGhndklRNzNMV2Nx?=
 =?utf-8?B?V3F1OXl2d0MyUHRZNXRONlZjOWJOenFkTDlXb28rcGFBOHJvNms3R3lDeEFI?=
 =?utf-8?B?OFBXUWE4WHB0UVZxMVhpNndKWENZMmxSeGNQb0w3MFZSQmwvT1BsMUNiZFAw?=
 =?utf-8?B?WXNNNC9MbXNTVXdURnlxTEZWR2ttMzN2Y1dabGJOTnFkSWZ0Y0dWS1FWSkp1?=
 =?utf-8?B?RTdYSFplcWxRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3J5SFBmRUVOY3FwdHplUlh5bDNmck1USENpc2EyUVZiMEVPREhlaTFLbDl2?=
 =?utf-8?B?akt5R1d6eTZ3SlZzRUdGNkdqVmt6RENPSVJDejlrOWdEQWw4YmRod3l6TlhK?=
 =?utf-8?B?dUc4WEVweWtOM0Q0TGprVnJZaExCRFpYcloxa2xxR0JpbXVuOWlMNSs2VWww?=
 =?utf-8?B?VEhGQWl6OHFiREZnTEZscHhBNjNET2xnVDJHVVo5czVzUklSWTRYZ0RWVHF3?=
 =?utf-8?B?dGQwbWF5aVUwSGxBS3AvWk9DRndUQjkxamxITW5TRGo4d2RIenN6Rm83OVdi?=
 =?utf-8?B?MnVWZnlQSzdORElhVkpCUGxldDRmWWVXSXJhNWlOVGRNUldZU0l6b2ZrWEY1?=
 =?utf-8?B?Qld3eVRjb3JKeTJSdnZ6QytZZ3UvUGlIWWRQdVNDeHd4M2VPK2h3V1pVZkwz?=
 =?utf-8?B?ZlJnbGkwZlVJeldBNnM0Z0tWWmRJeU80QVBhZGQwL3ZpbCtvb0ZqTTkvQjhU?=
 =?utf-8?B?V1hMRG1SRHhPclI4NnUxUFU1ME01eXZoZk1ZWXhUTkN2RUNwTnlWQXNZa1dx?=
 =?utf-8?B?UnJZSjYrVlNBRGxkemFXZEQyUkxoQkhrWm5XTllwbzJxN2dDZGVTZmx0WXFG?=
 =?utf-8?B?QnR5QnZEbHI3Q1p5M2NIZkF4OHhOOEN1ZUpnUW9mQ2xqNkt3WGJCSkc1Ym1q?=
 =?utf-8?B?U1c4YW5pbU1ncmlaWFJPUjN4Q2lrSFhZeWdIRDBvcE9heDNPekd3RVVjaTgv?=
 =?utf-8?B?R0d0RmYvRzAzUVR0aGNpN2Vya2lER3JPd29xa2o4VXlBZVJUTUthVG9WUVlK?=
 =?utf-8?B?Z2Y2cHJ0UTJPUUtZM0YzUmlMY3Uzc3d6WkJWZG5QT0NlRW4xWVMvNk9EWnBB?=
 =?utf-8?B?RjJRSHF0QXFOUk5YREVTOXl5SUczRE10ZlhxemIzUWc5ekZraW9vNENwR3Bi?=
 =?utf-8?B?aGYvWE5FNGxWUVZZRGc4SE94TS9qRm5ER0F3dU1takxUYnA3UmtsMWhpT0VV?=
 =?utf-8?B?UVBHckhFWnovYVZYQmExbVlqcWZlT0wwR2c2YVNlL1FQaldCRG5lN1dUanBv?=
 =?utf-8?B?QVVGSnIyY2VGaDlDRmYrMzF5eVFRci91SkJ0dzZNY0tBendvbXRrZi9zSjU3?=
 =?utf-8?B?MythOUF2eWdTdFE3ejlYQzV2bFVFZkt0N2RwU1JsM3dQQVJZVnE2TTZtb3Bs?=
 =?utf-8?B?U2RUWTczT0dpTnNIZ1lYa0UzWDVvM0ROVFZsWjN5T0hhTENUOEM5WmV6MXhQ?=
 =?utf-8?B?VHFhbGw3ck5xeTkyeFlrd0xnZTl0amIvaGtLTlh2RGVIaE9qa3IxOEpaeW5z?=
 =?utf-8?B?Q29qcm1UenNhcXBmVi9FdTJBZlJKU2VKRmczaTRicExFWnBrd3pia2tMS0ls?=
 =?utf-8?B?RkxNSGhMNVJFaGtpUFkzL0laaVExZzhGQkdoRkFHaTBVMVdwY3dSVDhITE9W?=
 =?utf-8?B?eDF6WGE0Ulc5QzFlek8rMjdrS0d2ZVpYbVZ2bzRxQmNZZi9sRTZ2Q1dNVEl6?=
 =?utf-8?B?RmxnRUVaN0JVVTByd1pidDNXb1psdldwOWNpQjR1YlRvZkVLZlp6U3prRWZC?=
 =?utf-8?B?dXU4WkM5aVdoSTRhZTZjaHVOSGk2SkJsYXV3RjJHL3Y1M2FJeVNUalBpR1dG?=
 =?utf-8?B?TVJpOWdqSVVMbHZxcVlXOFRJTDhaZVVNYnYveCtkcGJuRkFFN0xWR0EydFNt?=
 =?utf-8?B?ZFJNQmlDd1RpcEVCUlN0R0tqWHpaUURzajNjYlNRWFFnRDdqVUFBcHk5R1hS?=
 =?utf-8?B?NVdSck1ndVBTeUFtVkJjNm44cTlUbWY2L1pQSFd3c0FuYVRkYzFwRjYwNUMz?=
 =?utf-8?B?cTMzRVFJQ2tkL0tVeCtYOHdYUDNEZFJ3OXNhTzc5dmhJTE93ZEZLNUNpdDJ6?=
 =?utf-8?B?OG5LV0dpUm9RaDZjenl1QkM2ZmNtanFuZ0x4eWF1QWMrK3cvdlhZaWc5RDRi?=
 =?utf-8?B?MWhKU1ROSDlUdENDcHlMRnAraVBrS0tUMXE2OTBhTnBTTWNURENEWVJoSVcr?=
 =?utf-8?B?UStHRWJCZkppdnlyK3lVYi9hTlRtUmF6V2QwVlFISExwMGxVeHdmOWFTOWRN?=
 =?utf-8?B?NXVZVzhybjRsa0RMSytZMkhFVkFXdFM1SXl4cm9oYW5lZndLenZwYWpoR3Iv?=
 =?utf-8?B?ekdUQ2U2SDVtUnRhRmxtR3dnakl5NUZoWUpMT3ZOU2dZWGwzVTZqc3A4QUtm?=
 =?utf-8?Q?NwzN9Tb17vbcyz/2ooLsL9WYG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c6e21d-28d8-4c5d-ba4c-08de2b1dcc14
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 05:53:31.4078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK75i+jBs9sDuJIiS3uI9OXbTD3KmlTnYAV0MT0eJ/VtAMcyPZ29jDPaqvd7/Jyl9c9RoRWGEn0pqfiLNXoGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0170DF9F2



On 11/24/2025 4:27 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
> commit: f634f10809ec3d51d9529dfb0f99bc7cec1b5eff [2198/11041] mm/mempolicy: Export memory policy symbols
> config: loongarch-randconfig-r051-20251123 (https://download.01.org/0day-ci/archive/20251124/202511240656.0NaPcJs1-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511240656.0NaPcJs1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511240656.0NaPcJs1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> arch/loongarch/kernel/switch.S:28:18: error: operand must be a symbol with modifier (e.g. %pc_lo12) or an integer in the range [-2048, 2047]
>     ld.d $r20, $r5, 3808
>                     ^
> 
> 
> vim +28 arch/loongarch/kernel/switch.S
> 
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  12  
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  13  /*
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  14   * task_struct *__switch_to(task_struct *prev, task_struct *next,
> 613d4164f5a503 Huacai Chen 2025-01-25  15   *			    struct thread_info *next_ti, void *sched_ra, void *sched_cfa)
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  16   */
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  17  	.align	5
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  18  SYM_FUNC_START(__switch_to)
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  19  	csrrd	t1, LOONGARCH_CSR_PRMD
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  20  	stptr.d	t1, a0, THREAD_CSRPRMD
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  21  
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  22  	cpu_save_nonscratch a0
> 803b0fc5c3f2ba Huacai Chen 2022-05-31  23  	stptr.d	ra, a0, THREAD_REG01
> 93a4fa622eb061 Qing Zhang  2022-08-06  24  	stptr.d a3, a0, THREAD_SCHED_RA
> 93a4fa622eb061 Qing Zhang  2022-08-06  25  	stptr.d a4, a0, THREAD_SCHED_CFA
> 09f33601bf940f Huacai Chen 2022-12-10  26  #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_SMP)
> 09f33601bf940f Huacai Chen 2022-12-10  27  	la	t7, __stack_chk_guard
> 09f33601bf940f Huacai Chen 2022-12-10 @28  	LONG_L	t8, a1, TASK_STACK_CANARY
> 
> :::::: The code at line 28 was first introduced by commit
> :::::: 09f33601bf940f955c10a6e75a1c1b7bcadee5e2 LoongArch: Add basic STACKPROTECTOR support
> 
> :::::: TO: Huacai Chen <chenhuacai@loongson.cn>
> :::::: CC: Huacai Chen <chenhuacai@loongson.cn>
> 
Hi,

This appears unrelated to the commit and looks like LoongArch assembly issue.

CC: LoongArch maintainers.

Thanks,
Shivank
