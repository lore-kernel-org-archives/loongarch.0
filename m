Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B7D28F5
	for <loongarch@lists.linux.dev>; Fri, 25 Nov 2022 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669371683; x=1700907683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlLtPQd1Ky/oYGu3/jZlcYF3OqQrWZc51EQgwDV6o8M=;
  b=W4LVNfSHvJJn4F4Far3fz6HYms1CoOV9GVX5/zce2wYaAMGj2S/tCxog
   ek1BeQrQ9kgdfClJrhMxoJSYmVBPhAmxlISATB743mQnQm80FAB9M1dvW
   DHXYnkew8/+zGrKlB/Ks4mpk20qd9ePZGDWBsHOx2UfnnKc2dmII9pMY6
   77m/o3zA0sst1yhUm+KfvU/LNAXzuI63s6iT/5i26wY0+0fLvJlmUUeg5
   bIgqpcysgH89bifEdvT37Y0C1BbVAtKvO1mHD6stTeMagAcZCF2hnktRV
   ln48aJHVnC0IrmUjWS+Q1Jp+ghtnqHlneXL3aV+PQDPBMBNjljVk4KBkF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="312091952"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="312091952"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 02:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="971527133"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="971527133"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2022 02:21:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oyVpd-00HBYs-1x;
	Fri, 25 Nov 2022 12:21:17 +0200
Date: Fri, 25 Nov 2022 12:21:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V3 1/5] i2c: gpio: Fix potential unused warning for
 'i2c_gpio_dt_ids'
Message-ID: <Y4CXHXqNcBJwmap7@smile.fi.intel.com>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <4ace98785f900bf1a818d006ae5906f6b51edf7e.1669359515.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ace98785f900bf1a818d006ae5906f6b51edf7e.1669359515.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 25, 2022 at 04:54:11PM +0800, Binbin Zhou wrote:
> of_match_ptr() compiles into NULL if CONFIG_OF is disabled.
> Fix warning by dropping of_match_ptr().

> Suggested by Andy Shevchenko, thanks.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

We have a tag for that:

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


