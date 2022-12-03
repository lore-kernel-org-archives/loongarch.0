Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9C2F31
	for <loongarch@lists.linux.dev>; Sat,  3 Dec 2022 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670082115; x=1701618115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9CAAZYx5QtB8bGk6Bu4vfzSdNz5rmp6CUGug+ibS7H4=;
  b=J46gmcGeytKgi2zz83M4eAImwjiTfWDUYBgKgj3j8/aReQOhzFC5fJ6b
   CwR5DYPe4Xz/wb8aeupUd2uyt8m0nHrkRYOvRjjEPjq552TDVYD4yw0Pu
   yh5IWwCMrrNs2SSj7q1qgOCRORrbtLeUo8GM6vjNNThBx3yfOKy/Kgw9Q
   2CGHaAkkHGix7g23GglH5VsL9ohroifYjoiz1gtKeneUF4vIvjKVWCoxb
   wqhE/3aH0lUts9Ej3p0t0HHhLLWZoCdAycw6ljr/jjfy8AxKbhifLWbpD
   5nrBV1Ij0qv/GnZRZoX7IYiwJcOmHPia0R/YW2r5aCZ/OnC5ggym/2wWd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="314835241"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="314835241"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 07:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="787605439"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="787605439"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2022 07:41:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1p1UeB-00432n-1I;
	Sat, 03 Dec 2022 17:41:47 +0200
Date: Sat, 3 Dec 2022 17:41:47 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	Arnaud Patard <apatard@mandriva.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>
Subject: Re: [PATCH v10 1/2] gpio: loongson: add gpio driver support
Message-ID: <Y4tuOyKOdZcQ4sjm@smile.fi.intel.com>
References: <20221201123220.7893-1-zhuyinbo@loongson.cn>
 <CACRpkdZm-4-5625szX_VqJoQH1OQZnw+jH3SqWsb9nr3S0Nbmw@mail.gmail.com>
 <35ff475a-e925-81eb-ffeb-448be43f59ff@loongson.cn>
 <Y4tq4i2CJdnQWFZC@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y4tq4i2CJdnQWFZC@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 03, 2022 at 05:27:31PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 03, 2022 at 06:53:20PM +0800, Yinbo Zhu wrote:
> > 在 2022/12/3 18:03, Linus Walleij 写道:
> > > On Thu, Dec 1, 2022 at 1:33 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> > > > +config GPIO_LOONGSON_64BIT
> > > > +       tristate "Loongson 64 bit GPIO support"
> > > > +       depends on LOONGARCH || COMPILE_TEST
> > > > +       select GPIO_GENERIC
> > > > +       select GPIOLIB_IRQCHIP
> > > If the kernelbots start complaining you might need to add a:
> > > 
> > > select IRQ_DOMAIN_HIERARCHY
> > > 
> > > here.
> > 
> > Bartosz had merged my patch and I will add a change on top of the existing
> > series.
> 
> I don;'t know why he had done that, the driver requires a lot of cleanups,
> e.g. why it uses acpi.h, what that "nice" container of the platform device for.

+ we have macros for get_direction() returned values and so on.

-- 
With Best Regards,
Andy Shevchenko


