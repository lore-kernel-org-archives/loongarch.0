Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0BB2F31
	for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 10:21:55 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1out4b-00084p-00; Tue, 15 Nov 2022 11:21:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E5112C1ACA; Tue, 15 Nov 2022 11:20:50 +0100 (CET)
Date: Tue, 15 Nov 2022 11:20:50 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	Arnaud Patard <apatard@mandriva.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	lvjianmin <lvjianmin@loongson.cn>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>
Subject: Re: [PATCH v2 1/2] gpio: loongson: add dts/acpi gpio support
Message-ID: <20221115102050.GA3167@alpha.franken.de>
References: <20221114095332.21079-1-zhuyinbo@loongson.cn>
 <CAMRc=McnEiSj1Q51pG3Lc8e+HcXE_uU7dm=1VoOa__xOgyoZPg@mail.gmail.com>
 <8b24e3df-8c22-bd09-cfc1-b27e39a05c25@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b24e3df-8c22-bd09-cfc1-b27e39a05c25@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Nov 15, 2022 at 05:53:26PM +0800, Yinbo Zhu wrote:
> > > +/* ============== Data structrues =============== */
> > > +
> > > +/* gpio data */
> > > +struct platform_gpio_data {
> > > +       u32 gpio_conf;
> > > +       u32 gpio_out;
> > > +       u32 gpio_in;
> > > +       u32 support_irq;
> > > +       char *label;
> > > +       int gpio_base;
> > > +       int ngpio;
> > > +};
> > 
> > No idea why you would need to duplicate it like this either. And why
> > put it in arch/.
> because loongson platform include mips and loongarch, and the gpio device
> data was defined in arch/ in leagcy loongson gpio driver.  so the
> latest loongson gpio drvier add platform_gpio_data in same dir.

put the struct into a new file in  include/linux/platform_data and
use that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
