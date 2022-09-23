Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328A28FE
	for <loongarch@lists.linux.dev>; Fri, 23 Sep 2022 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663923308; x=1695459308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CZ+L8fkLDljH3TQib+2ay5f/ZuvbmYFYzQuFhmMoxT0=;
  b=WKlJm7D7QAPPA3qknTzKsyrjrmxZYKBBU1wfEawvokoM/s1RYhIDiyAQ
   gCHbYaOGL5aS6Ius0pFabpubadjp9NYaE1ee/PQB/aPvYXZ+3m2NLusF+
   SURgc55rEufsW2C9RbagrKdJ14Oo7B2AJdUBjC9RWNui9eAxr7fXHByuP
   vI1mnRP+AeXmYSqUW5j2Oa7SVJoiT26hVQU9MX/ZFvDb7bKaDYVLjUUks
   AwN+k9ryFdxGpUIbW4tC+wp6yRWnr7pMRamWAuS8mD+CG31ESL9ZogLA+
   ssloknFYu7T1TKrFb6AQ2rnzxrASYwnHt93CeDU44GbU7TySVBOuvtbq5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362359138"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="362359138"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 01:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="865226199"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2022 01:55:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 92C23F7; Fri, 23 Sep 2022 11:55:22 +0300 (EEST)
Date: Fri, 23 Sep 2022 11:55:22 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
Message-ID: <Yy10eg4p45Y4M7Q/@black.fi.intel.com>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
 <YyxTwl7mos/hARWm@black.fi.intel.com>
 <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>

Hi,

On Fri, Sep 23, 2022 at 03:16:03PM +0800, Huacai Chen wrote:
> Hi, Mika,
> 
> On Thu, Sep 22, 2022 at 8:23 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Thu, Sep 22, 2022 at 07:39:54PM +0800, Binbin Zhou wrote:
> > > Under LoongARCH based on ACPI(such as Loongson-3A + LS7A), the ls2x i2c
> > > driver obtains the i2c bus number from ACPI table.
> >
> > Why this is needed? The I2CSerialBusV2() resource should be enough to
> > identify the adapter, and I don't see why static number would be needed
> > for anything?
> >
> In later patches we will add LS7A i2c driver, this driver is shared by
> MIPS-based Loongson-3A4000 system (use FDT) and LoongArch-based
> Loongson-3A5000 system (use ACPI).
> 
> FDT systems support static bus numbers, so we want to do the same
> thing on ACPI systems. I think keep this consistency can make user
> feel better

I don't think the user cares to be honest. As long as all the devices
work as expected ;-) And this saves a couple of lines of code too so if
not really needed, I would just drop that part.
