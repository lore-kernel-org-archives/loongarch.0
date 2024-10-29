Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D704194C85;
	Tue, 29 Oct 2024 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216054; cv=none; b=XtQRWmlz2bivUS66PgPzqkgQ7okU47H1wM3Dv9bam1sZYfuDe2SBOmMFJMrMtk8Ap0P0FzptwxC2o3ypcltcQX5iuGgNmXiGZcf1EB+CTzdYj+zBiIOAJbz05TsXCWFF09aIO587VmGhyEyqJkwfsS0uYkeRxyrtHfacVaUffOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216054; c=relaxed/simple;
	bh=wSiMyiVZXJZVYcVK725oDVvDfADpdfHKIkl1o+Px7DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLjo9tpo/BJNKL5Tsfc8O9YMdlpK6GUlHtE3SydODUk5BE5G/lo8oVQScrjqv52BxrryZ6/aLYJ3gjopxalrAtyZtqtO99ytnjRibV2pQjVn8pqRxWJQ9PimRxneCV6QRHHt66BmxZgI5h9jsPIFjDpvfLat/ObkHVdF6eHYAXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0tDYhIv; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0tDYhIv"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b157c9ad12so354755885a.1;
        Tue, 29 Oct 2024 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730216051; x=1730820851; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=;
        b=C0tDYhIvq/A2hhhFMp/nQkcuOhJwa58s3Tfly9RORBrLCoLWKHd6fI27RxR8U9ZKCv
         DG3h8gvE57V/QvhmqYWty7KFg/MinCZzhMxKQa+pJUFOsWeMcWLsvvCMEJJN+s0LdCyw
         EkWLbODmUVCDU8bI/o0KMNOPJxsS5kFjXXo7Gdu5E+On+BG01U+yCeZb2yY8zOBXiD5f
         VU9tC/NHi2iQDNHG3/ScRaLAW0+DNrPQdaY73dH8WsHOQdsgL4BCCMN8TvCfrHh/pJBY
         o654oe/5Pc5gIv+HsbHvPTR3XBK0+iNLBRVRt99ooc3Reo+7iMR/3KzT6a9VR6Z87O4m
         GmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216051; x=1730820851;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=;
        b=uIdcSxG4XPUhv/ycdINh/KQnoxU3/6w+xKo8v8yvuabBCBOEBcesuz6SyQIfPAvJPx
         LuYE5RBd7rVgt6Hx/Xfhi3y1QHL6rsQI3PyjPv0rE1ecg8PxKXY7J2u69vmHQwi2gGh/
         trGyE1vfRlF844hNMFjAxzepCCGg9lU5vbidPv/To5jnYcGcaycOfKFsjl9gnI//gMsu
         sk2xsMwMiATEjKyjo2ETZEtPPbJlExNMvc2w4SjSV06KA5dLD2mO89tmFmmpdtbQAlw2
         9114hxZYexlNU3Y47g/Ph0QVGrcBPzWWioikU+NVS0Ux93F+9UVUtfqe4RfiHWlrOC8h
         sxxA==
X-Forwarded-Encrypted: i=1; AJvYcCVh/X4h1X2WRhQwzh0+4qEg2i/2DOCOUUxdh9QdNvOn3UZTHcXb81N2i9twZcXg0yNzUaPT@lists.linux.dev, AJvYcCXEuk0si2KA4MzSaEJqQY8LyJm9hEfyBISp+Bm3QhjGM/djT6LFXiT1737Vr+eYdEbYVL3dm4l3G9I=@lists.linux.dev
X-Gm-Message-State: AOJu0YycIGxQEwOYeSOqHIOoNYQqJXQOsoyivLPWUk7lDd+3xy4/QZut
	o7HgJJ2lXP+yXgU5D449yiWTTQp/ZEtpinifsUDk82OHtI0o9TMM
X-Google-Smtp-Source: AGHT+IFEK1Lj+KgPR7qF2SZIPbGWb1EluUys2IzUezoVVlhCBBeUjMF3gYTnyYnzfqeZ8MKMdnnF7w==
X-Received: by 2002:a05:620a:4456:b0:7a9:b8dd:eb96 with SMTP id af79cd13be357-7b193eff5camr1988254585a.30.1730216051027;
        Tue, 29 Oct 2024 08:34:11 -0700 (PDT)
Received: from crash.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d292c88sm429507285a.30.2024.10.29.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 08:34:10 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:34:08 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Huisong Li <lihuisong@huawei.com>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Mark Brown <broonie@kernel.org>, David Wu <david.wu@rock-chips.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>,
	Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <ZyEAcHVC3gXujNa9@crash.wifi.local.cmu.edu>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Tue, Oct 29, 2024 at 08:48:58AM +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

for LiteX,

Acked-by: Gabriel Somlo <gsomlo@gmail.com>

Thanks,
--Gabriel
