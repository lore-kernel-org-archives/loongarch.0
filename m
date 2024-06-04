Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D3D271;
	Tue,  4 Jun 2024 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717463244; cv=fail; b=ATC5ef1GCigDa7y/+idr9KLz8HBsOhBj+n0GeOr+uqX0A5OYVJadhsbkazD/XgeRjNAy4fWSHC7HERp0OQWOhwZRmvcesnHSEJc0H5izJ0XFUiDHwDjWdOv0kWuT+8DuZfd+qaSiPN47usQagwL8Jd6lCPoUjAxuwt9EnXi7jrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717463244; c=relaxed/simple;
	bh=Ar2RFHbYxLepWfn+zq68NmIR29RxwJsEf3OzHkiQYrY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oyIMBNqL+aj1XqtkUc/E5LIfAJx2VVrinGQFbEwDM38pm6eWgr7GlKasMJpT6elsl2nvzklkQF1CxFsBL67ufX7sGyiOGvrkMcccTsiNkR9I+zLfudJz76HRoYNSsfhEgw96Q+yupndmkj6huwbFxNIXDc5Y3pLKbtjPZYi36tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUq1I3LR; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUq1I3LR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717463243; x=1748999243;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ar2RFHbYxLepWfn+zq68NmIR29RxwJsEf3OzHkiQYrY=;
  b=VUq1I3LREHnh8tRk0HnG8VMSWCEx+qKh3u0UE1/Z68LbQ8vb88TSdiVm
   as4Rgat0GgeGwfSMQP4d1t/iyD9Yx3TZT/nJJZwvyNpgNwGYGQn3HDo5T
   7y8la1NqQELMdA4izgqN2a0adjCiI6xnVNF5QtBrzpZcsfVBF+LqgEOA1
   bXau6tdOqQeD2BfuoqhmbA1Y9EXXf4fPTUhTdLjyAVVMifWt+E/nhktaT
   G00a0QKEBMPEi2FvbQEwRaIIp9sN443LRM6s9K+1EDpcrHwynfYAerWi5
   QWNeu1lMy8ZXjB/tx4J23Wpalpz/ZfatdH6nM416HcmP+zu8qLjaFuHAN
   A==;
X-CSE-ConnectionGUID: ntaJZi8+Q0C1dK0yxhmjeA==
X-CSE-MsgGUID: axXNSG8KQ+W+Ip5/cXFEPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13734041"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13734041"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 18:07:21 -0700
X-CSE-ConnectionGUID: /PX7WvdMS62uLjGPN45A5Q==
X-CSE-MsgGUID: qyTApKWBRROtvVPfpIEv5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="68227934"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 18:07:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 18:07:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 18:07:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 18:07:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 18:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJvdUxJLzoiJ1kcbdtcopUpoKySfW6g73tvoT4ppzJl8gTSd0yugYKBc/rH7YDubOZNg+b3kRv/geGRHhFEOecwyRxCcH5WrAKx7kI69J/ku2Z3mG1bEaY/R14i+wBR86INUWIDivBPK/+CHHEo5rkvqSZ5axa5H1nlpINzKLD7dtbLV608xmlcQbLd0Bopn1YeQSy5T+PQ4Kg9AodRsw6G+tGzK3svpIPTT4d5UYzOK8srEwY5IrunyEFT5bBUtmJlqX17CIaXJLPyyMx8qW5iSEsKgSBepPPCOQ+tRDaTBFr9iUhYO+9fBK8GPiRC/3sg/YDyz0Ga8Hlqv8Q6qXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nONNn5sjkvRY0bRJOv7rDgUGwsslVdq7EVLRlJY4tmI=;
 b=OovU00uX+2wLE/rPycQx/OGFLhkB60mGvhllvUtVb8KfEmfUAYMilI5CPTDxhUaFg+qN42zxutZoF04T3fH7hOVvC3tAX2Oe2hXHaqIOPdl9wd1tJKSjEWiEWe3apMPP8w34b6pW6lwhJ88MmV/aqR25hOGJKKSjkIudqcQ038KY1WCPXHDb2J23i+4gzgr5eHJDjy7TlM26+En55Q/Kmg+YqEu6p+OTVMv9oM6qJWfycFgjfiPkGL1PTfl8I7WnaNGaQMXuutlcZqHyEHH8jwFkM+69siX/nlbcvsBdgTHrxCs8qRsU6+2QuO2u9vVw369OXb3juUkRGiqnIUQuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 01:07:17 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.034; Tue, 4 Jun 2024
 01:07:17 +0000
Date: Tue, 4 Jun 2024 08:59:01 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, John
 Ogness <john.ogness@linutronix.de>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<loongarch@lists.linux.dev>
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
Message-ID: <Zl5m1ZlVmGKitAof@yujie-X299>
References: <202405300545.mVqyyvyr-lkp@intel.com>
 <87ttiamkf4.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ttiamkf4.fsf@jogness.linutronix.de>
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 231a69e9-f89a-422e-ac18-08dc8432ad87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?54NwH1ZRO1wMk8848u3LGZbapxxJ84WZABMh7PbIbdfANRerYgkYUMtrmYxh?=
 =?us-ascii?Q?Ws9H23Yayr+QYpb7OM6ahdVpn6E+fZfhuxysqMetRWuIgXN+t9vUJPRArIsy?=
 =?us-ascii?Q?uJUaAb5u9/sWbfjjHvbQtWewgEALIIvdUVvd2MZdMRhObP3t98nbgsVKufvO?=
 =?us-ascii?Q?n6rxYkpjPvA+x+NtmMfu0FSxUgqoKz5v7p0yMrB8VSRE5UOLBgx8pO+wN00N?=
 =?us-ascii?Q?XiX5y6LndYnoy68igRlaXDFlbsK5W5zq9LguLcM1bI2rEW8mWitsNntK4U0y?=
 =?us-ascii?Q?FZrnpdsxXdTCbOUzt5wg/OnyVDnXR0ocuMWSxjkCP9gu70ingnh/YmUkbi1y?=
 =?us-ascii?Q?zwSVLqfmtIBEoOvYi52FUElo2pcoK8QhqOQtJS0RPOGE20Ix55x3ZzU3/4xC?=
 =?us-ascii?Q?qQpy4H0gAViGxTIMDkKLJVASRnVmoJqGGHxd+aL3zO65KhWPxSDhemVN7F1H?=
 =?us-ascii?Q?qoNPMuphmRl+GUKsG20Gk8Z2NmiUhplAnb6HXXB+uGZRiKLSdWhY5i4c9mzE?=
 =?us-ascii?Q?LyEIktKzYNMs4doCiTkHt+PobxLdwXA6b4GSRS7ZJjz1IxKxGP3AUm825xEy?=
 =?us-ascii?Q?7yZ+WwHSk5NSzeLn9wHnXwAUvg1RfndowapmVbdN58YDD/h8qAODQ5VocPlx?=
 =?us-ascii?Q?cvnMbQxORMRQRnc3ACUU2wjgh7fq2qUPLQ5Lpt67n39PULkXR5j5mpc2FOZ9?=
 =?us-ascii?Q?9KnSmk/PtOXX0sFTFz5T1VjQKTguaFs0GP4cUcf9whLp9J+xwPWDKAhD9BRB?=
 =?us-ascii?Q?dhrmzAzdHPPy70LO2jPo7EyvkVNv3uNlV5UE7t8ip3rC3aLIAGFq1+a4fL6e?=
 =?us-ascii?Q?V6uDiXRy547/fumsZaXibrcRxON+hqv+vRruw8O4Zz9V1I0e97ZIuDD2cAfm?=
 =?us-ascii?Q?6s9LoB6S/QmWGEA2EepMNY5NBNr1JO3GQ0hG0p1abfIbdPRSr5qFJw5YzyEd?=
 =?us-ascii?Q?mq6RrjzBX28rIDKxp6NOfSfwwcHL4+bsOf4PDGXBJpe3htry/fR/ApVgPy8O?=
 =?us-ascii?Q?bCR1B20+fpergUo9PCCAyzWwKrV2ttVtLDRUOu62ZmA83MBvoGoCt0sIhLEK?=
 =?us-ascii?Q?gjqgns3eswSxWne45c4MAdpp5JCXqiGerusbLLE9HCCWfnEoi8+SHS9VXA5c?=
 =?us-ascii?Q?mq/9eUr677wIpc6utbA5cWb0lx0g60v/u63bs+MfHGJAFl/syc4kyAcn+7GV?=
 =?us-ascii?Q?cI4Ogoh3fbbsiVUSOPo9N5DYvKDq01n0TZXC/UEsFc0yFbyoZOmk9iViUDw?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F7zwzjr5ZfEAnJbaLxC6gg2YZ8+4Hl0+N8CrgC5qH4FxG5Mr2Nd7bKz0zPid?=
 =?us-ascii?Q?pd7lab/7oPEJCOK2iOTkgN+fLZ4rzkUbr2OCLHZtBud0DhZJB0eWA4VO3zMd?=
 =?us-ascii?Q?MgJnRGdIgY/BSC1kiyPXt2qT5RAZ/A3yffL7BdOgcLFhcYnMcQhUaJOY6FlB?=
 =?us-ascii?Q?lu/mhbMX8c4jv7AQ9yItYCIOhuKGwz4zPuGCJ/7HbyUif0tCDJboZVAMxZkx?=
 =?us-ascii?Q?//OU08F5rUu9OuNhj+Ci/EAvdMit6VXvXQBcrLRwwKTamXaqJA/3gESPPAtg?=
 =?us-ascii?Q?5NNN+OON7yWMOOvatSPMjOkcnNCOjbGI0XvRdX1m5LBkgjeo8brU2YrpyLgV?=
 =?us-ascii?Q?mszgShRSZs0Kk8e1ZWpzs9ICLrCfn4TzrBTjebPqdtzAKtVEDwJPx4lQxTev?=
 =?us-ascii?Q?cXYBxDdQ2haWHEJyJSFyr6NXBsrkzKyfJOwyXRqUzit1CxUzPcTaKEpSDYYP?=
 =?us-ascii?Q?0pCxuovFZBkfDZg+1pUHtnE66nfz/y+qlsdAHvibGF+T6OYA7B3UtUQ7RJeK?=
 =?us-ascii?Q?r27zHk2TX2ko8omk6VzBQLZB5DyoOD3YhLzV2EZNnfGeGAvgZBor3LER0V6/?=
 =?us-ascii?Q?ysQZDgmZEQC4r7RzZLOj1lS0fB4WGYS5ua7YE0cJ5sFyFWU1illKxRoyWKDT?=
 =?us-ascii?Q?ZuTIAvyTbWpwa2cdxCjOS5N/k7sJhavDeEkE7+D/5iR9KK2axNVJFJdkxFSj?=
 =?us-ascii?Q?ht1IOSK+HXE6Ulfpmsz+qZHvII4JroF8CzNB6Sqc82KqlcuVrwgV6Jd6MHJ3?=
 =?us-ascii?Q?6ft3f/WQEk9bIZqbZBV+ro1PZfFGVb3iIUx7msCafPSUuBL+japRrLPUNgze?=
 =?us-ascii?Q?bfNw/Y4aOVnDYsAffMEJVgxum2V/7sK7D+Bqbd6sSgIUv1vu5DZM2yQc+2EH?=
 =?us-ascii?Q?BCLXyMm1tXwhuWC2ylJpFiyvD9gX8Lke+OTLKaGQUvobE7WwaxN9G2ARU+ED?=
 =?us-ascii?Q?8lvQrYIQn02aa4OJ06RE6Koz/29F3nu8dDacif4Icurq6RZ6Zq5MdDvaeVZ7?=
 =?us-ascii?Q?lBF0DpVG/Pyyg3+yW/QRFWeFwlrjqvyHP2SzuC8nJmHIIiiI4rHGNoGCUZhh?=
 =?us-ascii?Q?XxKzP8J4lOJPBx7z9ofwE3qCSDAwaDwNWof5/cYj10/TZvQn5Rd6TNRa1/ZT?=
 =?us-ascii?Q?5Ve/QY/YfnLkehwtMKloRR+B9vtzw0Kg6l4z5otcgt1UZUvnzyuBlwqF0R3e?=
 =?us-ascii?Q?D2m6DVGKXZELX2gWcMQ9iY2ZWnskZzu/n/0jhWvqxW+wt7ELWQk0A5OmafVp?=
 =?us-ascii?Q?Q0QIbPzChL+l5ij6XLvwkvrLD0YwhkFfaOpd2EPrtUrXstRqOHucXG4OInzz?=
 =?us-ascii?Q?Uyf6N+aqqMzxdcHGWAc62TjhcNDolmmTFq/9yghoADf1H0ewfDnz+iCYxUnh?=
 =?us-ascii?Q?o4ztmuTem7RMHUkd8n+OpgbNKtOeO/vbVCNsWs5cEtaK4mB/L4viOuUX+qyW?=
 =?us-ascii?Q?lQnAj50Hu6dkCm+/Y8Z+f500eD35PuFxBrpr/HJghLpZjL7SLDAW2cVctVJU?=
 =?us-ascii?Q?nlDyRev1BfdXZS2UmGfpyp+B8K5gR9EZblV5hQqolH4X/omws04nnJsfmC8s?=
 =?us-ascii?Q?Qcl72XOcb1qqNK4hjnh96pp5KxNy37UpTNQkjilu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 231a69e9-f89a-422e-ac18-08dc8432ad87
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 01:07:17.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59YrKbAGQW8v1FCiqmk3sOA5UEdwBa8e6ERUouF7NsnYB1mXMfE9kfox9wu4HquM5ocs3pv0X9JAnyNvxn5LKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
X-OriginatorOrg: intel.com

+ Loongarch folks

Hi Huacai and Xuerui,

Could you please help take a look at this case? Thanks.

On Mon, Jun 03, 2024 at 11:48:55AM +0206, John Ogness wrote:
> On 2024-05-30, kernel test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.10.y-rt-rebase
> > head:   6d20efa57a896036453f4b061ae22601ef61b494
> > commit: 127f3e5b794bd6fa90d4649318dd898455efa6d7 [63/93] printk: Provide threadprintk boot argument
> > config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202405300545.mVqyyvyr-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> kernel/printk/printk.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
> > --
> >>> kernel/printk/nbcon.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
> 
> On loongarch, it looks like all users of the jump_table are causing this
> warning. I will assume this is something that needs to be fixed at the
> arch level (either in the kernel or the compiler).
> 
> John Ogness
> 
