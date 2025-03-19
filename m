Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A71252917;
	Wed, 19 Mar 2025 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379753; cv=none; b=jxYzxqB3U4vWosfBOiBWesbh5XiQSvSFok0WZl6VXvme33nfYKahcKuPrErUsCVJS9919KKn6O8nJesYbgTxHKlGWso55p6iemUg9iwSau2vSRkK8BSka2Ypp6y4vxFsPMc7/jGAQ2iEKVuSWvvftQsMmIk6U+ZUJ05wvV7Mr2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379753; c=relaxed/simple;
	bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoOo1o9Ut1nfwm8T81w4ovRivqmQ4dbFBG3bB9thira/ozEHIw1pJOJfJ3uLQIeANICUgWUZEY9ONcJIANd59DOCTr174MbbJo+ehOarCMEr/uHHha8oHj1maJs19KLYzYejGCt36j2ByXRlha/VFrl2NoD1/gsZvHobdavYbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2qlFY1/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2qlFY1/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2c663a3daso648212166b.2;
        Wed, 19 Mar 2025 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742379750; x=1742984550; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
        b=g2qlFY1/ZhoxNlQOyMhAiLbptTbDMgFh1rQHeh+qWdPKyzBE/u/QJP8vfENVmzAVLz
         DpyW4+n2deDNJzrFpFksmxbSVfEMzPQ+WSYmQ+9wDzRvjrLTYBlETFLMrMfwmVYPfccM
         xGr0xR+jvXS1Ut6JO0pMkrMd3v2OKZFQeBdt595sjoWqeXovQpoF2Dv2hUinbZ4xbVEd
         w4qZKSMzV9KOaYDY2P62Cf+1LrdHLXdtavvuNNfh+ALjlnX/HsIR0yrqHMpOhBoLQTds
         fWH6fGfU0P0nrjO8kyjVJByf0ZVZyaOrk0ye7wtnHthcsYI4vjsU3BYNqau2YHzo+KJJ
         Z2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379750; x=1742984550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
        b=b9F120XvngH8G+JksJ8LUnZEawe1/HGTYIxEs29GwDO5KCmzUQQchRRH5JUBfv9mvW
         nVdjLU4mGeu3EY9WvtnVt2IWS9YGMevcG8r96Jaax/D5JS7PVwFvDsiP9sgSlIaT/Qnn
         3K1q1ixNHO8vYFO+OaRnXc3fpbL951YcocO+u0xZ+L2H+XWwTy8ZwnLej/+ZdpjNjgYN
         1o0VXY34D7+7k6oj6tqb4R9Sod/2hrVZibRBuH5BKuIz3MM8Q1plFJJWoohNPqX0+T4c
         pzeseGAJkPkwooPPvurlrdQqhiEwrvi5JtTlMoNtl5wUE0XvbNhyveVXBMLaLVAdsTHq
         wMYw==
X-Forwarded-Encrypted: i=1; AJvYcCUZzqBKqa8yjY3VoDXa8ElnrQxQYCz5Zlm7MfAyvyhqd+295fBznIs1J9hrUJtotQ0xv/7DVg==@lists.linux.dev, AJvYcCX5pn5xw/+BDLgrLbzQXUvJhk7LGsym1XPqKUdL33PrLSisBbqdYOt77yM/ha4QS7tTD0lHo2XdnOlx@lists.linux.dev
X-Gm-Message-State: AOJu0YwwvXU57LTutPID79u7YnuAvcGc4eGxIXgIuaL7Xn2hHHpQd7ZH
	rLp2F2VTAJXIZ7Ou1Hd13wPn9QAjtTxsBK3IT9G7Y6pgmWjaKsRCUnM8qjMUleIy5Qr63+S368Y
	febkSSYXSQO8JkgqZEhmv8EtWnCc=
X-Gm-Gg: ASbGncvnLfRBkC4GGcR6YuL1oqJ5dPsk7B8G+olKvlW0Vjh/gh/2dc0n4JBGdKPeAD+
	lHiPt810i+PTjV4qwqVMHhJqdUTO5r7tqFhDG3yceya3hgHt0BDc++bg4HkvOVe+Wk3nXpzfujH
	zsRcSfSkp8A9Oz7/tgDdl3PmXyTy7B
X-Google-Smtp-Source: AGHT+IFUke584GUxH6BvQB3fX7lUAUv9QcZ9e9muiwjx2XhCfAyl6Rwt1VC/I5GgI047etAZIOOFi7pICkkhLIq8oi8=
X-Received: by 2002:a17:906:f59f:b0:ac3:97f4:9c08 with SMTP id
 a640c23a62f3a-ac3b7de1176mr194902266b.31.1742379749621; Wed, 19 Mar 2025
 03:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Mar 2025 12:21:53 +0200
X-Gm-Features: AQ5f1JplWeGobilHQOGjnSRx3FqTIg2f9LEWqzrz_L_kygQImpD-DssVqoDvovg
Message-ID: <CAHp75VfJPgaGyERBaSxSGap+Daeuy8kOjyjg+QkCtzxUydzHiQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, amd-gfx@lists.freedesktop.org, 
	Amit Kucheria <amitk@kernel.org>, Anatolij Gustschin <agust@denx.de>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Andreas Kemnade <andreas@kemnade.info>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Antoine Tenart <atenart@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach <baruch@tkos.co.il>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Corentin Chary <corentin.chary@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Golle <daniel@makrotopia.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Daniel Palmer <daniel@thingy.jp>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	DENG Qingfang <dqfext@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Doug Berger <opendmb@gmail.com>, dri-devel@lists.freedesktop.org, 
	Eddie James <eajames@linux.ibm.com>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Herve Codina <herve.codina@bootlin.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Chris Zankel <chris@zankel.net>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	James Morse <james.morse@arm.com>, Janne Grunau <j@jannau.net>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Johannes Berg <johannes@sipsolutions.net>, 
	John Crispin <john@phrozen.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Joyce Ooi <joyce.ooi@intel.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-remoteproc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Mark Brown <broonie@kernel.org>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>, 
	Miodrag Dinic <miodrag.dinic@mips.com>, Naveen N Rao <naveen@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, 
	Nipun Gupta <nipun.gupta@amd.com>, Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Cercueil <paul@crapouillou.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Rosin <peda@axentia.se>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	platform-driver-x86@vger.kernel.org, 
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>, Qiang Zhao <qiang.zhao@nxp.com>, 
	Qin Jian <qinjian@cqplus1.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>, 
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>, Richard Cochran <richardcochran@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>, Rob Clark <robdclark@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Samuel Holland <samuel@sholland.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, 
	Scott Wood <oss@buserror.net>, Sean Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Simona Vetter <simona@ffwll.ch>, Stafford Horne <shorne@gmail.com>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stephen Boyd <sboyd@kernel.org>, 
	Sven Peter <sven@svenpeter.dev>, Takashi Iwai <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>, 
	Tero Kristo <kristo@kernel.org>, Thangaraj Samynathan <Thangaraj.S@microchip.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Toan Le <toan@os.amperecomputing.com>, Tony Lindgren <tony@atomide.com>, 
	Tony Luck <tony.luck@intel.com>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, WANG Xuerui <kernel@xen0n.name>, 
	Woojung Huh <woojung.huh@microchip.com>, x86@kernel.org, 
	Yanteng Si <si.yanteng@linux.dev>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Zhang Rui <rui.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 11:30=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:
>
> Hi,
>
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.
>
> =3D=3D=3D
>
> While I was reading through the irqdomain code and headers, I found some
> naming and documentation hard to follow or incomplete. Especially the
> naming of _add/_create/_instantiate functions.
>
> I tried to come up with a better state with this patchset:
> * only irq _domain_ (not host),
> * only irq_domain_create*() functions, all taking fwnode uniformly,
>
> Finally, all the irqdomain stuff is now plugged (and generated) into
> Documentation. So that everyone can walk through it at
> https://www.kernel.org/doc/ (once applied, of course).

I am all to support the idea, but in some cases I would think of a bit
more work to be done to get rid of the of_fwnode_handle(np) in favour
of dev_fwnode(dev). Note, this is based on a brief look, I haven't any
example at hand right now.

--=20
With Best Regards,
Andy Shevchenko
