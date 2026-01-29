Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010023.outbound.protection.outlook.com [52.101.193.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4F35294A
	for <loongarch@lists.linux.dev>; Thu, 29 Jan 2026 17:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708055; cv=fail; b=d4v03Tb+q7Hb4QrE/8aZcKM2qczq+7d/geAJEIzxi8/Nph63NsZzBDXh2Gbz8n9Sy2lf0VBV6E/dX9ab1WTyuDkoIv4M9FwLYyAHArewAAgu+nJ7fV9wTbzNQjK6SCTDVI9MlETgSnq8Fc5mU+3gsQXrB0xeYNkY/zpnK4UYYQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708055; c=relaxed/simple;
	bh=LboKG1WEHHD731m7fZKp6vsSuZHoRVqVW/gx5uwDZlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GM+5vuusZuZZKOPLXTcmVeuqAjQgKIIFJ0h77skfE50HfsmzI62e5Hx5LfccgsbXMpczZ8lSclG/rpJMvo7v0FulnFtUg/yGU9umZE+aDTOx+KFzMn7NkJfXs/+MyCwcz3pmYI2qvHvp0GZfRoRefa/ccPhLVzhscWom6Ee8TyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GIpto3lH; arc=fail smtp.client-ip=52.101.193.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GIpto3lH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PybcIhY44GT57FPKBoSZbvwzJd7YI9AwN5iiY1+6qyoOGcxjbq63I8nzuPXjGgRs5PnUQR1ao6YDiQ71jDtLzQUQyg4K6FUgDDfxLa8mkbGCSFsCCpFBi2/THZTONtRPw2WgKskfPCYSXUkbkncq7UZg9alJOF6KPGgK2LXKCriPAVKIaiOrOQw0HPDeU7zOm820pqSovCd0/I5xXHjEV/J7ErGRUoY8NsM8qVO10zK8iH2U8ypVy6kumDKFxQyM8YzTBRju4U0ltb8/InxTQneQcixV5Ch+GZTl11rIddiBEJxGB4TdBQl5IrGpUGEIlEtJ9PsV43oQnWub1v3bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33mFldFH6tQKQ85YA5+paGbbDtgN7O9wPgOC0TcXfmc=;
 b=fes4ZPmHW1frtF4vF+C2EvYb/pOSnWpJaygmD++DM3hRUtNjMJhiD+Og3ra/XGLGN5AncKqzdiGWfFzVdqcGbps4R7hTc4f+hJHHNScRUTjuExt1nQqpAa6Hlayw4POntzLevjiF5dxtbsF46MXbtWKvxNP/brHTo+n5CvwOWL98k/4BdBKYH6ZUI7rnjvNVaeeNt6AdLQeT5HYf2aoE0eQAR6cP58w75+q6j0JqeS0roE24ZKVzh6apjYcEKEo46fyjJQByq5TlwYf/si7hf3A5qZ+mvLvCJz6V7Uzhx7RwQRU5HQfBvetvUDkDLL6ZejAbsTLRDcen1qhp77z+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33mFldFH6tQKQ85YA5+paGbbDtgN7O9wPgOC0TcXfmc=;
 b=GIpto3lHvXnlX4ughmMAJHPNu2FF0RBQyoIII+KdNNAy9m6YoC17f/T5Iv7BNbHAqLc9kmq0cl9tn78at6M0kl81WDRYL6ouZiwHOW26B5q4rDEh3KWIhaYZpwG6PLYVzRPlY8YJ5JLPwkYaIwON6GCYvBONwveiQnxp/J/zbCkFA5Faq5s+5vb9X/JlsIe24SYaOvNAf8fKnGkwvO5YCSWjxbzhCK8JbymzaXDUJii+2orfSXnWDqZLNzDaveBu+MdkeMPO9Sp1hThCscKyptQKKf2trLI2e4EsYFJgvS45nAOkc0qYONBTtTGYeCHqOn4esWxuZQVDIgAAuMH2cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 17:34:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 17:34:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv5 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
Date: Thu, 29 Jan 2026 12:33:57 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <E529EDD1-0FA0-490B-B2D0-57541FDC2879@nvidia.com>
In-Reply-To: <8CDE3AB8-EF51-4D53-A1D2-6084A7613E9A@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
 <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
 <1A08D224-E1AC-4FE5-B1D0-1BAE2D5FF31E@linux.dev>
 <5AFAE2FC-7274-4A23-AE92-797D5B69AA8B@nvidia.com>
 <8CDE3AB8-EF51-4D53-A1D2-6084A7613E9A@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 803e18af-2968-42a8-4dcc-08de5f5c98fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0k4Z1VMQXpMNGtDbFN4WGNJS1AyTEpkZGVwTDZMOXY2dEE0TndSaWxBaUJC?=
 =?utf-8?B?VzBtSGM1VHBNZTFkbW5TaGZaTzZabkI3L29GaGNvNnBCNG9mU3VKekE2ZnpE?=
 =?utf-8?B?RFJFRDdGUDZGVCtQRCswZ1plZlFpYm4yd28wSkFyOTJlbldwa0FFaTdRMm5z?=
 =?utf-8?B?dVAwNWRWMkptcjZLc3R1NExZbUk1N2tCdVFmSWtSV24wRFgwZUJDcHVBZjcw?=
 =?utf-8?B?ZUg4dGtRMndhYzFYb3ZzU0ZmQ0JPUE5zNThtd2ZrR0RadzJaNGdLVlRnbHQr?=
 =?utf-8?B?eVhLREpzWnZFMDFrWG85LzJKYThUbDNmZlNKRitMQzg3SjJUYlJsYmdiR2hs?=
 =?utf-8?B?dERiS2FjS2s4WWdwTFl2N1hnZU5URy9HdVN2eWVCeVlUVUJSN1ZpeG1FZUZ0?=
 =?utf-8?B?aW5NcCs0bzhVa29zUWtjcXlTRmxmRmYrb21nTDNZM3JXdU9UMFBKdE5hckhR?=
 =?utf-8?B?bFZpQVdyek4yZnJoaVdIUk92TjJuUjJDUzUvYjlEZ3RGcmdSOWwyUWI4SHdM?=
 =?utf-8?B?UUhYN1RneHhWZDFrMXJveVY0bXA1Qi9PVmhPbEZzQThLZm9EU1hCMURPaWUz?=
 =?utf-8?B?dmNkME9jbVNXQkpvZFNtMEZ4a0psblR4TVNBOW5PSldkeTFrSWUvc1AxT2s1?=
 =?utf-8?B?NGVNN1h4NTc5VXlYcFloeStVcklvZk1mbXB1SnlvenpPTC9aTmR6UlBIQ0N4?=
 =?utf-8?B?TXBkZVZJK0dFN21QUC9wQm01cnhab3RXQTlLLzVEYVFVaTAyVzdaMm4wWXdw?=
 =?utf-8?B?WXZvdjNsTFJZWjNpRWJmTkEvdWZEaUl1VG9KcEZBYzhJYjhZUzZ5UVdvaSsr?=
 =?utf-8?B?cEgrT1NpaXBkUmp4Sk1oK3RLcnA5TzM3bm9PZnJWVzRJalNId0N6MFgydW9p?=
 =?utf-8?B?Z29ucy9sN25GdTBIRVZTV3JPd2xZbDU3eDdSR2pXREg5Zy9jc2FJUzBoZGZs?=
 =?utf-8?B?eUQ4WDlsSEY1aXd6ZmdvWUVuUG5rWlczL3FLck1ZUCtqSDNDZHV0cHR6YVhC?=
 =?utf-8?B?V3l2WmU4VGdOa1FQcVg2amFSSmY4a295QithV0wxbWFtOS9jck85Vy95R1Jj?=
 =?utf-8?B?UTNuem4ySURZZzNpT0pINnBLZXN0dUdPcGJET3pwb3RHYk5FOTgraXVWVVI5?=
 =?utf-8?B?UkFGZFRFT3p0Q1ZmWUFoZE9aZlBITTllWnVWM25HelJVbGIzTXJPeXZWbmh2?=
 =?utf-8?B?WXJtdzM4UjM4M1J2QTNPcldyV29PVWNYcUpVdlpNZDA5K29xQlBlZFVmVGt2?=
 =?utf-8?B?UUVCSWJIOTh3R0l0RFlHMmNtVkpGTmh4Z2FVQTdIZTBRbmpCVmZSSWtSY2NO?=
 =?utf-8?B?ejh6bEdyc3hGMVRlTzgwaUl1bmV3L204TlFVbmFpb1JGZUlQMllCeG13NE1t?=
 =?utf-8?B?L1diMUpKU2EvUFBWc1VaUkU0cEd3N3NTaTBrOEtOcUd4VlhMRFFBU1Z4dC9t?=
 =?utf-8?B?dm9jQ3VVVUg5MCtpeEhiSXEvOVVTRGkwZVBzSkd5WUtRV3VsTEs2MVZLN0Vv?=
 =?utf-8?B?S2g1VmszRGhoZmFCWnVwL0FLbUpTeDJDMDdJNHdJWk1nOUVDVnQrelBrT3dx?=
 =?utf-8?B?eXVBZFVRd2pLMWpxK1JqdnpSUThwcklBTnhyc0k0MHR3SEhhek5PY09LcnVB?=
 =?utf-8?B?Yk4velBTV0Q4OFp5WCtFb2FZTlhGOGV0NGRpT0ZjUklSWGRZOVR0NTdRZW9s?=
 =?utf-8?B?eUNENVdkbmhBbU5uT05iTUxJK3RuNFFqamt2QUd4bjB0NmU0a09JV0NSdlZ4?=
 =?utf-8?B?VVRtanRGUTFMRlBVT1pyS3VqL2JiN1k4dXBMbEpSSmRxcjE2OTlaT0pMT2hk?=
 =?utf-8?B?QTF1T3orR0lwblFNNHgwdjJPdVRRUTBIS0pmWFJEWEFlcEEzN2h6RzZNMUJ6?=
 =?utf-8?B?OUhiUEZDZ0pxTkpxY00wUnF1cWJMRDB3eVZodmYyMDVYUGtNeWdSdTMxQm9P?=
 =?utf-8?B?TUQ1ajBlZHNJbDQrWkhFaHR1Njh6K3NlbklqNStiTm1DU2w3djNyK1VLWHNG?=
 =?utf-8?B?VHdPRXFEMklQTlNOUG1wd2pGSmYvZDQrSytTdnRyQ2hUSU4zZVlCMVRtUWJG?=
 =?utf-8?B?NmtiblBveTBycGpVVnJqcDlwYytubWU0WlVqcC9Nck5vOHl6cEtvK1lSWWJz?=
 =?utf-8?Q?R1Bk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGs3V3VUMUtnOVhVbTZtUER6eno0ZWVPNFNnSS9ONk03U1RnamgzZk1XNE1R?=
 =?utf-8?B?US9OOWhMaC9jSzAxMzlyOVR5bFJjTEExQ1k4S2ROUEZyM1FDeE9SS3BjaER3?=
 =?utf-8?B?YTB2R3VaNWE0UWNnRGNhWnREL2tDS1BaTkxHV1Q1NkxGQ0x4clJkbWpsMkJP?=
 =?utf-8?B?empmTFFKSnJrMCt1YW02bVVYQjRJd0FOcDdReUUzOXM5ZnRNQjdMVHI3Q2Rz?=
 =?utf-8?B?RWJoSTUyR0Y5WnU3NXNEMjBYVXI1Q0VhK1ZQNHRrOTVRQnVaTEcvbUtxVnJw?=
 =?utf-8?B?YmtuRlZmN3pGTDJxRWp6WEIza2tnTGZFenc1YTdhM0tYTTh3Wkg5ZDNZVEtZ?=
 =?utf-8?B?aEJSNWQ2S1FyU1Q0V1ExcmM5ZWlLRnZ6K3NFQW4rMmxHdjRvRkdrU25TNlo5?=
 =?utf-8?B?VTZGRXYyWFNNU2dPZ0ZhV2VvV0dKNDJGSGFBcDNVVGt5bHlBQ0ZnR1kwYU1S?=
 =?utf-8?B?bTI4NUNPWDVMNVVxcit6RnA3bjdsT01rcmpLaHd2dlQrVXV1UWdad1dyMGYy?=
 =?utf-8?B?K3JEWmFIUVBSVC96VGJKRHFpUkgxZW5pUEh3Tkp6andvZE9jNzJZTDU2OXBU?=
 =?utf-8?B?aG45K0RyMW1oOE0rNHJRZCsxNDZFc1RQL1RkZkV4ekczeTNFVk9rY2c1Yita?=
 =?utf-8?B?ZXlGdkYzV1JpVHJ6YzVOdmdlKy9JWkwrV3lDb0NiUTR2cDRGT2p2bXN0Y2tN?=
 =?utf-8?B?WmtJMWprdzk5amdJenpjU0pJSjlPUlpkakdsRVlORVhxalRodG5iYWNJWXRt?=
 =?utf-8?B?SE9FT1NhM0FubmR3eVltV3FKcG5lblNORnh1N0JDcFhpdlhib3V2Q3dOT01F?=
 =?utf-8?B?Z3JHYnRrUzB2UHVuaFZFTkhOUm5QNWVzdWoySVpHcWlhWklFZGIzVzI0bVRm?=
 =?utf-8?B?di94d1BMMXZQdWVLSFhudlBOZzRuT2pnekozTHJxN2pYQTYyUEVOK2gwakFV?=
 =?utf-8?B?Nm5ScU9HSkR3UUpQSjVUMVlpR0twTElLVWNteS9TbzhQTiszRFQwUXVEaWhV?=
 =?utf-8?B?SXNyK28xWmp1c0U2TnY1aFRtaUt6SlZGSllVQnJ5KytXZk96a2tEZEhNcVRv?=
 =?utf-8?B?QzZZc0xuclFwK3NoRzRuUnphQmlHN085bEhZbS9lR3NaQnJXQy93RCtxNjZt?=
 =?utf-8?B?dzRKb3dqai9vZmRNeWZkOGlqd3ZDbm54S1I1ajNDTkVZVjdLVTJ5Vnp5TWRL?=
 =?utf-8?B?TmVHOVNROFBZTFV6V3Voa09OZ1ltV2NFNlhWdVZHWXNITmE2WWJyRnhXYXly?=
 =?utf-8?B?Mm11TCtjcU5kV0tOcDhKa1ZCaXNzbE53VGM2VndZOVU3WWJMdktIQ3hNdzlT?=
 =?utf-8?B?b3NRSnFtUG1JNDY0akFHNFdLU1lnMHpXRWhJaGN3WGN3NE1tUnVISkI5MHJI?=
 =?utf-8?B?UE5sSEdzTHhiYlRZdVlVNy8vcDJXOUpIRWdXcG1XTGQxQlBxZG43bGx0enlp?=
 =?utf-8?B?Uko5V0xTdndkUTBBamZuZ01CcXpyQmExOTkzcjd5TkJOZWlobUhqRk1veVQ2?=
 =?utf-8?B?KzJRenhIeXQ0NmE0T0ZkOCtRNHhJR0ZLM0lwcW1LZ3hVcTF1NVNJNDk3NHF3?=
 =?utf-8?B?ZlFQQ05OVmFwNm5RbGVpV285QVFSR3VuNHVIRzdtZlMybzdvVmpEQUhQS0t2?=
 =?utf-8?B?dW9KbEM1b0Ivc01SaWsvUVROZ01ZaTF4cTVjemFWNytIdjRrUTl0M09aZEF0?=
 =?utf-8?B?Zjhkc0Z1ZWw5OFltbzZHelYrT0dBRlVGSCtlTEVOcWxrNzBvZ3RTRTFoelJR?=
 =?utf-8?B?RGdYSWVGSXlILzIwTnk1VGZwdWFVQ3ZkdTNVQktwMThrbkFXQXcxejJkUWc0?=
 =?utf-8?B?OTZqUjhMWnhSeS8yMDJPclg0b0xwN0NqOVU3Sml4TkFMbWFSMXVLUll5dlFi?=
 =?utf-8?B?c1BDNjN4V29aZmZxMGtUSEo1aGlOdTkwWjhtRXFLZ0NFejF5N3p6Z1RubnFP?=
 =?utf-8?B?V1ZTYzN0Qk9YaTFZd2tIVktIV0Y2K3FyMnA0N010LzV1d1JYZG1Gb2lOb1JO?=
 =?utf-8?B?bWkrM2s4RllzVUoxZnlVV1ljVTFPWmxkUmNUS2pFcGVhOURSWk9qcGsvVGdQ?=
 =?utf-8?B?Q0JpNHRsOHJVdk5qaW1YSTFBeUdYeE90NERFQVBMdmwxNE1pRXAySnB5Ykpk?=
 =?utf-8?B?bWtadDFBdkp2azkrMFFlZEIzeWlGdC82Z0lPR0htVFFhaEhRTjhnN2dSWFBk?=
 =?utf-8?B?bi83dDUzZFQ2R2dIbEx0VHVlVHFNRkRLcCtPRmxPbWdhMGJiNHgvZkttUmpr?=
 =?utf-8?B?MDFSZHlndWlYZGY2NWdSUjlOL2dYSTdLdHl4TjdiZ0tVa0FMMG9JVkNTQkRa?=
 =?utf-8?B?ZHhKUUNBVUVWZFlodEQyNHFJUVRPSW1rKzUvdytacWUwdUFZSnlHQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803e18af-2968-42a8-4dcc-08de5f5c98fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:34:04.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaSvhCVLjOV9i7+K9qYAqGsf9qYeyFugr674Xwvlu69Hy6SHPqQnDKJQIp5t9ukS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557

On 29 Jan 2026, at 2:03, Muchun Song wrote:

>> On Jan 29, 2026, at 11:29, Zi Yan <ziy@nvidia.com> wrote:
>>
>> On 28 Jan 2026, at 22:23, Muchun Song wrote:
>>
>>>> On Jan 29, 2026, at 11:10, Zi Yan <ziy@nvidia.com> wrote:
>>>>
>>>> On 28 Jan 2026, at 22:00, Muchun Song wrote:
>>>>
>>>>>> On Jan 28, 2026, at 21:54, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>>>>
>>>>>> If page->compound_info encodes a mask, it is expected that vmemmap to be
>>>>>> naturally aligned to the maximum folio size.
>>>>>>
>>>>>> Trigger a BUG() for CONFIG_DEBUG_VM=y or WARN() otherwise.
>>>>>>
>>>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>>>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>>>>> ---
>>>>>> mm/sparse.c | 13 +++++++++++++
>>>>>> 1 file changed, 13 insertions(+)
>>>>>>
>>>>>> diff --git a/mm/sparse.c b/mm/sparse.c
>>>>>> index b5b2b6f7041b..9c0f4015778c 100644
>>>>>> --- a/mm/sparse.c
>>>>>> +++ b/mm/sparse.c
>>>>>> @@ -600,6 +600,19 @@ void __init sparse_init(void)
>>>>>> BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
>>>>>> memblocks_present();
>>>>>>
>>>>>> +  if (compound_info_has_mask()) {
>>>>>> +   unsigned long alignment;
>>>>>> +   bool aligned;
>>>>>> +
>>>>>> +   alignment = MAX_FOLIO_NR_PAGES * sizeof(struct page);
>>>>>> +   aligned = IS_ALIGNED((unsigned long) pfn_to_page(0), alignment);
>>>>>> +
>>>>>> +   if (IS_ENABLED(CONFIG_DEBUG_VM))
>>>>>> +   BUG_ON(!aligned);
>>>>>> +   else
>>>>>> +   WARN_ON(!aligned);
>>>>>
>>>>> Since you’ve fixed all the problematic architectures, I don’t believe
>>>>> we’ll ever hit the WARN or BUG here anymore.
>>>>>
>>>>> I think we can now simplify the code further and just use VM_BUG_ON:
>>>>> if any architecture changes in the future, the misalignment will be
>>>>> caught during testing, so we won’t need to worry about it at run-time.
>>>>>
>>>>
>>>> VM_WARN_ON should be sufficient, since bots should report warnings
>>>> from any patch/change.
>>>
>>> I’m not sure a WARN will get developers’ attention, since the message
>>> is unlikely to have any visible consequences and only fires on
>>> allocations with a special order.
>>
>> If a developer misses the WARN and the patch gets into linux-mm or linux-next,
>> kernel test robot runs selftests on the kernel and reports any warnings
>> to the mailing list. Do we have any related test in selftests/mm? That should
>> help us catch anything if a developer does not catch it.
>
> I looked at the selftest and it doesn’t seem to have a test that
> allocates at MAX_FOLIO_ORDER and checks that it works correctly.

OK, we probably need a selftest for it. In terms of using VM_BUG_ON or
VM_WARN_ON, I leave that decision to you and Kiryl.

Thank you for the clarification.

Best Regards,
Yan, Zi
