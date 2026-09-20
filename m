Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07713B27CF
	for <loongarch@lists.linux.dev>; Sun, 20 Sep 2026 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871408; cv=fail; b=TO4BmYqG+PjViGkC+8ELmHWWQdGMUEw91mAC56IUJuV1r7PkiTRpoaumEm10REjRKNIk+2fygc4cLLcs64RHEjDlYw5mIt2bSleEkNCJ9pUJ6O3kHV9uyYQqpavUSZqtAZnB6HqN74pBaGt/Uc7uMJH8rKqBeWV2YM63/oQhtRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871408; c=relaxed/simple;
	bh=2AkdzRnmL5T+RZcw3MmpOYilK3euYG9pegJEId0J5As=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JZURHMD1Ya/nLKluxlTdcm0czgu0rHq5u5HRg8eFGTo1ARm45BfuZ/zmP1pfzsvhXg4tgR3XfUXSYymCMw+GyVSjO5FcC0LsEvPrHCqyH32y/Z0VzSuPlCFE62CL8Kvr7iIRkAzcqwPjwIXJWG4CFPUb62cLziArRQ72qqMwtVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lrLKDwfH; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lrLKDwfH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EubejKUi0WBIcrhxkYzA48o1GaLm9iHaEn5nvedaK7JAnSznXye0ikqof7DfrPKlxv90xebPxRiwIcmBiUtBKslQrFnZVfsh7hlJbx2Uqu5I5IQWdvc4TGdGVP6i9FpIKpmEwhZKkBx3aAvbN+ccmCK1JvuDW6zmDm8jsth7qu90msYCFTt14R/mqEx30U3/HuWrPweeserOIkPN6yAvKYadFWfKADkbzFOYG648813SmGwZDdy90eORlpVIV2GjmD8CTpc8sKKAm57nIuU2DkDMfZO7tWE9aIBLC3duxoJWEe9RCqMQbL+2iZl2/QCHQOdkcAujDotoZWQQiiBBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E48bo74Y8Fz/U/5GWdCwoaBntEo0CDLYtxhhvHOqEM=;
 b=wSq7GVrVxwDZ9ArhwKjt907MDsKDpS3whi/YgmqsBHFltrc0qr5WDguPStOGNPeq/7/Rovj4QngkHOovPuNywe88MZbP7dk93iVwBypvDejBC8N7HnveXuIOlC4sUus4T0RT7ZHVFxjZxpYpHdEN/un4bXvdTy1rWRtoyc1PFqp28Bd1wHNzcRsGYRxjiRzZxbMQTRYjjl0fAOdvLUgKtn1LWIunz+l8VqdiOKi4qhOXU9iGvR/ThrVq3G6vvkPUe6pWURh9XnSF5h/4+dunZ9uGfYsRefu4Em6PCEct5mG1NyIcybBCVDu12LLl64lzY4gJ5zNcoO1kghkcsvrEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E48bo74Y8Fz/U/5GWdCwoaBntEo0CDLYtxhhvHOqEM=;
 b=lrLKDwfHbsniHsnKYin4M2fhB8Pct79y+bKWGxkh82yOds1prjp02IAK9RE9SXER4BenAtJS41AiXoD0/tyNm27LdKlJRehjb0NdWNiiz1L5aMQAcBNOvAi4n47u/GwZo4cq2bZK3gkZ+G/OY22FG48HTW5618u5T/Eo49fZP/L+n8HQybvTZ3O+9lHpZPvaDmg9Nwbti1SacYHwz9Z8cLltQYsTqaHIdaky4NTQHqIhsqLbyMsaE2c+dWohycGrviZ9AQlZuh7U9ksSVWLZAacGoNcQAcT5+uCUgzn4jKBi2fV8H2e69ZlwCU44Qz6IpM85YF4MR3X2nmJ1c1rB+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sun, 20 Sep
 2026 02:29:37 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 02:29:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Peng Fan <peng.fan@nxp.com>,
	Li Jun <lijun01@kylinos.cn>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] LoongArch: use assign_bit() where applicable
Date: Sun, 20 Sep 2026 10:26:55 +0800
Message-ID: <20260920022659.3145724-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 118ae5f9-eee6-4dfe-8e70-08df16bf03f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	RShOrt/wk3xi4xTxIKXZ+Zfgo+Mj5i1d2U1pRTt3xDuvUUWL2I+M7REe8SAKRsAs3aQ7Sv+fq0gCxQbyWz+KSq8zNTxzX162PvGgiEpPvw4YGOovjvqBXE6dUkNiUIM8KI0aJMmY+JPSJxQsgfHMUihjL8ufu9N42dcpCnpnXOfFgKP6/D+JPYYBt+GnL+OoDNFFomt2ejdGJrBuoe/iGvwGAwjSTQwI2VtMhO1v9ZXhYxSfwApEf7eBWrDhaGAlahHTJzW8BqTHsyb08sUwXGiy6lR+etWe5ZgoaKjF8o5Tp7VL2RLsCo+RDtM7cJiIvHYdoPoFxBqc103GuC+zakRXfLQyoBPTZThnioOWkbATtmq17dNjuz8UfvGjA/M9lxJAKdlPYv0YdWpgDRKZGsrki0VKSIVGjNHi3PY8TqdqY8o1XxUQ1OH/um9zQhzwVu8m7h5kbV0+w0CJ5TwOWEeTdQHOUjrHquPUJqWTSbRgYf4ynqDg4gfj3aWI1kB0bIj/IvP+dw+wzFdcYMg8TtkRJ4q0kRLm/wKLutFFctlfn9LdgYimqH07upxSH3gGyQX0vwb6ihbnZVBuz2hfpAzKiBvLH3Floi0txn9BkVnG03rGGwzMbtPdSfib9XNKeDY2rdcuPBhqHXzihDLoqBlv7DrlPAa6GqV0Tdh7qoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tivpp8mKMc4tB0dPiQpY7wVHR+F8TIpHZaWoHhvzzrTC0BEzXDi0kS1GH9RM?=
 =?us-ascii?Q?Edg+BABQtPmjJqnyrMlsnc7EXJRmMs5D3iCPRopkMshJklaB4xmJcgUVibsK?=
 =?us-ascii?Q?6XVPpc3bbPXlHCp5cndwnc8vr9WPPo09XTvPL8fN3jcLvKHdkLN4o3o4zyMk?=
 =?us-ascii?Q?fZindihjlPdmIwvTcLu6iU1kXjoWFo1VMd91CH18h/8nSswNKAmGeNpsivPJ?=
 =?us-ascii?Q?R/+x92GBYkvsiKtggW7pWKgT3FZ3DvZzMprFYYEHdw7MWOpJkM2qAfAg3BUK?=
 =?us-ascii?Q?euOO3jh8Z4hVnJf9+G+BwTny4UKivnTY12QpwQ/ZwVpIsbromAxIqsIWTaGp?=
 =?us-ascii?Q?xkZrHn23fB4Uo5zN6mXA3+NsNA66JOLphbsGavKFuAlim7MrAzZ7ZFv0QhPA?=
 =?us-ascii?Q?BxzslOL5uUo2A5rhuAZZzKKmc476TRGC9saJf2GDWUlGXqT0hd2xJoLR7hIr?=
 =?us-ascii?Q?ijoplROvImxmottJu+Ksf+lssRG5F4EiCGONm9T0i0Myu+Qp5GGb+aGCgr7M?=
 =?us-ascii?Q?7DAXyLTxHPsvcDHe4oSf1U28d+PekhDeE6BDj14V9LhE6uJeuNxSOtCjT63b?=
 =?us-ascii?Q?8JYkT2CreL6qb/DNeeuYdsDfy7HOm/muq9eVYCkNxtYcgIGxsz13wIx5urJx?=
 =?us-ascii?Q?bmDB7YeYtssEX6aX5fw0/QQ+x4uFVopiozw4x2iQ3s7PrlO7N5qX5C2f3bYR?=
 =?us-ascii?Q?WLN6XhfVimAWFwKwKRGlYjAAoVzt6LxrJtODP3nUbSA7KvPXE3nqOQLBkypI?=
 =?us-ascii?Q?RGKEAtgXPvbwoy1A5MZ8L6c4pTPK8eEk86h8Vf+sRo6I8r8VeRpDdcnd6t1j?=
 =?us-ascii?Q?hlokBiKd7GgWkiTK1WOZwrvu1A++S0kkVGmjBmlZ/Vov4jWyn+DYbvqq4Fqd?=
 =?us-ascii?Q?7fY+baIBO4TxAX5+Pkg09sKUeTqPNVCZrqHFVzYPinGA7IDIXvs10zXoS4ya?=
 =?us-ascii?Q?oJaLPvPgMtoXYxP70Y6gIQamyp6XVoLRqbSFJpqM67ShvRAM0QwpNAPXyGUz?=
 =?us-ascii?Q?D41aiE9vJj9W1UY84fZWTp4GZssR9QFAS1mYuyESYeEnfMSXpPr2sk1JjXtp?=
 =?us-ascii?Q?RX1kahdBQOvEM+C9yRh9TQ8kEBvewsgNnOumBrOxYxI9GmU3jGIWfVjwyJSD?=
 =?us-ascii?Q?7xGF58IQAVh6734RzehvSt4fCH+H3lp0+5TWY/NzaymvJgeCd3+Y4RJLE9nn?=
 =?us-ascii?Q?IBXlPRKXwWv45d02aqfI5gXbDUQXcGrWU1bVWYyPvrkOFoliMJX+HfPMrkjk?=
 =?us-ascii?Q?j29W0YbuX2kQSlfYMzGGC51bXZrepyBkfE77a31JXfwo/uLZbDgPbLCOgYF9?=
 =?us-ascii?Q?T8lRcZpEG72vPxBPpgf+1Rd8uZR8nyCsgHnN33IReaF7z7SZPM40Gi8bFO/w?=
 =?us-ascii?Q?dTCP4uoztORb5Xs1iV0DOxvakTpODIS1TjLa5UTEctzsrKop9XDc3LbLa1jd?=
 =?us-ascii?Q?n613XdXWEqkLJCUQhL2Kwo/a664FjMcezYRiqRDT5GkW50fVdHGYZgoiHk2W?=
 =?us-ascii?Q?82nQTs1iJIDGtqAgvRZks3u04dlMUutkVvTyHqd1MaYCn2BTvcQhYsBHpdVq?=
 =?us-ascii?Q?AfkRV+JtBSgtDyuLghbQ6oVhorQWlVZiSEZ8x5qsQ/T0ObpnWv2FtOo3kwiM?=
 =?us-ascii?Q?ztFlAtx9+uXiPbLCN9m1qnCFtvg/ukLymt/ZB0DKwIXrgfDyIrLCC06faCm+?=
 =?us-ascii?Q?E1PcS4lFPERk2T/fpKzsNZmekFBWbZKpbwVfIser8CRwyzYH01M+rc29fw9M?=
 =?us-ascii?Q?OelxxJk7idgaSruxdDSaWvdOIOfKaPCUXJauzFbOsBUxhFG8fbTY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118ae5f9-eee6-4dfe-8e70-08df16bf03f0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 02:29:37.1572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nDymRBA5e6n2+CLau5/M++UDEhj9O7eEM/L5FsQOGUsidty6OcydV+KxMiE54N/xe2eMy5pWMNMuoFyN9GuXTgC9ep/gmkJlD9ScTdeg75iKG9AyVMe7B8Lqo1IMP1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/loongarch/kernel/env.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 652456768b55..c529a14deb18 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -25,10 +25,7 @@ void __init init_environ(void)
 	int efi_boot = fw_arg0;
 	char *cmdline = early_memremap_ro(fw_arg1, COMMAND_LINE_SIZE);
 
-	if (efi_boot)
-		set_bit(EFI_BOOT, &efi.flags);
-	else
-		clear_bit(EFI_BOOT, &efi.flags);
+	assign_bit(EFI_BOOT, &efi.flags, efi_boot);
 
 	strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
 	strscpy(init_command_line, cmdline, COMMAND_LINE_SIZE);
-- 
2.51.0

