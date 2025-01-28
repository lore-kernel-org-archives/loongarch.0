Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D94F14A08E;
	Tue, 28 Jan 2025 01:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738028672; cv=fail; b=mw6UKM0LpA3hLJHOcMlyJXVS1wC3YKRfNYQsoQDwgCcBCQwLZ/fUjjdxh8+br+oXQHhMfGU36RTkYvuz+HUDCb06LwzMPr7VVTrDC6aI/iVZ9s1ZTPLCt1iirwFY54JPc87FkiPN5vGCdgPyWlZQw1wcX+B3MGOL7u5cmtd0EqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738028672; c=relaxed/simple;
	bh=DjvrRJ5aFvrtXfr7bRp9roNPr8nWFzyPhn4nOd3aXdc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TgTnscjYsHF00Vpmw24KoaGcQ3xOMRrBUOgTjXWcObotfzJkrcDd/vgW8ZW/FGU4oar4ILGEk+RieYmedyQlSovD5gYetIOxWZ9gjQFQPJI8owXEeXI+vtz9+cJF575Gq3WrR+5QwbqWp8lUKUchAPyW494ECJGjU+m+YZnOvEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK8Zf/C8; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK8Zf/C8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738028671; x=1769564671;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=DjvrRJ5aFvrtXfr7bRp9roNPr8nWFzyPhn4nOd3aXdc=;
  b=KK8Zf/C8LsZ0vnt84Gv/xRa5Qx9UN95P0C9lsYs1axJAy5hFqOqmtOQV
   GcOW0K3JOXBqJSB55SKIvisDEy/w1geUhjvfQN2/DSGypKccX6WedYbd8
   yeZcon6KTcwToMxYu1km+Q2Apk0SFc/8t+Dr3ncTrUuafogrycgxjLI9z
   PJkayVh3PgLs97sOcUm9LEYQSz/TpvzcFRg7Lyj9ETwyDpTWf1rzTad7M
   P7xGWcCDr1BK1LqBic4BQ2bnU3hiIG3hqBbZed8217Kstu4ELCQ1sR5dt
   /XZP99Gd5DRmYh91VfCLy/OhSNUnyUHdKRmMz45XfbMhG++14C4TSQyX9
   g==;
X-CSE-ConnectionGUID: m5tvmZXEQu6Vm/gwcMTPsA==
X-CSE-MsgGUID: gtmGddhuSU6HKel62WHBvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49493741"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="49493741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 17:44:30 -0800
X-CSE-ConnectionGUID: 2AufEtWDTauoW4ztF5Anlw==
X-CSE-MsgGUID: 6CkAgCS+RKa13NpU/8UZAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145812095"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jan 2025 17:44:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 17:44:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 17:44:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 17:44:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwJF9xDALsy2HtSJcQk3YrI+3+zdcfIrpILHiE0V1zKIbWKzMcbpVoDqzR/ixxYEU6J9KLfDPTXedDqUBfmuan7xVDLXFvATiAc+rgDpXFZbLK485SjcVhRV9HxM/HaKoNxBAaRb+O5F1iDkNRzu6/a4h3RSdd3XRa98WLeZotJGF7CJozM2kCTmmyxSg+55qOxNtneu2sZXdW+DYjrlmijYg0RnEPr3eX7Q3uwuyX+rT9MDVQ2Z/iF4DoprQiWjG8xqJk046JxM8hDsLwhfRKxFr5BJlI1sF+OmMbA08DMB+esVTJw6lmGnW4r3CaKG1DGuP0gnkMtzb82DQzTfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cFM0ae3ZjlM0oWJPo8LV/Neys4/plG/u9D4TfMlpXw=;
 b=FAFjvtkXkCKRy1YIYQqOEXAe+41lSkdtzOlDC70AL8vywv5g2KGTAa0F0VNsBr43iaOxeTIgef122hsWDrioGbI6+9eEb9agI7YKrrGpFZmN2eYj95N/U/lwESlp4AMkLXNJaTXCAYcAjEEZ85zkMPS8eul1JuOsrOxaoTb+RrIw0KwCfQIdAZ57oo4NKOJvtPoHu65XcQEUVBmvImPyRtknfbAJX7wgPzu01ycEFn8qWAFnCO3LW+N7aEUma1GAQARAXl3qbayZrBpKv1IOUGAsaEmXu0Kijec4ivmaQ9Z0mL0PXBZyUYjw/At644XHANRUuhz0sd+nhBJxmhBknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 01:44:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 01:44:12 +0000
Date: Tue, 28 Jan 2025 09:44:00 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<loongarch@lists.linux.dev>, Charlie Jenkins <charlie@rivosinc.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v3 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <202501272352.d9bc5c3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250124-riscv_optimize_entry-v3-4-869f36b9e43b@rivosinc.com>
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 447d692e-8e9f-45cb-21da-08dd3f3d43a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8xumE0eS3oaNE1w8PeVL4aT6fVjmShy+Z/KYL0jyb1gIES3JkASzmZxp36oI?=
 =?us-ascii?Q?gW2QAoNxtFooMGiHCYGX57is0tWljiKd6zdeTiCY2vVk+otWf/evjKsyc0aE?=
 =?us-ascii?Q?7CMA83mH1+TvG/XgsSStkFVfx3JWkF0GrvqQXL3RLMdtgS066QiIR/5+DV10?=
 =?us-ascii?Q?MiL7KUbKHyahfrQa1tjKJCdv0twxcpuphVd6OIQCjNwY6YcnLNIpNMlkRQuY?=
 =?us-ascii?Q?biTmBTsCVG7QWMWJ4pwhfmyEyLO13Ou6YHtmUEClIjteqjkq4Cyp+TPiWRT5?=
 =?us-ascii?Q?uzhvgoVePwCfNWy/bxaDXd1G5Kb4gzM6proVOnTkZL1BW7VohI9NSRyUU5EG?=
 =?us-ascii?Q?ml6gNgSSDQU4wkCGUKyrv148en8dRh95acBCxIoPouaur4oZ0Frwf2VF0Rx7?=
 =?us-ascii?Q?+n3BlU9/+Ywu4H1DhJXfct1xwLnmfJuSEebWpPMECuEAx+Ocq3R0tCekL0mB?=
 =?us-ascii?Q?47FXnd1XfPpzgpwPaEwBN8/gXxor4Q7gBkXb/SkY+DWIZ/1gbsXbjAQPbYgg?=
 =?us-ascii?Q?YUcCg/n8R8zDU9pxNPN+1NDghojc3ljcDOdQXL7zCV/rEa9MJSVdmrb/iwp1?=
 =?us-ascii?Q?CTwAzMjCvTXm3yeiBJiBWe+A+4FOD1paiATm3GZSfoDKGsZ7Dgpx4eU3ll7f?=
 =?us-ascii?Q?dKRzdm1c7jN83AQjVryHwjhzPdBsPwHIM0yXMDIqcyJlDFgIZi7Ns7amYkxh?=
 =?us-ascii?Q?4aPQ5N9X9J7Qgld6lFvgjtcwadHlPeJ12uhD9ALCHYEiGGJKCJ0T8Lsq/5Vk?=
 =?us-ascii?Q?4wOOvs4efgUdjz3EBYDzNY7hUrqs87Mup5HlGgF58wCChdcXbHI99wvDjLr/?=
 =?us-ascii?Q?UkD5oOsAfwzIwRMrOoenohbDRXiz3SGuAhVooY1NQFTW5mrPxxUrkXo0OThN?=
 =?us-ascii?Q?xv/hDvM7F+UzPn/rIzUlF9QJBqKNXj792KP/0OgA9e2CHY0uwD0Q6kL/QTwp?=
 =?us-ascii?Q?8iy9yBIh+wINjpNtR3nu5vSh8zPn0JBphQKFoA+WDCAVz86SE6+VbdkwXBbF?=
 =?us-ascii?Q?/F/jEPKlzj3vWcsSG7W/NpaZfVjjdbLY0oCORiME9o4Cx/vtTme43/SMVY62?=
 =?us-ascii?Q?G8cOek9wsPRqXUopGxgsQm2AQQP8NpcvMBBgXUmUplr/2nWbH0WGEAPdjkyj?=
 =?us-ascii?Q?Px3Kphj2PV4wfYO9OW7BiK9urB1P6rvAri5Ay64qLfZhrtxYbim/N4XbqwEf?=
 =?us-ascii?Q?lrU2Yowfei1IdLWXqy3L4YuerakJlL5dyGK6tpdIV+CBI1YpBcwKW8vnXKyo?=
 =?us-ascii?Q?Qe3n5tVCVtzOazGTO5SE8F1z/zP6PNYGIq+cXVoxelWXUzTmEWf1OrAfpfq2?=
 =?us-ascii?Q?Ooix3HmmRpfy3xS7QceM08VulzQPtcUveiy1qQNfIcJstQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96arG17n4SlQUszzhevC/bejjoxivZzGJl6y7jVr5E4T4KnBIeFitYXEirwx?=
 =?us-ascii?Q?LvIz6x1Z75N08kFPFjghQQ/YLq4IW7tt6gS8t/WMjerO989M1vKc3IvNjw3V?=
 =?us-ascii?Q?Lo7hxN6n23tRTfeTlDPpn/rLxxKR0s+FkiXNfjAkBGhVjIrEFQkLO3fYtgF2?=
 =?us-ascii?Q?cs+jneN7OFtZUF6WLZatY4RfP8CAJNqf95TACcsuWGyN83XNt15vrtJTGXV9?=
 =?us-ascii?Q?9+tBGS4v1yGXkzkzUsBsqJzKNZAqqXfPR1cUjmltliE9dYMqDXPaZjXVoBjb?=
 =?us-ascii?Q?189XrGGBYGU0GIfsJpXnhKkFuCkUbKmQdll2GLsMYVfuJwN29tgufS3tOyuD?=
 =?us-ascii?Q?jqH026XMT5hd6d6EK8ZlNvx+eZ1j+qyIZf4xOHP8/Z9inF3vIgA0wmEVQASc?=
 =?us-ascii?Q?0ooezDWSnx1MLtRVHTUS5c9xlxJUF2gfFlL6mxDw6MZXpqtQjkvzwTHTW23J?=
 =?us-ascii?Q?rjtiR+NA1uKCTNmGCJPEAYwFVLawezBlsXwYfCzNLIPJ5lrBvEwUYSONYHvb?=
 =?us-ascii?Q?jKFS2b7xRhcRS3786miZGHrpptfWUqbNxcAkw9j23YgYFKM9qsLNUbolMpwT?=
 =?us-ascii?Q?paiYa01S1/YGb3eVT0JdJmO7AEaPk1B/Et+S+kEGz101Mv9tahrZTH+L476Z?=
 =?us-ascii?Q?EFw7MN+DlcUR1oREcqEBtgcCJ2DjGL00HAQA5mI38M4X56ZLlshkHoR0UvIS?=
 =?us-ascii?Q?sGZLmdEI+fzN/40oqP+bSfWRdQwH12TGemKTbpzr5NgkAdh7mdsPow1KJbCZ?=
 =?us-ascii?Q?VwkO3KSPwnniChTEjsRWaMjCNWRfsonzFIFnfSTfVOVKt/QH+3uuCOBCaE/C?=
 =?us-ascii?Q?+lYVCKe07okk3QGJvgUZTJo2UJOMlbjdQa3oVCmMLpgxgtJA9gTMUgQ+37qD?=
 =?us-ascii?Q?qlR8Gu92SAeaEQ0K6d2kHbj2PEX/z2djE8dqkanojsN5S2FsZ+s+dqmxi5RP?=
 =?us-ascii?Q?SjjewQ6q6u6LtXGI4CCtaxDk3adrZPlHdX8OErYgcrzkTkvrQfAg4wX5OWV9?=
 =?us-ascii?Q?uIdjNuFZpw1xBFStr2ALwnIh29fEM8k9CHBS9NKRIBBfS78+zlcHzazP5dJv?=
 =?us-ascii?Q?P2P6WtgDAqafooke2nphXfwjMfaguC9CwY9LoUBv7ztV97bMQTeKqy2o3xnq?=
 =?us-ascii?Q?bSv7cY/7R5U/xohG7BqnI+BFq1ppnFeSJdHtZRi+wSNfUldBKLdIbETA3NfF?=
 =?us-ascii?Q?ABh8aN84MOb2qTwM8eJ3wq47zdwwG2t6LkJazHHsN9HM2feZOTnozcXTxce9?=
 =?us-ascii?Q?kNQPwq+cEZliGVRVcTMtZaLc9wQ883FDgxm4WOXhMJPjsaBpuYglSLZ778is?=
 =?us-ascii?Q?6IMgxAb8wSSsUqjgBYNXOhqxrlPY6nO11x91yV+tzB7QL5j5GOpvEj65bYI3?=
 =?us-ascii?Q?unSHeTZWjU3cXm7Fsw+bRxqC4fNPNluaufl9CurFe6uCUbafUvbJJAVdBc4r?=
 =?us-ascii?Q?ZIh/TSI3vDkdoTREsMylhyR5iVwJskVwK/YsMBcc5hwUv4Jf/68/BSq/aqtT?=
 =?us-ascii?Q?KxkGu1oOJUBBHJJackjgwagw2nkcpuE3SLnhiUAGveC9XLB6yG31NZkQev7k?=
 =?us-ascii?Q?8Bjr9uFZXFqqBEO1Xss8tDPTJq220GiU7gryrdVJ8s8DTva01P/gLiiIafSc?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 447d692e-8e9f-45cb-21da-08dd3f3d43a4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 01:44:11.9543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyVJXmLcidJ7XXX0XsGm8aJJ0KjI6bXx4GqZuNI9JKHQWOXGL52bIcGz7HvOry8zhw3ThFy1faityZSQyLvvmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_include/linux/entry-common.h:#ret_from_fork" on:

commit: af2a35e015974bdfa788eebda365a2896b2db87c ("[PATCH v3 4/4] entry: Inline syscall_exit_to_user_mode()")
url: https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-entry-Convert-ret_from_fork-to-C/20250125-063418
patch link: https://lore.kernel.org/all/20250124-riscv_optimize_entry-v3-4-869f36b9e43b@rivosinc.com/
patch subject: [PATCH v3 4/4] entry: Inline syscall_exit_to_user_mode()

in testcase: boot

config: x86_64-randconfig-004-20250126
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------------------+------------+------------+
|                                                               | d05f6a7fc5 | af2a35e015 |
+---------------------------------------------------------------+------------+------------+
| boot_successes                                                | 21         | 0          |
| boot_failures                                                 | 0          | 21         |
| WARNING:at_include/linux/entry-common.h:#ret_from_fork        | 0          | 21         |
| RIP:ret_from_fork                                             | 0          | 21         |
| WARNING:at_include/linux/entry-common.h:#do_int80_emulation   | 0          | 15         |
| RIP:do_int80_emulation                                        | 0          | 15         |
| WARNING:at_include/linux/entry-common.h:#__do_fast_syscall_32 | 0          | 15         |
| RIP:__do_fast_syscall_32                                      | 0          | 15         |
| WARNING:at_include/linux/entry-common.h:#do_syscall_64        | 0          | 6          |
| RIP:do_syscall_64                                             | 0          | 6          |
+---------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501272352.d9bc5c3-lkp@intel.com


[  112.344122][   T69] ------------[ cut here ]------------
[ 112.345019][ T69] WARNING: CPU: 0 PID: 69 at include/linux/entry-common.h:397 ret_from_fork (include/linux/entry-common.h:397 include/linux/entry-common.h:449 arch/x86/kernel/process.c:156) 
[  112.346485][   T69] Modules linked in:
[  112.347163][   T69] CPU: 0 UID: 0 PID: 69 Comm: modprobe Not tainted 6.13.0-00004-gaf2a35e01597 #1 214e9f59286a53f9934969c01f519fb8074cbd24
[  112.348970][   T69] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 112.350385][ T69] RIP: 0010:ret_from_fork (include/linux/entry-common.h:397 include/linux/entry-common.h:449 arch/x86/kernel/process.c:156) 
[ 112.351202][ T69] Code: f8 83 e0 07 83 c0 03 38 d0 7c 09 84 d2 74 05 e8 e2 f1 4a 00 41 8b 85 a8 56 1f 00 65 ff 0d 25 06 1b 7f 75 05 0f 1f 44 00 00 90 <0f> 0b 90 9c 58 0f ba e0 09 72 1b 90 48 c7 c7 00 ad 22 83 48 63 f5
All code
========
   0:	f8                   	clc
   1:	83 e0 07             	and    $0x7,%eax
   4:	83 c0 03             	add    $0x3,%eax
   7:	38 d0                	cmp    %dl,%al
   9:	7c 09                	jl     0x14
   b:	84 d2                	test   %dl,%dl
   d:	74 05                	je     0x14
   f:	e8 e2 f1 4a 00       	call   0x4af1f6
  14:	41 8b 85 a8 56 1f 00 	mov    0x1f56a8(%r13),%eax
  1b:	65 ff 0d 25 06 1b 7f 	decl   %gs:0x7f1b0625(%rip)        # 0x7f1b0647
  22:	75 05                	jne    0x29
  24:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	9c                   	pushf
  2e:	58                   	pop    %rax
  2f:	0f ba e0 09          	bt     $0x9,%eax
  33:	72 1b                	jb     0x50
  35:	90                   	nop
  36:	48 c7 c7 00 ad 22 83 	mov    $0xffffffff8322ad00,%rdi
  3d:	48 63 f5             	movslq %ebp,%rsi

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	9c                   	pushf
   4:	58                   	pop    %rax
   5:	0f ba e0 09          	bt     $0x9,%eax
   9:	72 1b                	jb     0x26
   b:	90                   	nop
   c:	48 c7 c7 00 ad 22 83 	mov    $0xffffffff8322ad00,%rdi
  13:	48 63 f5             	movslq %ebp,%rsi
[  112.353759][   T69] RSP: 0000:ffffc900016eff20 EFLAGS: 00010246
[  112.354637][   T69] RAX: 000000000001256c RBX: ffffc900016eff48 RCX: 1ffffffff0aab891
[  112.355762][   T69] RDX: 1ffff11075d7ea00 RSI: 0000000000000006 RDI: ffff8883aebf56a8
[  112.356876][   T69] RBP: 000000000000003b R08: fffffbfff0aac275 R09: 0000000000000000
[  112.358011][   T69] R10: ffffffff8133b7bb R11: fffffbfff0aac274 R12: 0000000000000000
[  112.359131][   T69] R13: ffff8883aea00000 R14: 0000000000000000 R15: 0000000000000000
[  112.360256][   T69] FS:  0000000000000000(0000) GS:ffff8883aea00000(0000) knlGS:0000000000000000
[  112.361495][   T69] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  112.362410][   T69] CR2: 00007fff006efef9 CR3: 000000014ab4d000 CR4: 00000000000406b0
[  112.364674][   T69] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  112.365489][   T69] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  112.366294][   T69] Call Trace:
[  112.366677][   T69]  <TASK>
[ 112.367020][ T69] ? __warn (kernel/panic.c:748) 
[ 112.367509][ T69] ? ret_from_fork (include/linux/entry-common.h:397 include/linux/entry-common.h:449 arch/x86/kernel/process.c:156) 
[ 112.368006][ T69] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 112.368605][ T69] ? ret_from_fork (include/linux/entry-common.h:397 include/linux/entry-common.h:449 arch/x86/kernel/process.c:156) 
[ 112.369094][ T69] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 112.369551][ T69] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 112.370039][ T69] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 112.370572][ T69] ? trace_irq_enable+0xa1/0xda 
[ 112.371195][ T69] ? ret_from_fork (include/linux/entry-common.h:397 include/linux/entry-common.h:449 arch/x86/kernel/process.c:156) 
[ 112.371685][ T69] ? umh_complete (kernel/umh.c:64) 
[ 112.372160][ T69] ret_from_fork_asm (arch/x86/entry/entry_64.S:254) 
[  112.372670][   T69]  </TASK>
[  112.373019][   T69] irq event stamp: 1233
[ 112.373460][ T69] hardirqs last enabled at (1243): __up_console_sem (arch/x86/include/asm/irqflags.h:26 (discriminator 1) arch/x86/include/asm/irqflags.h:87 (discriminator 1) arch/x86/include/asm/irqflags.h:147 (discriminator 1) kernel/printk/printk.c:344 (discriminator 1)) 
[ 112.374413][ T69] hardirqs last disabled at (1254): __up_console_sem (kernel/printk/printk.c:342 (discriminator 1)) 
[ 112.375342][ T69] softirqs last enabled at (928): handle_softirqs (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:408 kernel/softirq.c:589) 
[ 112.376269][ T69] softirqs last disabled at (917): __irq_exit_rcu (kernel/softirq.c:435 kernel/softirq.c:662) 
[  112.377174][   T69] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250127/202501272352.d9bc5c3-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

