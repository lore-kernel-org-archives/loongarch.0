Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB4D199FAB
	for <loongarch@lists.linux.dev>; Fri,  8 Aug 2025 03:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754622814; cv=none; b=qN6LOTH00n0nAmEVMs7LdAkSiCUoD7LqHHq5AL7VeQCUmfZJ1L71Okys9mza+Y1UmawXHxKlDoyeoaQw4D3HcZyzCYot0/qpE5jjOfQN0f7i1wRh2AtZk7D6OhnLCkzanoRCrOXhAFuIiYTMMKS7+/YM8K6cOgrm+CP/sEiRZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754622814; c=relaxed/simple;
	bh=M2svCFrDXkjKKYi7lyJS+vzN2iBzmGk07X29JJl0lbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLHBZkOwe2fEvWZ8mQ/YbV+wkz5cd47Gpd3mYNwm9G8ZRnNf4XX38Kete82fgrooP6KFi9eiE4npe0eGpeW+pETP+gYxedKSVF7+z2rrdvL3vVw1deSXfWb5KP8ahDqEXKfmvM2lfjkVx9ZlAujqhxpxZnQADaLwKonpfhrygYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DLpbEGKV; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DLpbEGKV"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0E05820BEF;
	Fri,  8 Aug 2025 05:13:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nI5PX0caIEJf; Fri,  8 Aug 2025 05:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754622803; bh=M2svCFrDXkjKKYi7lyJS+vzN2iBzmGk07X29JJl0lbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DLpbEGKVp2vfwL9ledhfyn4iDSHKLuTG+nBL1BcV34vqFSY8d9ypXMf7hokz8S65W
	 /fzcZyLNWRcEeGneCmPJRcPbFxEIbgAibU2pHbHHqAlJL1rzzHOQkrmgefprcNEx1I
	 qRvP3tipCDLiEMqmtRE02nNUBwzWvRWM8Vtu9r+2CVf3IRFsM+V4DOOVxknSq/QIap
	 8OMjP+rmXtTOxBcWTHZ4fIKcerzBDDv8s//vfhAM6nUUJeJJfRRUXBUZaKhpzOjLqL
	 FVYj+0Z0VIB5qTeg/UzjHrlUQwWsrfapkTlWxK8CC1gP8dqpz2A2zbOg6BErWlr7Gj
	 YFplW95DnW3nQ==
Date: Fri, 8 Aug 2025 03:13:03 +0000
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH v3 6/8] clk: loongson2: Add clock definitions for
 Loongson 2K0300 SoC
Message-ID: <aJVrP1kNfvx8k8r7@pie>
References: <20250805150147.25909-1-ziyao@disroot.org>
 <20250805150147.25909-7-ziyao@disroot.org>
 <CAAhV-H4=A=BaHsAKmTiS62gE6XQLD4rnYmU6snDFt1S0uMHr6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4=A=BaHsAKmTiS62gE6XQLD4rnYmU6snDFt1S0uMHr6A@mail.gmail.com>

On Thu, Aug 07, 2025 at 07:21:32PM +0800, Huacai Chen wrote:
> Hi, Yao,
> 
> On Tue, Aug 5, 2025 at 11:05 PM Yao Zi <ziyao@disroot.org> wrote:
> >
> > The clock controller of Loongson 2K0300 consists of three PLLs, requires
> > an 120MHz external reference clock to function, and generates clocks in
> > various frequencies for SoC peripherals.
> >
> > Clock definitions for previous SoC generations could be reused for most
> > clock hardwares. There're two gates marked as critical, clk_node_gate
> > and clk_boot_gate, which supply the CPU cores and the system
> > configuration bus. Disabling them leads to a SoC hang.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/clk-loongson2.c | 48 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
> > index 52a9f1c2794a..1d210a7683ea 100644
> > --- a/drivers/clk/clk-loongson2.c
> > +++ b/drivers/clk/clk-loongson2.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/io-64-nonatomic-lo-hi.h>
> >  #include <dt-bindings/clock/loongson,ls2k-clk.h>
> > +#include <dt-bindings/clock/loongson,ls2k0300-clk.h>
> >
> >  enum loongson2_clk_type {
> >         CLK_TYPE_PLL,
> > @@ -137,6 +138,52 @@ struct loongson2_clk_board_info {
> >                 .fixed_rate     = _rate,                        \
> >         }
> >
> > +static const struct loongson2_clk_board_info ls2k0300_clks[] = {
> > +       /* Reference Clock */
> > +       CLK_PLL(LS2K0300_PLL_NODE, "pll_node",   0x00, 15, 9, 8, 7),
> > +       CLK_PLL(LS2K0300_PLL_DDR,  "pll_ddr",    0x08, 15, 9, 8, 7),
> > +       CLK_PLL(LS2K0300_PLL_PIX,  "pll_pix",    0x10, 15, 9, 8, 7),
> > +       CLK_FIXED(LS2K0300_CLK_STABLE, "clk_stable", NULL, 100000000),
> > +       CLK_FIXED(LS2K0300_CLK_THSENS, "clk_thsens", NULL, 10000000),
> > +       /* Node PLL */
> > +       CLK_DIV(LS2K0300_CLK_NODE_DIV, "clk_node_div", "pll_node", 0x00, 24, 7),
> > +       CLK_DIV(LS2K0300_CLK_GMAC_DIV, "clk_gmac_div", "pll_node", 0x04, 0, 7),
> > +       CLK_DIV(LS2K0300_CLK_I2S_DIV,  "clk_i2s_div",  "pll_node", 0x04, 8, 7),
> > +       CLK_GATE(LS2K0300_CLK_NODE_PLL_GATE,   "clk_node_pll_gate", "clk_node_div", 0x00, 0),
> > +       CLK_GATE(LS2K0300_CLK_GMAC_GATE,       "clk_gmac_gate",     "clk_gmac_div", 0x00, 1),
> > +       CLK_GATE(LS2K0300_CLK_I2S_GATE,        "clk_i2s_gate",      "clk_i2s_div", 0x00, 2),
> > +       CLK_GATE_FLAGS(LS2K0300_CLK_NODE_GATE, "clk_node_gate",     "clk_node_scale",
> > +                      0x24, 0, CLK_IS_CRITICAL),
> There is no 80 chars limit now, so feel free to define a clock in one line.

Thanks, will merge definitions into a single line in the next version.

Best regards,
Yao Zi
