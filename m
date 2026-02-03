Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C431ED73
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 02:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770086874; cv=none; b=bEX3ARpR4nnJ16JZzfKnf+dPe6WzeXu8E2UpdiI8Ow5jFQ7Athmjd2QwZ39W6nqRexuwqKa51vlbmdboW/yPezxqoyfv0N0tSxS6EdycRN4pT/RKVtd+qsDPOZTZd1vTEzpbHP/oNzqYpmnM42Ik2VwCycFI10haw3oIcWUMMdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770086874; c=relaxed/simple;
	bh=opVN2Uy5CV1GyOyVv04l4w99A8x7CInPOUJcM14Wc7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubb2Jz+lQMjU0lMaUUmdIsiKbcfj/1aiT73PwhPpSWRKhHOE7osKvbci+Tr5stPDvv+F6MoSHcvn/ltJjy5t56xQh89eOmHECDElTEefO2TZ06IL+GdHJNZJZQaaFhULeW40oZgNqH2XaSFwMX+b2+zHbbhhLonePvmC02Q+nx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEhNaEWQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEhNaEWQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC805C116C6
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 02:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770086873;
	bh=opVN2Uy5CV1GyOyVv04l4w99A8x7CInPOUJcM14Wc7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gEhNaEWQ3W6ROodFhF7ErKOhdhy6mRaMbnVLTcMHhfpFX0VCFUKx+iIj/M0qzHsrM
	 vqieP3ibu8HNDf1pqNaw4fJZR9WeTwEN6ZIdm/sWca2UAn0VzreG4Q/tDU2CwWPOVx
	 r28sSa/gnuC713R+czp2k71vesp5lla5N6zsUG0UZf0ahc7Ce+VbjFOPTCeVbQPg/p
	 vGp4aTEIqJ1wmGW+pcdFf00XbdmyJFxer3DQQHwqw+nYSlNcW0nTrv8UunFI5aZPFS
	 zbzc7q4PQoc8Vq3HtaljA75uc0AakUjZOxNcSaXTpzkBpGbV58syNu+JQjqQpy3SLJ
	 pNQYcstQ6PXqQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8d7f22d405so810738266b.0
        for <loongarch@lists.linux.dev>; Mon, 02 Feb 2026 18:47:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXm8hYoV1QUcDSu8YYswoPdtE4TQ2Z60tV3BOI+ffKQYNG1sedPbR7hL9dUuClizhK5xjIYluHKvvA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrbAdxuFvaPqYv61NqM7kO48tCnYkqpED2B2oz7seImfCGgPNu
	gCg1qayD23UTYVIs0PQktUHDCnQQzc/f7+QLNndFX63MokUveQ4uVIWbl6SanTh+fLWU3liXYbx
	D+0/gj6GmeRZX2+O5YYe3ncYwSAMKjZk=
X-Received: by 2002:a17:906:478b:b0:b88:7568:26d5 with SMTP id
 a640c23a62f3a-b8dff5bf946mr825230966b.27.1770086872391; Mon, 02 Feb 2026
 18:47:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260201023700.366531-1-chenhuacai@loongson.cn> <4d1abb0c-e518-4751-b462-345ed76bb3f1@lunn.ch>
In-Reply-To: <4d1abb0c-e518-4751-b462-345ed76bb3f1@lunn.ch>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 3 Feb 2026 10:47:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7WwZM8Sg_E0Z0-+e6V-NtJA0r8Aiqw30TqH0_pyLKTdA@mail.gmail.com>
X-Gm-Features: AZwV_Qh1O3Zhzst3pqZnN_WRLwJiAXHYLEQSgCfKfN6tjdg68bwOz8eKRTnfKWA
Message-ID: <CAAhV-H7WwZM8Sg_E0Z0-+e6V-NtJA0r8Aiqw30TqH0_pyLKTdA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
To: Andrew Lunn <andrew@lunn.ch>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yanteng Si <si.yanteng@linux.dev>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Serge Semin <fancer.lancer@gmail.com>, loongarch@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrew,

On Tue, Feb 3, 2026 at 5:42=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Feb 01, 2026 at 10:37:00AM +0800, Huacai Chen wrote:
> > Current clk_csr_i setting of Loongson STMMAC (including LS7A1000/2000
> > and LS2K1000/2000/3000) are copy & paste from other drivers. In fact,
> > Loongson STMMAC use 125MHz clocks and need 62 freq division to within
> > 2.5MHz, meeting most PHY MDC requirement. So fix by setting clk_csr_i
> > to 100-150MHz.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Fixes tag?
OK, will add it.

>
> Does the error mean that MDC is ticking at 9.7Mhz? That is pretty fast
> for PHYs. But i assume it must work for some boards.
Yes, some PHYs work while others don't.

Huacai
>
> Separate to this fix, you might be interested in:
>
>   clock-frequency:
>     description:
>       Desired MDIO bus clock frequency in Hz. Values greater than IEEE 80=
2.3
>       defined 2.5MHz should only be used when all devices on the bus supp=
ort
>       the given clock speed.
>
> So you could allow faster MDC values using this property.
>
>     Andrew
>
> ---
> pw-bot: cr
