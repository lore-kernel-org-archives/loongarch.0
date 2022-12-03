Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BAF2F31
	for <loongarch@lists.linux.dev>; Sat,  3 Dec 2022 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670081259; x=1701617259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uSf2YHH5QrA+iUzZpxeHz51OuUatV/0N2ramzCq2LzY=;
  b=LT/WUKJn01y+ZDQ0kE8CY9OeXvxLhBLtBz0ZreCJR6VCHp9LWDVHZO6F
   iBkJSNfJ1jDMNeuaiExQ3QR9RisXf7CKVm9Wvx7dMpphT1Ryigu1lE0Hq
   oOdXFkvk18No5IOmdEJNjW0FTTZcxEaxkSvQHav+3U2SXDvMhYTIRikwW
   7icrhqluX3XxGQ06WuMaq/cQCHrsUxvbUQMElFcRr6ag2w06RcbHH4i8d
   xsuAWvEojom+G4BUxE/uPIAnA7riw8i6wmXBxKqMDklZKfEgppCiLcMTh
   5Xy0XFskrQKaimPBg2T8xvHWbi75JFeuDeF9a2C97B2ghw5cbLL8UtMy/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="314834592"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="314834592"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 07:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="787604048"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="787604048"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2022 07:27:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1p1UQN-0042l6-0l;
	Sat, 03 Dec 2022 17:27:31 +0200
Date: Sat, 3 Dec 2022 17:27:30 +0200
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
Message-ID: <Y4tq4i2CJdnQWFZC@smile.fi.intel.com>
References: <20221201123220.7893-1-zhuyinbo@loongson.cn>
 <CACRpkdZm-4-5625szX_VqJoQH1OQZnw+jH3SqWsb9nr3S0Nbmw@mail.gmail.com>
 <35ff475a-e925-81eb-ffeb-448be43f59ff@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35ff475a-e925-81eb-ffeb-448be43f59ff@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 03, 2022 at 06:53:20PM +0800, Yinbo Zhu wrote:
> 在 2022/12/3 18:03, Linus Walleij 写道:
> > On Thu, Dec 1, 2022 at 1:33 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> > > +config GPIO_LOONGSON_64BIT
> > > +       tristate "Loongson 64 bit GPIO support"
> > > +       depends on LOONGARCH || COMPILE_TEST
> > > +       select GPIO_GENERIC
> > > +       select GPIOLIB_IRQCHIP
> > If the kernelbots start complaining you might need to add a:
> > 
> > select IRQ_DOMAIN_HIERARCHY
> > 
> > here.
> 
> Bartosz had merged my patch and I will add a change on top of the existing
> series.

I don;'t know why he had done that, the driver requires a lot of cleanups,
e.g. why it uses acpi.h, what that "nice" container of the platform device for.

-- 
With Best Regards,
Andy Shevchenko


