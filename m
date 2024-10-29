Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE161DFE0F;
	Tue, 29 Oct 2024 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192645; cv=none; b=CTU/jCUaG+PZAVQtXs8kB7xnvNYWR5N9RbADgsr6v75m8+oJ09oPrAsAs9aRESqTi0+u5pG8sCET7y8kdnG9gKWngSThPegTRvbzRrQbQUmsMxjGmakcgdhyLMZz8C8H1YZk1wnbhk9+P9/ZCjM3NKmLMBgqimwVu2Er+KGCef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192645; c=relaxed/simple;
	bh=IJe8ON7eBy5QAAgaLfm92pA+IoRN4Z1tGU93HN2HGcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flVqOiP3OaonDeTAg4BlOGnnK8eZa4j7HiRjqG535f4qkSOTrIzhxFJjXU/mdnW+CxNgNSMwL7YdlusKzoutkekLZbxx2QeIVf4DJECpa7/cdrId175tTacFB+AjHkNFv1MSPtSzFYTGKtMYrDtOS16Xc8b0ulhEMBNutVQFM9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WkhI/DVq; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WkhI/DVq"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C68791BF204;
	Tue, 29 Oct 2024 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730192635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hpAfK6tyrvwMS8L2PbzrGqnbfuzjHJrlMvInkHIHnZI=;
	b=WkhI/DVqn/dDgEGXg5ze24s00SnuWWK8bmgYFAQaSQSgHS/3+b0O5sNNKTStjAxR/jf+4h
	0o6b25F5CM6hzS4ApkL7rjJteF/3WsvIXr9Is7v7RNPDr1hM6SgZtytzIUP4gZ5dtlEpLg
	COgrRCbWe5DTxWzSVRzksGVJyb597rnqQCl5AJLLhtHIb4htqmGNuaCLmKvnbildk9oQPe
	IqjYlYEsv6PJq4Tpe9bBIT7sk8n1gJbWFWN3kIUiX2Dd+Sk2UHidAD1P51iPnXfsSARzVl
	nu+FDRAug3FdoWJxDLz5FVgjrXmtG+m82/IUNQdOKDRvvPwaBoAqjYk9s9Gx2w==
Date: Tue, 29 Oct 2024 10:03:47 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Qiang Zhao
 <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>, Imre
 Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>, Mateusz
 Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Yinbo
 Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Michal
 Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje.mihanovic@skole.hr>, Mark Brown <broonie@kernel.org>, David Wu
 <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Jay
 Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, Izhar Ameer Shaikh
 <izhar.ameer.shaikh@amd.com>, Naman Trivedi Manojbhai
 <naman.trivedimanojbhai@amd.com>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <20241029100347.542b56d4@bootlin.com>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Uwe,

On Tue, 29 Oct 2024 08:48:58 +0100
Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:

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
...
>  drivers/soc/fsl/qe/qmc.c                    | 2 +-
>  drivers/soc/fsl/qe/tsa.c                    | 2 +-

Acked-by: Herve Codina <herve.codina@bootlin.com> # for fsl/qe/{qmc,tsa}.c

Best regards,
Hervé
