Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012056.outbound.protection.outlook.com [40.107.200.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7042125F
	for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088226; cv=fail; b=NKsuO8d1uBKHdy8EXGrInovM+g2adwXTLtQrdbuIFFpa34nrjIFhGLUEWovAy2Ko1AVmpWUEmOO7EP5hraLDmXvP8UMNM2S4jRBkY/bnzrjRtDe0EKlG3FUY65RFsweJ3zD403HiNiIxlZPb3zlpZvSoDp7We3r/8jzY7lezyQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088226; c=relaxed/simple;
	bh=VQG8ezIU3tx1H/n8rjNrc91L9uApRUgue41l0PYMF7I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eziT2TPaaDNI9udW4KvMve1XwmFFnQWKIbGSFuV6jJjvmmVb9fon/+zeM8tCuD+GRyf8/6JHDA485BgZ2L/OJJSUxc9gt+f40l03bwadZiJBYWzyXu+JcgUhEe2UecQEa8anDBya72tZb5gvtogMLuw0uuoLLJISrxgTF5lE7dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mhRsDrj7; arc=fail smtp.client-ip=40.107.200.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mhRsDrj7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVmy2M/6hnj7d5UXE7Qq0jOJUqaHS6qNcvlhd0C9pyiJ2yvq0voq8lx8HmdPF+H08dkEMLW/FgXCfqm7TXGCFfsZGRWDMRcrxiTxpZHBOK53BM/DDyW0xCMK57Q3xJKj5AmomOuSTKtosWaRkaGju3LqXgXRM1QnA5z3+MzTrF54fAZ3OX7CIKbMvdSpGtSiOlYv21qz/DT00FuJfZSjr+PMxzi0uDMVgAao8a0qAe8i4br3pSS+ESXrGr5OIzi+uuCf79UQKxvLi7QUi1xAjVE4eQJrikFwPCCYivoY01lSqMJxiV7C+CcteXvO9aPdhpAGGFbz2vQX5RVJ922eow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZFgU1NGLzyuw4BLUMIZLOxrCViKnSXqfb/cgj1xOus=;
 b=g2HoV/yopYq7sGCGJfvv5Py9PxCRVbONmhSJeQ87oACHPuxzN4wjDv2LNvMIvlnajDudepoLWJbc2angAexRaKRpxEYj8tSyhMowRQQHwlSMe1c40aA27A1iNxbY8vPP39NFJLqe78jDCqwTcOOOttbTFU9WZz7xLzhHOZDqnI+C6EVxamSU/wjL7Bb5XgryW1y+RMCTvF8uiOhZuMXE56JQyQ5qAVqHC6x0U43UrXLQYg5OSNvHdptA6s2SOv8ksZ6a2fmwamuxenmjpM+Bji1xweyGv8350JZ2EX0VNlq6XKSkFqvynGEu40XUb/eaCdsp4VPkYPvYRbcbmaQGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZFgU1NGLzyuw4BLUMIZLOxrCViKnSXqfb/cgj1xOus=;
 b=mhRsDrj7WM1EJyokVY0otnw/xcexMoI1eKB4j8FBtTnGwlsR1KgDoIF9ots8Nw9ijetjYnaWFSGyRdaW/c7HSL27NoXqUnTat3AHYDqBGpfdUdavAOeiZhau2XsO/Sv+C+Qm3+D7piPYj9TGPEfBdSKzcd+AiW0V2LwxskoABPZ5cypfZzCFcEE9yVsNs2G2FfXbyUHP1PX9IAna0xTx8UBD08avDBvKE5RfyXk3EWmt9SA+gczHEaPC6dlCwnCgTSLESeQkI/IVx/mpaBmoAXFWbWWOAcwmCxjX799h7TOMPHg4fPTNr+SsX5z8T1IOwPZAo6UsWss5iOZ5zThYdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 18:13:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Thu, 15 Oct 2026
 18:13:18 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 15 Oct 2026 14:13:03 -0400
Subject: [PATCH for 7.4-rc2+ 3/7] LoongArch: mm: don't let GUP-fast follow
 invalidated THP PMDs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-anon_vma_uaf_fix-v1-3-7b977303b42b@nvidia.com>
References: <20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com>
In-Reply-To: <20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com>
To: David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Jann Horn <jannh@google.com>, Kyle Zeng <kylebot@openai.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, loongarch@lists.linux.dev, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: YQBP288CA0034.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::21) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 799f1d9a-3aab-4a10-c611-08df2ae7fbc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|921020|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	woEBebSdLBw65qjB4TriUWNIKxidzrOI6/D3T0e6NGzoDHjJnnQKhKQn4oMIaEOmuae7K7tJ6N41vqBWw48UWDhDcipDSpqa/vml/PV1Rd/laiHzCe7Io9mPH/30M/hgECVaGDQkh2kd3NJLoocp5OPKP5znLRHy/6/8V5TCE8VpP3+E1d44/0l+bw7LxZG9bU3Rg2PhKKBSetun3j7rt6QQeLkuvuC2RKLgUcm8Vka9Mkb3DLBHcdpQRLFuvnNWK1vjaxV7f4Ro6+cRju8Hr2IMlNQ1ZwGz6VR4tssQTE3xoTDSGDsqkv2aMUZF0ZgjaO4sUrNY/IOe4sZZ8aNbPKVFKBmlO/eN62B0SQiIIoDVl4M8ai46+C6gG1AHdSoPXJp1fbXxM0REQC49QEETXDWxjX7mlrm6AIXwSQyNHNoRTquOTXbQkxQdeno2EA5fp2i5yWDvUqGdCC8wZX+FiFKnTByhJ/9ITbsFlYFRnKj1bhkPagrjdS+wPHx8O4sVbW0bJIG9g5ypJYAx6fsXS1w2lzRbKwu2Gr+ynZE8ilkEvrchvXfygKmxbNvs1E2ifTc3ovVAoFpbK6mkQqkT6gVOjGFetBEfNuqmzI8svcYGEFw007xaul/wJC4RxSYQHnUXRw98ZHEpHcWyGGfc14DZzpfoTo02Gr6/xRPyWQGksuKPSdKiry5kv149RkXmgsxg2L2NKyYj2+c6rqTy+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(921020)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2ZReGVmUkVpaXp3Nzc4YzBEdGdyYlRvM0ZvdzdyRkFMdjZRUWNEcVlTRWJZ?=
 =?utf-8?B?QVc5eDBwTUNVdklMaktSRzF3REdGNU90RUNaTEFSZkVqTUdQMHRBdUpUdzBY?=
 =?utf-8?B?VmdFNWNtVi8vVFhlbjNXUmFsbkZObjFwL1ZaSGt3THl1L2IwVnp5TDlrdHF3?=
 =?utf-8?B?dGpiOUpHTGN0TFhjbGh3RnJWTzFjOC9IZEZnYjRLaUFGQVNjMTlsaFVmNDNI?=
 =?utf-8?B?bVQyRDBicW1YOTRkakhmMVA1UFhoQVVkaWRyUDFEM3RMcFE1anBpSWRPUVMz?=
 =?utf-8?B?cHlvdWhDdzh5Qm85akdNU0s2T3phZW5lbUk4UnZpN2FzWk9jUVB0bXFIdzIx?=
 =?utf-8?B?aUVwU0tLMzRjaGhUSkRjR3RSQ0ZTVTNEcDVCc3ZUN3JvN0lSd2NkUkdFZ2sy?=
 =?utf-8?B?bGhKYktBU084ekpQUWJYNnNkeG9DdDFsY09ncVJoTEpLbWUxZUlOcGJhYU1O?=
 =?utf-8?B?dXdEZnFrcHNVbGU4SzUwakxMb2RkNHVFREsvUDZlUHA2UXMxR1BKV0swNjZa?=
 =?utf-8?B?eHZuWmFSM0JnNUd6WG9zMHM5RDFvcFFOUmxQYlZtT1lkT0RMbnZibEN3Z0wv?=
 =?utf-8?B?YTBFcHh3VDFKenBzaTI3S2piRzJnTFBUaytoazR5WlJLaHlOajBYMVdpZWRG?=
 =?utf-8?B?dXJNTlJLOXhja1Jtanhwc1I0czFDMVBIMkJ6enkraW5XS2dCK0JuaW5yeFdz?=
 =?utf-8?B?TlBXV05XNnlzZEJseHIwRW5ZVmlOU0YyMFZ1TjIwT05EZmVkMjFxaUJGSzRC?=
 =?utf-8?B?ZW4rTGE4WFFWVHZER2k4RzlPSWFocnVKSWJrUWZyckx5eGppV0lPVDFlY0lw?=
 =?utf-8?B?cUNEb1BZcFQxcXhsSzhOcW1sTFhoL0plYW44bHQ5eHlzaWxKVk83K3NCRjNY?=
 =?utf-8?B?ZFREZWVkV2JrTmlFejhYQitDVnpMRTVQS1NaUU1YYkVMV1NNV3JyVzNjU05J?=
 =?utf-8?B?aUZFRDhEQ1RUS3BQdldtdDVadHA2YWtxUE9ydWZrRW83NXZHc3puZmh6N1VC?=
 =?utf-8?B?S2JScTRNTzZTekRHcmgyUEJSVU52dU9hMnJodHNhdHRjSEsyMERXK1JiWVVs?=
 =?utf-8?B?aGVUazFEaWt4M3pHSXpTYkhzaEpFTlNtdmdreDdMVURYYmRIM1pxdXBaWjMz?=
 =?utf-8?B?NjA3M3IwcnZvem0rdk1hQktyVE1jRjBqaDJUSXRJNGxqYTRUNmltVGJ5ZjZ4?=
 =?utf-8?B?WEF4bWlVNUxTc1oyTndzeWRxM1pRNkgyQVNlcm5WbXNDZjN6QUpwblVMaW5k?=
 =?utf-8?B?V3owVHlUSS92MjBwTlNUUWxRNVFCTGlyVGJsVUs2SWZ6TWNkdU8waWdlUnlB?=
 =?utf-8?B?bHl4RzZ3c0xoNm9sb05EZVNrRHJpdjZ4SUF3L2hsWXpzdDh1dFExYlJBYkQ1?=
 =?utf-8?B?UTNCVkRGb0xPTzBIWGVLQ3FUdHlBQm9sdVpjMFkxYjVYSHJPOVh5MEpUa1hr?=
 =?utf-8?B?ekViVDJEY3FGbmdjYlo4Y0FZSHV6Vzc4SE9BanNmanFZSEJaU3Zkc2ppVThu?=
 =?utf-8?B?YmV6djl6SGFZSFlmRE8yZ21WYWlQVzBjN2l1dzgzSkNoRmVCUjdlcDIvOWo4?=
 =?utf-8?B?cklwK1BqakxwWWZHOU9Zb2QvUGZqMUZKeXFJTVdaWGZ1dnBOUHdjOXNuQk1t?=
 =?utf-8?B?S1oxbVB5cmRHenZSSjV4UzRScTFteU1VUFZjOFJSeWc0azhQS0hjUU52RVlm?=
 =?utf-8?B?OFZETVBLY2dCOGszamVNQXBCVTNCSlhqMTNHTlBpdTJCd0svRTNucHJXRzB2?=
 =?utf-8?B?b2JSQjVqWG9kNjlmaE5GS0lZZVE3VG1Wa1hHdVpjT2tiaTVDZVdYK2Z0a1F6?=
 =?utf-8?B?TzJZOElpWm5VY1VRM09FMmhuTHk5cWpyalNNejJrSlBONFl6Z3VKOFFTZkdQ?=
 =?utf-8?B?cXJjZ1lIZ1BjMXRMc0hqUGRjZEpCM2I0Z0l2STExaVBVV3Jlbko5OGlhNlE0?=
 =?utf-8?B?ZGJyUy8yVzdjb2dId1BRWE5RT0gwZHFGd2UwTFhHeDdhRERKMmR5YlRReEp5?=
 =?utf-8?B?VXpERzVDMmRZVFZwQ0cyV0twNjZqTmVoeDNndVc0a0RCMUtMUWk2MkpBV0Rs?=
 =?utf-8?B?WkV0V1VoT2dIMXM3RUxNRXRTWlhyUzAyZ1BzSGY4YlZyUWZ1VVl0UEtEUUJx?=
 =?utf-8?B?d2p4TmROd2FnMkthdDRkN2h0clZ3RUtYUGtpSGdjQzVIWFRhdjdDeEhMdVZD?=
 =?utf-8?B?YnF5M0kvcDNOVGpmRndyQ2diSlR0TGVKVUxTd2xmZzUrRG1JSFBrb0lPQWJq?=
 =?utf-8?B?cGVkMlVWK2tSWnhGbENvQW5LZmpmeFZtSTV4QlArT0xiYjRlazMzbkZ4YzhE?=
 =?utf-8?Q?t2HkhziURxtwr0WsYP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799f1d9a-3aab-4a10-c611-08df2ae7fbc0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 18:13:18.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1pZ4CuRSCN1yG+V1keT3T3GbRcS2KVuSvP+W06oCIK+N5ZpLia3W8V/QRgAonNB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058

pmdp_invalidate() leaves a PMD whose pmd_present() is still true, so the
generic pmd_access_permitted() returns true for an invalidated PMD. Then
GUP-fast can grab a reference on the folio and, as the PMD value doesn't
change until the caller finishes, the recheck after taking the reference
passes too.

Code that invalidates a PMD and then decides, from the folio refcount,
whether it may drop the mapping relies on GUP-fast backing off from an
invalidated PMD, like it does from a cleared one. x86, arm64 and powerpc
already reject invalidated PMDs in pmd_access_permitted().

Provide a LoongArch pmd_access_permitted() that requires _PAGE_PRESENT,
so invalidated (and PROT_NONE) PMDs are not followed by GUP-fast.

Assisted-by: LLM
Signed-off-by: Zi Yan <ziy@nvidia.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 arch/loongarch/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f876031351319..bcba7bce71d5d 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -522,6 +522,12 @@ static inline int pmd_write(pmd_t pmd)
 	return !!(pmd_val(pmd) & _PAGE_WRITE);
 }
 
+#define pmd_access_permitted pmd_access_permitted
+static inline bool pmd_access_permitted(pmd_t pmd, bool write)
+{
+	return (pmd_val(pmd) & _PAGE_PRESENT) && (!write || pmd_write(pmd));
+}
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	pmd_val(pmd) |= _PAGE_WRITE;

-- 
2.53.0

