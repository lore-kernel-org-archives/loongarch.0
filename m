Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225B2BD597
	for <loongarch@lists.linux.dev>; Thu, 29 Jan 2026 03:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769656235; cv=fail; b=W5lNpVjJXDxv8RmfMTPDAepRvN3gxh0i/FiKMalZuy3qfyZqle6bXnvrjHdcnYPECuTApvQe/zlsVCLmn9FAeJ8xQduLuSjCbJoUVFLG8E0p7kTQN3yCVM0FCsIcuXQi4I1oJGRGDHagiw0fIZ5ufQ9wwCYJeVQJK/QxPdGQFOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769656235; c=relaxed/simple;
	bh=m9HiZUw2T+alEzOMM2w5XO57ImxBjjjIRJTt100AH8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oQCNjn4tonJHAj5JPQCvqaWcGKKdx00gccbcLrP0mJmHjhaXgByqPq+B5X56dTbh0Wf5H56+AW1b3LESan2qDIma+WPmaSgUE7f+/f5xg987lHSGBoBWg4NNvbKYRdBeXQMgdqENzOAhsaab4urMzu6epFWdADKCDVSaoMN7RCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i6oWYMxR; arc=fail smtp.client-ip=52.101.62.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i6oWYMxR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP+hc7CsnB3BwQ6KfeEMcOQQA12NiMhKpZBjWnpbNhGRvAERfsmTDzdsIVgtF4bo1iUUd5HnTinT8SPthOfXGf1H9ANQOu3Y9s8/B7NdESFKiT4KkapWvQp6WG/Jg9BQDqbPDI3/TlzHKZHeQQrtfwgduMuX9Bvibz4Ox09ZqC39NFuCEa18E/1MyrfgwB3F+LAkeAf6R9BbigFF12Jx+S/cUOrJ8OX0++cseRBGhvZcCKtFpKfU/r2rGfbbkbVM7T2jx5mSx6ybXEGtqptKzWVqTIam/U+Hxd/Dn2kVhVlQl1+H0Efl2XpAgSrW7iPaxUVxGDfqMvl9rzxvIdIP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+/nOUQcfNqFScdsvDYU+fjmtaWRMbf2QIFxSlyOf6w=;
 b=JiIa9z4w8a9Ge3PahFV4N/ByeTdnSuW+qYjdWqw3HH+7hpGpNDIWGqAqpm5jt5d+rpsm3pe0rcZMWGlQ5cbX1pUndXRFnw525pO3lkqDR4439zkOVI84ulE6xlcTgo9v2GrbMNZt82uLQVrCWHgjck1oQsNTFPGzpJpRsqBtBGNqGqXja7l3pApcfvB8je/yRa84SnwW3qmqdnCFkUTLpEs2NFTneGRWtWWtB8602gS5M5ql710vkmYhg+8pyt7sznUsbwkok4Jxsk1Gbez4UkkwyNsiWpQ8oM4dZ2BNBDXw7qP5lCMslMoEPJ4COc/Y8Qcx4wOSbY94Ws70a4e5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+/nOUQcfNqFScdsvDYU+fjmtaWRMbf2QIFxSlyOf6w=;
 b=i6oWYMxRTY7r3179TQio6qLzD5V1yYFXl/D1EAm1SvQelX6FYJCZjMJFGgEF+BBTl4TUZQgqsNHic0N/WxyheQbRH4SM17tlGS9Q9tNtO9muAv+Gc1w5YWaQmJ8Ph622l1mk0zlgn7F54LNnu2HQOiwnz+c324kudq7RJ0fBBqAKk9xYOAdAwcVQKR5vw/7PcG4Yv1Nh2eQQLfQqzB/B6VqmBSqQMC5HYKExpOmIV6LxRFrql/s+NlYO4Aqjl124WknkqSFX9mk24O5S9PDNgBJGRL/05tUGwPdpW2+puZy5/V25NMvCjySv4mcaLsIa4vVjyZLqfmdzPAWw2o6j1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9336.namprd12.prod.outlook.com (2603:10b6:408:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 03:10:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 03:10:29 +0000
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
Date: Wed, 28 Jan 2026 22:10:23 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
In-Reply-To: <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: b51ca396-e7fa-4e09-db8e-08de5ee3f4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REJ5Qk9UK1FCUkw1VGlEUlIzQ3FtRzIzeUgxT1ZLSk5FQjhCQVpXeElzcVpt?=
 =?utf-8?B?V0tnK0x4b0RsdWo3ejZyUlNpNmtyRFJ5ZGdBU1dqL3RkYTRRYzdlbkhwU1A3?=
 =?utf-8?B?SXpKcmw4MHlLWXpLOEJzd1N1UmswVXFhc1EyMHhhdGJGSVlhVnhIaG1NSi9r?=
 =?utf-8?B?aCtVdFQ0VXVnV3FFUmF0R0psdHN2V21KNVJTOE4wc01MRDRaaW5jNnloS0hV?=
 =?utf-8?B?WlhzUE5KRU5RTmUrSGIwL3FYQmJwMVdWYkxYVXUzaW1pSEhlK2hZUDJDOEIx?=
 =?utf-8?B?Znozd2tMWlZKem12NWdRVVRQS2hjTEt0WnNtd2NHMU8wc0hHOXBJdHRTaVpS?=
 =?utf-8?B?YjZmZ2k1NDh0RUZha3poYmgyMUYzODdFVGc4Zlc5NWczREh2WmZGaFBNTEtJ?=
 =?utf-8?B?aVZVMGd3eVFMRlMvVDdZbFpXVHVkZjg2STRYRlpBcE5ORFdxazhhWVJHVHhH?=
 =?utf-8?B?RjczeFpSZUQ4bENjZUxaMFZBN0hybVpqMHFaQkI3VVU1UUpKV25sSVZ3VnRn?=
 =?utf-8?B?bU1mM3Z0aFpVc2IyL3NWWkUzaCtoV2NBazdreFVsb2VxbEFxUjdPWmphVUhR?=
 =?utf-8?B?WkRTRGRGbEU0dTdyM3hmSzV2MENjc0t5UG03NlEzdjQ4Vks4dVJsMTBwYVZO?=
 =?utf-8?B?Smc2dmwxOVpHN2x1OEowalMxL1FLRUlPYVk3a2JUNlRqWGczaHFsWTJhcGlF?=
 =?utf-8?B?MDRCaG56Z0xSblBJSEpENVUrM0g2bmpWSFRndlFhaUNBK3loSnhQR3hZYnMv?=
 =?utf-8?B?Y3pBODlPUkYzNWpKeHY5Rk9GdDNJY1hSWXpIMitYWlZzRWkyeDdaV2RyQThy?=
 =?utf-8?B?MW5OM2NKZ0o5TG1SR1FId2toWi9QalBjZTAzaVNodVVPOUdUbm4vRWVpdkIw?=
 =?utf-8?B?V3ZZcFB1dWxKaFZTZnRwM2s1d0xSQ05wNUN4Tk1SQnBDdFJCbVo1MkYwSVRa?=
 =?utf-8?B?TW0vaWsvekgxYW9iS2xZWDgxMEgzdlBGVlZER1V2eDMyaVNtcUp5bmtXSytp?=
 =?utf-8?B?WW9lOFdUTTN5R2lRNnllNHhiVHJTdkFmU0tHdlZpc2MrQm9xVjg1d1NndG9M?=
 =?utf-8?B?RkFoTU5RMWQ1Q3E3djd4YXhIWnlPRTBuZUFiWk4wNzJzZjZzbzdseUZxN05Z?=
 =?utf-8?B?bGJBaHZ2Qjd0dlRqMks1czNLN0FSdkFkalBzekd1QzNFL3Q1Z0cwSWlOMTVp?=
 =?utf-8?B?TG1TdWY4NHBOb3V4RWY4L2VsZTNZZFQ4K1duTTFHc0ZHQWtxUkV0OXp2ZGdY?=
 =?utf-8?B?YzJmdGJsWUpEVnpNK0ZRMHN2alpJYjExaS9vVDU1S210UjVHSDZWWnZkTjlY?=
 =?utf-8?B?alFOQzNmVTBkQ3NXdEMyVHlXV0h5cmZJSEI4R20xZXZMNk15M29TeGYwd21k?=
 =?utf-8?B?L3RTWVhkcHFHUDdRQnRXSlU2OThsL2VNTklVQTk2WUEwRmE1U1ZhV2Y0YU52?=
 =?utf-8?B?czNXRHU2ZTBRazZVRldwaXJIdC9iWE5KNVJyVG5MVFd6b3dSdDBCdVZROVRz?=
 =?utf-8?B?cVVoVkNERHdaUy84cENDZXZnSGlZUkJMSWZpLzNPMnZSMHR2eGxmcHgyZlgx?=
 =?utf-8?B?U3dsTXdxSXQ2Zzk2VHVRZjFHMkxob1YwRWZtMU1jTGpHVE96ZkNCMEg3SEhH?=
 =?utf-8?B?eEkvM2swNzU2aU1ac3hnNFZHQ2c4NmxsSkViU0hSTllsb3J1SGlYc2RQTENU?=
 =?utf-8?B?cXpsSmEzeEsyN2dTVjdlN1Q3bmVxdXpoKzljM0pVQUxvQnUrcW1WUmtEaXEw?=
 =?utf-8?B?UUxKSjg0ZU4zR1BoNVV4azVYTkVIWllXS3ZWekppZi9LOUtuOElTK0ZRT2tZ?=
 =?utf-8?B?Q3RzRkh2OGVjZFJHQlZoaE93QURRLzRZTEk0UU5yU2wweS83dWtVd1lPU0lE?=
 =?utf-8?B?ZmpSRVY2TUNVUlpMTXJpM3A3MUNTai9xWjk2VmpzZG9JL3l6NUJnOWRqTElI?=
 =?utf-8?B?QmkwQmRNb01BNkh6dmYwbTVFYnRFSEZ5TmFDSTE5WFg1WEJUOE9lbFI4VkEw?=
 =?utf-8?B?alVaWEhxWUxFcWUyeSsvTUZ6K21STittWm9PcHlaeFRpSUQ1aElXY1k3Ym5R?=
 =?utf-8?B?djJpbDdJQW1iV2VpMi8vdisxeEkyUlVuelhqc0hCU3cyVWx0S3ltM1ppaXU4?=
 =?utf-8?Q?hbKE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVrMzZ0MEdHWTNNZG9Pb1FaQ3EvQzdsOTdBQUI5VjZ1M2pzWU1jcVBJeUYr?=
 =?utf-8?B?MHRpR1VPUzZKa2l6MG56ZmlPY2pYN3VQdXIzZnF6WVJCTHhFd1NaY0lRbzRQ?=
 =?utf-8?B?d2JlTXNsTUZWb1pDL3JveGdpTTRiR0hweFpsMjBYMVVmMlozVXJqOXg3OVpV?=
 =?utf-8?B?Y1lQTWVhTGlCQVJ5ZFVMc0F2dFZPNmVsR1NkZGJDbDVXdTdJd1kyeHlUOGtI?=
 =?utf-8?B?Zkl2a2MrQlRZZ1pGVXZ6ekhObUpkRXJGUnBwTW5FbXcvSHF4cGdKUHgzcmJw?=
 =?utf-8?B?My9lL3pjenl2QXNNdmtFOEVrclVrY043aVRPRjQ4WEJpWlJiQkN3Rkc0c1lK?=
 =?utf-8?B?NmdMaW1XMzE4RlREWmRZSTBPZFRLSTdFbXI5c3RmQU1pYmM5QnU1aExQL0d2?=
 =?utf-8?B?UDdBUWhZbit0U3A1c2RHMys2VWZtaXp5OXRSaUJVOFpJZXc0bnR5cUJrVkQx?=
 =?utf-8?B?dWlhM3BGWTRaT1Z5WFhmODVDeUN3SldqZVpBbzk3T0hPbEFVK2RpTFJ3dXgr?=
 =?utf-8?B?NThhMWdRV1F4YzYxcFd4VFFwNEw5Y3NwS0kwdVp0cUE5UnFnUm9rdGIvMUdC?=
 =?utf-8?B?TDg1bWkvWkR0eWdhWkRSWkREcjlKL2k1K2poLzFoaVFDa3k0ODR4eW5HYlBl?=
 =?utf-8?B?d2hoMzVJMHRtRVdKd0VObVlkWHhscCtLMjFKemo0Q3FGSXFsakVaU1Rpa3Zr?=
 =?utf-8?B?WXJMc3hoRTRQaUtzWE9FVDh1MUliQ3g0Q29DL2gvTXJQNysvS2xUeUo5YnRi?=
 =?utf-8?B?Q2dmOFdNQXZqMGczaXg5am5yaWtWSm83cGQrSWg5K3pLeStsZ1VJVXNEVTRj?=
 =?utf-8?B?UEFabm9saFNxZlBJeWxXM0ZGYk91YTlQTzgwMEJLNm0wcVAzdGxjV3hEODBT?=
 =?utf-8?B?VTl0YTBMUGxycnNWQXh5ZWtpMndQQWlJZ2VxTTZtdjNpZ3l3YUxDSG54b3hz?=
 =?utf-8?B?N3FKOTNkUEM3UzJ0OGRFaUpUM04vZysveVlCaUdlajExL3FlUlFHYWlJMUFz?=
 =?utf-8?B?RStiUnJGbkhFWUpwSTJ2Y0wxKytubGxEdnVNeTdHS3M5Y21LenlDVzhrY3lt?=
 =?utf-8?B?aFQyd2V5MXljdEZUQUpXK3ZTek4zTXJDalJkNldBVVRCbGp4YTg5SU1HUk0r?=
 =?utf-8?B?bTd4SmVHQ29maTUveE95NHVlYTBDUmorVFNXN0J4aCs3c1A4akx2dk4yRU55?=
 =?utf-8?B?TmVqV2tvSW1zUFNqNEhPV1lNMkdKYURZUC9VckxRMDJUNDg1Wko1UHpRWWNW?=
 =?utf-8?B?R0RpOWFSRTZFSjZGUW9MVUtNN3RyeVg1c1o3NmdGcWNmVXFKM0t3VWNna3Jk?=
 =?utf-8?B?OG1Wd1R0eFRBVjh1bWdZYUdvWFNkU1ZCUUtjc3FNQWJvblYxUHk5WS9SbVQ1?=
 =?utf-8?B?dGs2dG9TQWxWUXBBclhSOWJxMUhNSEhReG5oMEtQSHlObkd0SkV1bDFveEpO?=
 =?utf-8?B?aVpYalNLaG9URUdZL2wwa096cW42WlVOS2kzdDRDRmh4NCtrbDd2cmlqZ3lo?=
 =?utf-8?B?T1pJRXROc3lFUXN1MjFUU3IyZVE1U3VkbG1oQno0T20xcjVBeC9LdldtdFFp?=
 =?utf-8?B?UUp1b1c0a3VWQkN1bURjV1VlckFIaWVyVkJpeW5CYnA2aDEvVlV0QUFFWjdH?=
 =?utf-8?B?c3M3NFNCVFpueFVuVzkyUDFhcGJ4bHgxb1JIVnMweTBVQmVrS1BZVzFWV3Bp?=
 =?utf-8?B?MEw1aFdMaG9SVE9Ib2xweXdzSTc1Z2l2MmJEM2pra2UyRzRZdmdOQXJtMldC?=
 =?utf-8?B?T1ByRHhnVnNhWXY2OVpFWkNvMXlYZ3lHUkRlNjhwSERaVUZWeThyOVNvc3h6?=
 =?utf-8?B?MnoxUW1FMmI0TXdNVC9ObWlrbUtIaWx0Tnc5SWRmUWlMdU9NRll6T0UwZlY5?=
 =?utf-8?B?dGU1NEI5cEo4Mm1tNTB0bzZzSklxZjN5cGM3U1BiTzR3ZUh6RUdkTkVFNXN5?=
 =?utf-8?B?K3hxcEllRTRiNEFRR3ZoaEZGUzhFbFBxRWkyUmU5Zmw2N2JjMU5URzIrUUhu?=
 =?utf-8?B?eUdDSUNybWJnUFpWMitiRWNHR1RQRDdXbGF0cXZBYm9sMDY0TUlJbDYrMkdX?=
 =?utf-8?B?bW5sWk1YalVkcmNFb3NPUFYrUnk0MEwrRHI2dlltMDBPUzV0NW0raloxZE1I?=
 =?utf-8?B?Rnh1VXE4YkV3KzYveEs4RjVoQk5pblVEUm9RS0phOHBXT0tGQk5xc3NjbUt6?=
 =?utf-8?B?RnlBS05Ia0lOR1dCUlVEdWl5ZEdwZGRjZDgycktLdzcrWEZXejhnd3o2ZzNB?=
 =?utf-8?B?eDY0ZXkvSUJsUGRrR0dLTUc0MnJzMDA0cTBhL3MrOXJvNUIyT2ViY29tdldw?=
 =?utf-8?Q?bzrrcCwL0Kp1lJOoV9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51ca396-e7fa-4e09-db8e-08de5ee3f4c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:10:29.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzGPMtgWHhiNaWtZPBp627HiFQDelYkm1Shy8GfAr78M+5JJB3sDvEToQCSfzrm/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9336

On 28 Jan 2026, at 22:00, Muchun Song wrote:

>> On Jan 28, 2026, at 21:54, Kiryl Shutsemau <kas@kernel.org> wrote:
>>
>> If page->compound_info encodes a mask, it is expected that vmemmap to be
>> naturally aligned to the maximum folio size.
>>
>> Trigger a BUG() for CONFIG_DEBUG_VM=y or WARN() otherwise.
>>
>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> ---
>> mm/sparse.c | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>>
>> diff --git a/mm/sparse.c b/mm/sparse.c
>> index b5b2b6f7041b..9c0f4015778c 100644
>> --- a/mm/sparse.c
>> +++ b/mm/sparse.c
>> @@ -600,6 +600,19 @@ void __init sparse_init(void)
>> BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
>> 	memblocks_present();
>>
>> + 	if (compound_info_has_mask()) {
>> + 		unsigned long alignment;
>> + 		bool aligned;
>> +
>> + 		alignment = MAX_FOLIO_NR_PAGES * sizeof(struct page);
>> + 		aligned = IS_ALIGNED((unsigned long) pfn_to_page(0), alignment);
>> +
>> + 		if (IS_ENABLED(CONFIG_DEBUG_VM))
>> + 			BUG_ON(!aligned);
>> + 		else
>> + 			WARN_ON(!aligned);
>
> Since you’ve fixed all the problematic architectures, I don’t believe
> we’ll ever hit the WARN or BUG here anymore.
>
> I think we can now simplify the code further and just use VM_BUG_ON:
> if any architecture changes in the future, the misalignment will be
> caught during testing, so we won’t need to worry about it at run-time.
>

VM_WARN_ON should be sufficient, since bots should report warnings
from any patch/change.

>> + 	}
>> +
>> 	pnum_begin = first_present_section_nr();
>> 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
>>
>> -- 
>> 2.51.2
>>


Best Regards,
Yan, Zi
