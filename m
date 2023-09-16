Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3CC12B85
	for <loongarch@lists.linux.dev>; Sat, 16 Sep 2023 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694860026; x=1726396026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NpYRpck12yRE0afPagiZhDKRlGxV/J6TEPLL4JmygBU=;
  b=Oc77vApgbZ4dQbIGG2GyIc54UNb0vBeD0aLJaFGzqZ/BxdZVnKsune28
   8/wIuW9n/w1UppEAVctibTTH8d1Ak7yMBgGQS60OAvyfeVrbACR/gtsnb
   vbK8eSxuMCQUGfaf2Sjrt1u2xWguqZ7T0SIx59OeSz+FxMNgsFLwYPX/D
   zTdZrQLv4++3/r/Rl7PuYmi/vFMM/ooW3ay0OhawAUY48vIwGkS8gYgI6
   gbg3zwr+C6Qim5WeHTg3oh9xKJDirLO6yVcrnpoCVGtZMKX4ddkWEYQ5j
   oFZ55JCTREedqok+G+U/2zQI8shcPIYfjB6VYReo9Es2l18cGHetVfkY7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="410358059"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="410358059"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 03:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="695000890"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="695000890"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 03:24:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qhSTw-0000000F5fe-4AzJ;
	Sat, 16 Sep 2023 13:24:56 +0300
Date: Sat, 16 Sep 2023 13:24:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH v1 1/2] LoongArch: Add missing headers
Message-ID: <ZQWCeI6E7rm8Akbt@smile.fi.intel.com>
References: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
 <CAAhV-H6Q0sirFEDdc1v4BSfDY94eZvJazy0XLKM8V94GMJvQnQ@mail.gmail.com>
 <ZQNWh2DY319jGbfq@smile.fi.intel.com>
 <CAAhV-H66LUWHP-eGp6VGvs0F+QD=QJ69uR3_1A3SqH9cyPUPoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H66LUWHP-eGp6VGvs0F+QD=QJ69uR3_1A3SqH9cyPUPoQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 15, 2023 at 08:36:24AM +0800, Huacai Chen wrote:
> On Fri, Sep 15, 2023 at 2:53 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Sep 14, 2023 at 11:25:22PM +0800, Huacai Chen wrote:

> > > Thank you for your patch, can this patch solve the problem below?
> > > https://lore.kernel.org/oe-kbuild-all/202309072237.9zxMv4MZ-lkp@intel.com/T/#u
> >
> > Nope, this just adds missing includes.
> > No functional change, so warnings will still be there.
> But I think a patch should solve a problem.

No, that problem is static analyser concern, not the compiler nor linker.

> If we don't get a build
> error or warning without this patch, does that mean the 'missing'
> headers are actually included indirectly?

I might be missing something, but I do not see any build error in the above message.

-- 
With Best Regards,
Andy Shevchenko


